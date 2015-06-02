class AddSponsoringOrgToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :sponsoring_org, :string
  end
end
