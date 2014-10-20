class AddAttachmentImageToMentions < ActiveRecord::Migration
  def self.up
    change_table :mentions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :mentions, :image
  end
end
