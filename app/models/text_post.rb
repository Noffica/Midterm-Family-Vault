class TextPost < ActiveRecord::Base

  validates   :title,
              presence: true,
              length: { maximum: 71 }

end
