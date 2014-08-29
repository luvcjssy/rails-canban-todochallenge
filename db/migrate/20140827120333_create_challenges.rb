class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.date :starts_on
      t.string :code
      t.string :description, :limit => 500
      t.integer :creator_id

      t.timestamps
    end
  end
end
