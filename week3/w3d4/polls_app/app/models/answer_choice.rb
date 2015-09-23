# == Schema Information
#
# Table name: answer_choices
#
#  id            :integer          not null, primary key
#  answer_choice :text
#  question_id   :integer
#

class AnswerChoice < ActiveRecord::Base
  validates :answer_choice, presence: true

  belongs_to(
    :question,
    class_name: "Question",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

end
