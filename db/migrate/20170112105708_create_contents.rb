class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :code

      t.timestamps
    end
    add_index :contents, :code, unique: true
  end
end
