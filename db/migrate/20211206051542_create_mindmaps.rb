class CreateMindmaps < ActiveRecord::Migration[6.1]
  def change
    create_table :mindmaps do |t|

      t.timestamps
    end
  end
end
