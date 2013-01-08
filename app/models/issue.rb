class Issue < ActiveRecord::Base
  attr_accessible :publication, :name, :asset
  has_attached_file :asset, :default_url => "/public/issue/:name/:name.zip"
  validates :name, presence: true, uniqueness: true
  validates :publication, presence: true
  validates :asset, presence: true
end
