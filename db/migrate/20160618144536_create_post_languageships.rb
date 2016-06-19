class CreatePostLanguageships < ActiveRecord::Migration
  def change
    create_table :post_languageships do |t|
      t.integer :post_id
      t.integer :language_id

      t.timestamps null: false
    end
  end
end
