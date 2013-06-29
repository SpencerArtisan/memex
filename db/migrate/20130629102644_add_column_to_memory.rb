class AddColumnToMemory < ActiveRecord::Migration
  def change
    add_column :memories, :status, :string
  end
end
