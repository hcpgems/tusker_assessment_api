class CreateProspects < ActiveRecord::Migration[5.0]
  def change
    create_table :prospects do |t|
      t.string :contact
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
