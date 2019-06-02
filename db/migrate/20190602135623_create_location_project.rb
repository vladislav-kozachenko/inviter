class CreateLocationProject < ActiveRecord::Migration[5.2]
  def change
    create_table :location_projects do |t|
      t.integer :project_id
      t.integer :location_id
    end
  end
end
