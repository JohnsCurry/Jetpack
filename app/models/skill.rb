class Skill < ActiveRecord::Base
  has_many :skill_categories
  has_many :categories, through: :skill_categories

end