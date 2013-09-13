class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset
      t.references :car
      
      t.timestamps
    end

    remove_column :cars, :asset
  end
end
