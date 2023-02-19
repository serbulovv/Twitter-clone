class CreateTweetsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :text, default: ""
      t.timestamps
    end
  end
end
