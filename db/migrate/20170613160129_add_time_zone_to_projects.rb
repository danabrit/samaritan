class AddTimeZoneToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :time_zone, :string, null: false
  end
end
