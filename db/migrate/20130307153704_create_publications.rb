class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :name
      t.string :abbreviation
      t.string :url

      t.timestamps
    end
  end
end
