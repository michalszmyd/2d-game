class AddAttachmentImageToTeleports < ActiveRecord::Migration[5.1]
  def self.up
    change_table :teleports do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :teleports, :image
  end
end
