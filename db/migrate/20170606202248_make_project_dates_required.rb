class MakeProjectDatesRequired < ActiveRecord::Migration
  def change
    change_column :projects, :begin_time, :datetime, null: false
    change_column :projects, :end_time, :datetime, null: false
  end
end
