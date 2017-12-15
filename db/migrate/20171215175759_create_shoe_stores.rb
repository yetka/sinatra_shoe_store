class CreateShoeStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoe_stores) do |t|
      t.column(:name, :string)
      t.timestamps()
    end
  end
end
