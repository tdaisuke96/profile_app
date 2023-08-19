class SkillDetail < ApplicationRecord
  belongs_to :user
  belongs_to :skill_category
  has_many :update_skill_histories, dependent: :destroy 
  validates :skill_name, presence: true
end
