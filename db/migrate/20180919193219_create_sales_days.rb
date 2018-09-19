class CreateSalesDays < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_days do |t|
      t.date :sales_date
      t.integer :amount_spent
      t.integer :amount_sold
      t.references :market, foreign_key: true

      t.timestamps
    end
  end
end
