class AddAttachmentBackgroundToWorlds < ActiveRecord::Migration[5.1]
  def self.up
    change_table :worlds do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :worlds, :background
  end
end
