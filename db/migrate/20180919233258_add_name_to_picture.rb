class AddNameToPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :name, :string
  end
end
