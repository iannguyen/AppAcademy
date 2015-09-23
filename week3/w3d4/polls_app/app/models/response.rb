# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#
require_dependency('../validators/response_validator.rb')

class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validates :user_id, :response => true

  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one :question, through: :answer_choice, source: :question
  has_one :poll, through: :question, source: :poll
  has_one :poll_author, through: :poll, source: :author

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

end
