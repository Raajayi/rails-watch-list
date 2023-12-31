class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_url
      t.decimal :rating
      t.text :overview

      t.timestamps
    end
  end
end
