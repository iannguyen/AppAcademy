require_relative "requires"

class Cat < SQLObject
  belongs_to("human", {model_class: "Human", foreign_key: "owner_id" })
end
