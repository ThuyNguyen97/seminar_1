class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, default: "my_email"
      t.integer :update_times, default: 0

      t.timestamps
    end
  end
end
