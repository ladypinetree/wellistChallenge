class AddWellistToVendor < ActiveRecord::Migration
  def change
    add_reference :vendors, :wellist, index: true, foreign_key: true
  end
end
