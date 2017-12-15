class CreateShoeBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoe_brands) do |t|
      t.column(:name, :string)
      t.column(:price, :string)
      t.timestamps()
    end
  end
end
