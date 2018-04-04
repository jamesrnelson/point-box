class AddCostColumnToRewards < ActiveRecord::Migration[5.1]
  def change
    add_column :rewards, :cost, :integer
  end
end
