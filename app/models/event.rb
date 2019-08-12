class Event < ApplicationRecord
	validates :start_date, 
		presence: true,
		:in_the_future?
  validates :duration,
    presence: true,
    numericality: { only_integer: true, greater_than: 0},
    :multiple_of_5?
  validates :title, 
  	presence: true, 
  	length: { in: 5..140 }
  validates :description, 
  	presence: true, 
  	length: { in: 20..1000 }
  validates :price, 
  	presence: true,
  	numericality: { only_integer: true,  in: 1..1000},
  validates :location, presence: true

	belongs_to :admin, class_name: "User"
	has_many :attendances
  has_many :participants, through: :attendances
end

def multiple_of_5?
	return self.duration % 5 == 0
end

def in_the_future?
	return self.start_date > Time.now
end
