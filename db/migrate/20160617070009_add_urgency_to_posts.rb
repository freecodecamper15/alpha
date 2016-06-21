class AddUrgencyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :urgency, :integer
  end
end
