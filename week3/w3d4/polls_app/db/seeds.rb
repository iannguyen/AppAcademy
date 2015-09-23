# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create!(user_name: "Patrick")
user2 = User.create!(user_name: "Ian")
poll1 = Poll.create!(title: "Favorite color.", author_id: user1.id)
question1 = Question.create!(text: "What is your favorite color?", poll_id: poll1.id)
answer_choice1 = AnswerChoice.create!(answer_choice: "Blue",  question_id: question1.id)
answer_choice2 = AnswerChoice.create!(answer_choice: "Red",   question_id: question1.id)
answer_choice3 = AnswerChoice.create!(answer_choice: "Green", question_id: question1.id)
response1 = Response.create!(user_id: user1.id, answer_choice_id: answer_choice1.id)
response2 = Response.create!(user_id: user2.id, answer_choice_id: answer_choice3.id)
