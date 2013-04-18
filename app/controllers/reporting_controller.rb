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
  
end
