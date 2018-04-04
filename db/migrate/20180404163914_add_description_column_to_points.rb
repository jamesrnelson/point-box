class AddDescriptionColumnToPoints < ActiveRecord::Migration[5.1]
  def change
    add_column :points, :description, :text, default: 'n/a'
  end
end
