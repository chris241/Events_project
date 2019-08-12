class Attendance < ApplicationRecord
	belongs_to :participant, class_name: "User"
	belong_to :event
end
