class School < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
  validates :contact, presence: true, length: { maximum: 50 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: EMAIL_REGEX }
end
