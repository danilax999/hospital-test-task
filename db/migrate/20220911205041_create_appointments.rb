class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: { to_table: :users }
      t.references :doctor, null: false, foreign_key: { to_table: :users }
      t.boolean :closed, null: false, default: false
      t.text :recommendation, null: false, default: ''

      t.timestamps
    end
  end
end
