module HouseholdsHelper
  def prepare_occupant(occupant)
    occupant.contact_information ||= ContactInformation.new
    occupant
  end
end
