class User < ActiveRecord::Base
  acts_as_taggable

  has_many :references
  has_many :courses
  has_many :user_skills
  has_many :tags
  has_many :jobs
  #has_many :user_tags
  #has_many :tags, through: :user_tags
  has_secure_password

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
    self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  #def wrap(s, width=78)
  #  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1<br>").html_safe
  #end


  #end

end