class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
