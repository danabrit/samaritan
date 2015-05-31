class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string    :name
      t.text      :description
      t.datetime  :begin_time
      t.datetime  :end_time
      t.string    :location
      t.text      :supplies_required
      t.boolean   :children_allowed, default: false

      t.timestamps
    end
  end
end
