class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :height
      t.integer :weight
      t.integer :gender #store true gender rather than guessed gender
      t.boolean :guess_correct #store whether guess was correct

      t.timestamps null: false
    end
  end
end
