class Resume < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true
end
