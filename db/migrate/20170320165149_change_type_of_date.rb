class ChangeTypeOfDate < ActiveRecord::Migration[5.0]
  def change
    def self.up
      change_column :posts, :date, :text
    end

    def self.down
      change_column :posts, :date, :date
    end
  end
end
