class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.text :answer_choice
      t.integer :question_id
    end
  end
end
