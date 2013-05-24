class AddAttachmentImageToCities < ActiveRecord::Migration
  def self.up
    change_table :cities do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :cities, :image
  end
end
