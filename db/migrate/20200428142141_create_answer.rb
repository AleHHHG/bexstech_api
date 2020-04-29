class CreateAnswer < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.string :user, null: false
      t.integer :like, default: 0
      t.belongs_to :question, foreign_key: true, null:false
      t.timestamps
    end
  end
end
