class AddAttachmentAssetToWebIssues < ActiveRecord::Migration
  def self.up
    change_table :web_issues do |t|
      t.attachment :asset
    end
  end

  def self.down
    drop_attached_file :web_issues, :asset
  end
end
