class CreateWellistVendors < ActiveRecord::Migration
  def change
    create_table :wellist_vendors do |t|
      t.references :wellist, index: true, foreign_key: true
      t.references :vendor, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
