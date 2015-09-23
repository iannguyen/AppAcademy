# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  SEX = ['M','F']
  COLORS = ['blue', 'black', 'yellow', 'orange', 'white', 'maroon', 'green']

  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLORS,
    message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: SEX,
    message: "Cat must be Male or Female" }

  has_many(
    :rental_requests,
    class_name: "CatRentalRequest",
    foreign_key: :cat_id,
    primary_key: :id
  )
    def age
      Time.now.year - self.birth_date.year
    end

end
