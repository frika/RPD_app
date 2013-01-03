class AddAttachmentAssetToIssues < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.attachment :asset
    end
  end

  def self.down
    drop_attached_file :issues, :asset
  end
end
