class CreateShoeBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoe_brands) do |t|
      t.column(:brand_name, :string)
      t.column(:brand_price, :string)
      t.timestamps()
    end
  end
end
