class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :score, default: 0
      t.integer :tier

      t.timestamps
    end
  end
end
