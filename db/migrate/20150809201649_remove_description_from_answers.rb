class RemoveDescriptionFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :description, :text
  end
end
