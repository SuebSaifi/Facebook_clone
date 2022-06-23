class CreateFaceposts < ActiveRecord::Migration[6.1]
  def change
    create_table :faceposts do |t|
      t.text :post

      t.timestamps
    end
  end
end
