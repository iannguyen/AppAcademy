class ResponseValidator < ActiveModel::EachValidator
  def validate_each(record, attribute_name, value)
    if record.sibling_responses.exists?(user_id: value)
      record.errors[attribute_name] << "Already answered question."
    end
    if record.poll_author == value
      record.errors[attribute_name] << "Can't answer own question."
    end
  end
end
