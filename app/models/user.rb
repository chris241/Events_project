class User < ApplicationRecord
	has_many :events, foreign_key: 'admin_id'
	has_many :attendances, foreign_key: 'participant_id_id'
  has_many :events, through: :attendances

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def name
  	return "#{first_name} #{last_name}"
  end
end
