class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.decimal :backpacker_index
      t.belongs_to :country

      t.timestamps
    end
    add_index :cities, :country_id
  end
end
