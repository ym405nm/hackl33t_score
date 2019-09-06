class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :result

      t.timestamps
    end
  end
end
