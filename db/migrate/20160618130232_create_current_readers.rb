class CreateCurrentReaders < ActiveRecord::Migration
  def change
    create_table :current_readers do |t|
      t.string :name
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
