class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :date
      t.text :description
      t.text :image
      t.text :byline

      t.timestamps
    end
  end
end
