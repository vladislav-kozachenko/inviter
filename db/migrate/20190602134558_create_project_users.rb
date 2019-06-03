class CreateProjectUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_users do |t|
      t.references :project, index: true
      t.references :user, index: true
      t.integer :user_role

      t.timestamps
    end
  end
end
