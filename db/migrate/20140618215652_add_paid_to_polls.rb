class AddPaidToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :paid, :boolean, default: false
  end
end
