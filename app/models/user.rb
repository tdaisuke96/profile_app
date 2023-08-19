class User < ApplicationRecord
  has_many :skill_details
  has_secure_password
  validates :self_introduction, presence: true, length: {minimum: 200, maximum: 799 }
end
