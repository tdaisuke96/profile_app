class User < ApplicationRecord
  has_many :skill_details
  has_secure_password
end
