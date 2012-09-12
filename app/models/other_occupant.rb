class OtherOccupant < Occupant
  RELATIONSHIP = { spouse: 0, partner: 1, child: 2, dependant: 3, other: 4 }
  
  belongs_to :household
  
  def self.RELATIONSHIP 
    RELATIONSHIP
  end
  
  def relationship_to_primary
    RELATIONSHIP.key(read_attribute(:relationship_to_primary))
  end
  
  def relationship_to_primary=(r)
    write_attribute(:relationship_to_primary, RELATIONSHIP[r])
  end
  
  attr_accessible :relationship_to_primary
end
