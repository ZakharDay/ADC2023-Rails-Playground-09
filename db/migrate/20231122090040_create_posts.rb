class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :type
      t.string :title
      t.text :body
      t.string :cover
      t.string :video

      t.timestamps
    end
  end
end
