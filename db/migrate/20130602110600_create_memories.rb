class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :description
      t.string :priority

      t.timestamps
    end
  end
end
