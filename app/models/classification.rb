class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    Classification.all
  end

  def self.longest
    Classification.joins(:boats).where("boats.length = ?", Boat.maximum(:length))
  end
end
