class CreateTableCarsTags < ActiveRecord::Migration
  def change
    create_table :table_cars_tags do |t|
       t.string :name
    end

    create_table :cars_tags, :id => false do |t|
      t.integer :tag_id, :car_id
    end
  end
end
