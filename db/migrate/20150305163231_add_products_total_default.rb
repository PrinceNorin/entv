class AddProductsTotalDefault < ActiveRecord::Migration
  def change
    change_column :products, :total, :integer, default: 0
  end
end
