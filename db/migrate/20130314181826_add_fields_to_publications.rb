class AddFieldsToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :wp_version, :string
    add_column :publications, :default_author, :string
  end
end
