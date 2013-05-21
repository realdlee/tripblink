class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.belongs_to :region
      t.string :name

      t.timestamps
    end
    add_index :countries, :region_id
  end
end
