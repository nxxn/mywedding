class Work < ActiveRecord::Base

  has_attached_file :work_image,
                    :storage => :s3,
                    :styles => { :medium => "360x216#" },
                    :convert_options => {:medium => '-strip -interlace plane -quality 90'},
                    :path => "work_images/:id.:style.:extension"

  validates_attachment_content_type :work_image, :content_type => /\Aimage\/.*\Z/

  has_many :wishes
  has_many :greetings

  accepts_nested_attributes_for :wishes, allow_destroy: true

end
