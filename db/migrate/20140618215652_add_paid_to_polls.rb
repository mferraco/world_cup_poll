class AddPaidToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :paid, :boolean, default: true
  end
end
