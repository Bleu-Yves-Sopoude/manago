class ChangeIconColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories, :icone, :icon
  end
end
