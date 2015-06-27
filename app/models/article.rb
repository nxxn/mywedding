class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_taggable

  has_attached_file :main_image,
                    :storage => :s3,
                    :styles => { :medium => "240x135#", :thumb => "90x30#", :original => "870x300#" },
                    :convert_options => {:thumb => '-strip -interlace plane -quality 90', :medium => '-strip -interlace plane -quality 90', :original => '-strip -interlace plane -quality 90'},
                    :path => "article_images/:id.:style.:extension"

  validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\Z/

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end

  def to_param
    "#{slug}"
  end

end
