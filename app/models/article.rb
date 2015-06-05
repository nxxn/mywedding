class Article < ActiveRecord::Base
  translates :title, :text

  has_attached_file :main_image,
                    :storage => :s3,
                    :styles => { :medium => "300x100#", :thumb => "90x30#", :original => "900x300#" },
                    :convert_options => {:thumb => '-strip -interlace plane -quality 90', :medium => '-strip -interlace plane -quality 90', :original => '-strip -interlace plane -quality 60'},
                    :path => "article_images/:id.:style.:extension"

  validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\Z/

end
