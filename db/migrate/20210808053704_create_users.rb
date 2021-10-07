class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_code
      t.string :name

      t.timestamps
    end
  end
end
