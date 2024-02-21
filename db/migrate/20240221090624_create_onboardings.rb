class CreateOnboardings < ActiveRecord::Migration[7.0]
  def change
    create_table :onboardings do |t|
      t.integer :user_id
      t.boolean :passed, default: false

      t.timestamps
    end
  end
end
