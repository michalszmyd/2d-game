class AddAttachmentTemplateToHeroRoles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :hero_roles do |t|
      t.attachment :template
    end
  end

  def self.down
    remove_attachment :hero_roles, :template
  end
end
