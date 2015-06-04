class Article < ActiveRecord::Base
  translates :title, :text
end
