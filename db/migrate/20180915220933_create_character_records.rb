class CreateCharacterRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :character_records do |t|
      t.references :character, foreign_key: true
      t.references :actor, foreign_key: true

      t.timestamps
    end
  end
end
