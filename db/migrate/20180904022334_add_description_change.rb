class AddDescriptionChange < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :descrpition, :text
  end
end
