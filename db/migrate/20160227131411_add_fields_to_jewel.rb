class AddFieldsToJewel < ActiveRecord::Migration
  def change
    add_column :jewels, :latitude, :float
    add_column :jewels, :longitude, :float
  end
end
