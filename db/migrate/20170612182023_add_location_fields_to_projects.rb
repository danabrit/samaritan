class AddLocationFieldsToProjects < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :location, :address_1
    add_column :projects, :address_2, :string
    add_column :projects, :city, :string
    add_column :projects, :region, :string
    add_column :projects, :postal_code, :string
    add_column :projects, :country, :string
  end
end
