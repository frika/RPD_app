class CreateHtmlParses < ActiveRecord::Migration
  def change
    create_table :html_parses do |t|

      t.timestamps
    end
  end
end
