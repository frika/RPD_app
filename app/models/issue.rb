class Issue < ActiveRecord::Base
  attr_accessible :publication, :name, :asset
  has_attached_file :asset, :default_url => "/public/issue/:name/:name.zip"
end
