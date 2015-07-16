class TextPost < ActiveRecord::Base

  belongs_to :user
  belongs_to :vault
  
  validates   :title,
              presence: true,
              length: { maximum: 71 }

end
