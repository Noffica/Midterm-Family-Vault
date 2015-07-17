class PhotoPost < ActiveRecord::Base

  belongs_to :user
  belongs_to :vault
  
  validates   :caption,
              presence: true,
              length: { maximum: 71 }

  validates   :file_path,
              presence: true

  mount_uploader :file_path, Uploader
end