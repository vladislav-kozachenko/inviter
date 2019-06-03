class CreateLocationUser < ActiveRecord::Migration[5.2]
  def change
    create_table :locations_users do |t|
      t.references :user, index: true
      t.references :location, index: true
    end
  end
end
