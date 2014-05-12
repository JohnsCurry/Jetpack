class Skill < ActiveRecord::Base
  acts_as_taggable
  has_many :skill_categories
  has_many :categories, through: :skill_categories

end