class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :tier1_team1
      t.integer :tier1_team2
      t.integer :tier2_team1
      t.integer :tier2_team2
      t.integer :tier3_team1
      t.integer :tier3_team2
      t.integer :tier4_team1
      t.integer :tier4_team2
      t.integer :player1
      t.integer :player2
      t.integer :tiebreaker
      t.integer :user_id

      t.timestamps
    end
  end
end
