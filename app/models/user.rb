class User < ApplicationRecord
	has_many :events, foreign_key: 'admin_id'
	has_many :attendances, foreign_key: 'participant_id_id'
  has_many :events, through: :attendances
end
