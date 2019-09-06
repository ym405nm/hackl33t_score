class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :image_url
      t.string :answer
      t.text :description

      t.timestamps
    end
  end
end
