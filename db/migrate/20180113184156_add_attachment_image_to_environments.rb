class AddAttachmentImageToEnvironments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :environments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :environments, :image
  end
end
