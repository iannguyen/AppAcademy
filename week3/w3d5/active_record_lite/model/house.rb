require_relative "requires"

class House < SQLObject
  has_many("humans", {model_class: "Human"})
end
