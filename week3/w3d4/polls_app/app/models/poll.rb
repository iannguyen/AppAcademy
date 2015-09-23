# == Schema Information
#
# Table name: polls
#
#  id        :integer          not null, primary key
#  title     :string           not null
#  author_id :integer
#

class Poll < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true


  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :questions,
    class_name: "Question",
    foreign_key: :poll_id,
    primary_key: :id
  )
end
