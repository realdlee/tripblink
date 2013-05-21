class AddAttachmentImageToCountries < ActiveRecord::Migration
  def self.up
    change_table :countries do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :countries, :image
  end
end
