class CreateMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :markets do |t|
      t.string :name
      t.string :street_address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
