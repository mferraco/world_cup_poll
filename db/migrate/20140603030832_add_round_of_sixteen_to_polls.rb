class AddRoundOfSixteenToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :round_of_sixteen, :integer, default: 0
  end
end
