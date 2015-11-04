require_relative "requires"

class Human < SQLObject
  has_many("cats", {model_class: "Cat"})
  belongs_to("house", {model_class: "house", foreign_key: "house_id"})
end
