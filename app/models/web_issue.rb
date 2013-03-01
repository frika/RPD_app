class WebIssue < ActiveRecord::Base
  attr_accessible :name, :publication, :asset
  attr_accessor :wordpress_url, :login_name, :access_pw
  has_attached_file :asset, :default_url => "/public/issue/:name/:name.zip"
  validates :name, presence: true, uniqueness: true
  validates :publication, presence: true
  validates :asset, presence: true
end
