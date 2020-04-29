class CreateQuestion < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.string :user, null: false
      t.timestamps
    end
  end
end
