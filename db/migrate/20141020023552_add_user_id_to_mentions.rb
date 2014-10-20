class AddUserIdToMentions < ActiveRecord::Migration
  def change
    add_column :mentions, :user_id, :integer
    add_index :mentions, :user_id
  end
end
