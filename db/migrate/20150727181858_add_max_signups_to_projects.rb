class AddMaxSignupsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :max_signups, :integer
  end
end
