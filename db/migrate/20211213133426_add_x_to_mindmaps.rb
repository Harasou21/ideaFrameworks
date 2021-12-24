class AddXToMindmaps < ActiveRecord::Migration[6.1]
  def change
    add_column :mindmaps, :x, :integer
    add_column :mindmaps, :y, :integer
  end
end
