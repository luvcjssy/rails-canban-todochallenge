class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :type
      t.integer :point
      t.integer :challenge_id

      t.timestamps
    end
  end
end
