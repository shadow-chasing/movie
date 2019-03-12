class AddIframeToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :iframe, :text
  end
end
