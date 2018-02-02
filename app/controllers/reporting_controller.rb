class ReportingController < ApplicationController
  
  def weight_total
    @weight = ApplicationData.weight?
  end
  
  def update_weight
    begin 
      ApplicationData.weight = BigDecimal.new(params[:weight])
      flash[:notice]='Weight was successfully updated.' 
    rescue Exception => e
      flash[:error]=e.message 
    end
    redirect_to :controller => 'reporting', :action => :weight_total
  end
  
  def inactive_households
    @to_date = DateTime.now.prev_year.strftime("%Y-%m-%d")
        
    if(params.has_key? :to_date)
      @to_date = params[:to_date]
      
      conditions_string = 'max(food_parcels.date) <= :to_date'
      conditions_values = {:to_date => @to_date}         
                  
      if(params.has_key? :delete)
        records = Household.joins(:food_parcels)
                            .group("households.id")
                            .having(conditions_string, conditions_values).destroy_all 
        @deleted = records.length
      else
        join = Household.joins(:food_parcels)
                        .select("households.id, max(food_parcels.date) as last_parcel_date")
                        .group("households.id")
                        .having(conditions_string, conditions_values)
                        .order("last_parcel_date DESC")
                        
        @table = join.report_table(:all, :methods => :to_s, :only => [:last_parcel_date])
        @table.reorder("to_s", "last_parcel_date") unless @table.column_names.empty?      
        @table.column_names = ['Household', 'Last Parcel Date']
      end
    end
  end  
  
  def parcels_by_time_period
    @from_date = 1.month.ago.strftime("%Y-%m-%d") 
    @to_date = DateTime.now.strftime("%Y-%m-%d") 
        
    if(params.has_key? :from_date)
      @from_date = params[:from_date]
      if(params.has_key? :to_date)
        @to_date = params[:to_date]
      end
      
      conditions_string = 'date >= :from_date AND date <= :to_date'
      conditions_values = {:from_date => @from_date, :to_date => @to_date}         
      
      @table = FoodParcel.report_table(:all, :methods => :household_name, :only => [:date, :weight], 
                                        :conditions => [conditions_string, conditions_values])
      @table.reorder("household_name", "date", "weight") unless @table.column_names.empty?
      @table.column_names = ['Household', 'Date', 'Weight']

      @total_weight = FoodParcel.sum(:weight, :conditions => ['created_at >= :from_date AND created_at <= :to_date', 
                                             {:from_date => @from_date, :to_date => @to_date}])
      @parcel_count = @table.data.size
    end
  end

  def parcels_by_time_period_and_postcode
    @from_date = 1.month.ago.strftime("%Y-%m-%d") 
    @to_date = DateTime.now.strftime("%Y-%m-%d") 
    @postcode_pattern = params[:postcode_pattern]
    
    if(params.has_key? :postcode_pattern)
      if(params.has_key? :from_date)
        @from_date = params[:from_date]
      end
      
      if(params.has_key? :to_date)
        @to_date = params[:to_date]
      end
      
      join = FoodParcel.joins(:household).joins(:household => :address)
      
      conditions_string = 'food_parcels.created_at >= :from_date AND food_parcels.created_at <= :to_date AND addresses.postcode LIKE :postcode_pattern'
      conditions_values = {:from_date => @from_date, :to_date => @to_date, :postcode_pattern => @postcode_pattern}
            
      @table = join.report_table(:all, :methods => :household_name, :only => [:date, :weight], 
                                        :conditions => [conditions_string, conditions_values])

      @table.reorder("household_name", "date", "weight") unless @table.column_names.empty?
      @table.column_names = ['Household', 'Date', 'Weight']

      @total_weight = join.sum(:weight, :conditions => [conditions_string, conditions_values])
      @parcel_count = @table.data.size
    end
  end

  def households_with_multiple_parcels_by_time_period
    @from_date = 1.month.ago.strftime("%Y-%m-%d") 
    @to_date = DateTime.now.strftime("%Y-%m-%d") 
    
    if(params.has_key? :from_date)
      @from_date = params[:from_date]
      if(params.has_key? :to_date)
        @to_date = params[:to_date]
      end
      
      conditions_string = 'food_parcels.created_at >= :from_date AND food_parcels.created_at <= :to_date'
      conditions_values = {:from_date => @from_date, :to_date => @to_date}
      join = Household.joins(:food_parcels).select("households.id, count(food_parcels.id) as food_parcels_count").where(conditions_string, conditions_values).group("households.id").having("count(food_parcels.id)>1")
      join.each do |household|
        count = household.food_parcels_count
        household.reload
        household.food_parcels_count = count
      end
      
      
      @table = join.report_table(:all, :methods => :to_s, :only => [:food_parcels_count])

      @table.reorder("to_s", "food_parcels_count") unless @table.column_names.empty?
      @table.column_names = ['Household', 'Food Parcels Count']
    end
  end
  
  def food_donations_by_time_period
    @from_date = 1.month.ago.strftime("%Y-%m-%d") 
    @to_date = DateTime.now.strftime("%Y-%m-%d")
    @donors = Donor.order(:name).all.collect {|p| [ p.name, p.id ] }
    
    if(params.has_key? :from_date)
      @from_date = params[:from_date]
      if(params.has_key? :to_date)
        @to_date = params[:to_date]
      end      
      conditions_string = 'food_donations.created_at >= :from_date AND food_donations.created_at <= :to_date'
      conditions_values = {:from_date => @from_date + " 00:00:00", :to_date => @to_date + " 23:59:59"}
      
      if(params.has_key? :donor)
        @donor = params[:donor]
        if(!@donor.empty?)
          conditions_string = conditions_string + " AND donors.id = :donor"
          conditions_values[:donor] = @donor
        end
      end
      
      join = Donor.joins(:food_donations).select("donors.id as id, donors.name as donor_name, count(food_donations.id) as food_donations_count, sum(food_donations.weight) as weight").where(conditions_string, conditions_values).group("donors.id").having("count(food_donations.id)>0").order("weight DESC, food_donations_count DESC")
      
      
      @table = join.report_table(:all, :only => [:donor_name, :food_donations_count, :weight])
      @table.column_names = ['Donor', 'Food Donations Count', 'Weight']
      total_count = @table.column('Food Donations Count').inject(0) {|sum, x| sum + x.to_i }
      total_weight = @table.column('Weight').inject(0) {|sum, x| sum + x.to_d }
      @table << { 'Food Donations Count' => total_count, 'Weight' => total_weight}

    end
      
  end
  
  def food_donations_by_donor
    @from_date = 1.month.ago.strftime("%Y-%m-%d") 
    @to_date = DateTime.now.strftime("%Y-%m-%d")
    @donors = Donor.order(:name).all.collect {|p| [ p.name, p.id ] }
    @donor = @donors[0]
    
    if(params.has_key? :donor)
      @donor = params[:donor]
      
      if(params.has_key? :from_date)
        @from_date = params[:from_date]
      end      
      if(params.has_key? :to_date)
        @to_date = params[:to_date]
      end
      
      conditions_string = 'food_donations.created_at >= :from_date AND food_donations.created_at <= :to_date  AND food_donations.donor_id = :donor'
      conditions_values = {:from_date => @from_date + " 00:00:00", :to_date => @to_date + " 23:59:59", :donor => @donor}

      @table = FoodDonation.report_table(:all, :only => [:donated, :weight], :conditions => [conditions_string, conditions_values])
      @table.column_names = ['Date', 'Weight']
    end
      
  end
  
  
end
