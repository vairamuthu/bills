class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :name
      t.boolean :status
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
