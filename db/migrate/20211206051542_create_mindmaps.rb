class CreateMindmaps < ActiveRecord::Migration[6.1]
  def change
    create_table :mindmaps do |t|
      t.text :text
      t.timestamps
    end
  end
end
