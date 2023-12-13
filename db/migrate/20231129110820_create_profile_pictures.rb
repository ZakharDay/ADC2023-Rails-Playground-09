class CreateProfilePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_pictures do |t|
      t.string :image
      t.integer :profile_id

      t.timestamps
    end
  end
end
