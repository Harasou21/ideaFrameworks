class CreateMandalarts < ActiveRecord::Migration[6.1]
  def change
    create_table :mandalarts do |t|
      t.text :text
      t.timestamps
    end
  end
end
