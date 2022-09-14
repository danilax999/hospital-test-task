class CreateDoctorCategoriesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_categories do |t|
      t.belongs_to :doctor, foreign_key: { to_table: :users }
      # t.belongs_to :category, foreign_key: { to_table: :doctor_categories }, type: :string
      t.string :category_name, null: false
      t.index :category_name
    end
  end
end
