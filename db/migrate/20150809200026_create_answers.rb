class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.text :description

      t.belongs_to :question

      t.timestamps null: false
    end
  end
end
