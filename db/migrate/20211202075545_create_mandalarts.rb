class CreateMandalarts < ActiveRecord::Migration[6.1]
  def change
    create_table :mandalarts do |t|
      t.text
      t.timestamps
    end
  end
end
