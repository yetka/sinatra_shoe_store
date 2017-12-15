class CreateShoeStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoe_stores) do |t|
      t.column(:store_name, :string)
      t.timestamps()
    end
  end
end
