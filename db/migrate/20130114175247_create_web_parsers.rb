class CreateWebParsers < ActiveRecord::Migration
  def change
    create_table :web_parsers do |t|

      t.timestamps
    end
  end
end
