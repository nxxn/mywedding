class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :storage => :s3,
                    :styles => { :content => '870>', :thumb => '118x100#' },
                    :convert_options => {:thumb => '-strip -interlace plane -quality 90', :content => '-strip -interlace plane -quality 90'},
                    :path => "article_pictures/:id/:style_:basename.:extension"

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
