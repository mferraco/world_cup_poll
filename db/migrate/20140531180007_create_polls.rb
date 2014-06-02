class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :user_id
      t.integer :tiebreaker
      t.string :tier1team1
      t.string :tier1team2
      t.string :tier2team1
      t.string :tier2team2
      t.string :tier3team1
      t.string :tier3team2
      t.string :tier4team1
      t.string :tier4team2
      t.string :player1
      t.string :player2
      t.string :name
      t.integer :player1_score, default: 0
      t.integer :player2_score, default: 0
      t.integer :group_score, default: 0
      t.integer :advance_from_group, default: 0
      t.integer :quarterfinal_score, default: 0
      t.integer :semifinal_score, default: 0
      t.integer :championship_score, default: 0
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
