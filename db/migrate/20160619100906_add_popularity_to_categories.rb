class AddPopularityToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :popularity, :integer
  end
end
