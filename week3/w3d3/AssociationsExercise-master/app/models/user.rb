class User < ActiveRecord::Base

  validates :email, :presence => true, :email => true

  has_many :enrolled_courses,
    :through => :enrollments,
    :source => :course

  has_many :enrollments,
    class_name: "Enrollment",
    foreign_key: :student_id,
    primary_key: :id



end
