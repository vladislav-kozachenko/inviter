class CreateLocationProject < ActiveRecord::Migration[5.2]
  def change
    create_table :locations_projects do |t|
      t.references :project, index: true
      t.references :location, index: true
    end
  end
end
