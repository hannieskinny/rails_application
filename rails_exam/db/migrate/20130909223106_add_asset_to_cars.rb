class AddAssetToCars < ActiveRecord::Migration
  def change
    add_column :cars, :asset, :string
  end
end
