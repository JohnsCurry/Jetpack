class Job < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?


  #def bydistance
    
  #  distance = params[:something]
     
  #end


  # has_many :tags
  #has_many :job_tags
  #has_many :tags, through: :job_tags
end