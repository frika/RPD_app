class CreateWebIssues < ActiveRecord::Migration
  def change
    create_table :web_issues do |t|
      t.string :publication
      t.string :name

      t.timestamps
    end
  end
end
