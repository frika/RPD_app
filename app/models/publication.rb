class Publication < ActiveRecord::Base
  attr_accessible :abbreviation, :name, :url, :wp_version, :default_author
end
