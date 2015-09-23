class User
  def self.find_by_name(fname, lname)
    results = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND
        lname = ?
      SQL
    return nil if results.empty?
    self.new(results.first)
  end

  def initialize(attributes)
    @id = attributes["id"]
    @fname = attributes["fname"]
    @lname = attributes["lname"]

    # @id, @fname = attributes.values_at('id', )
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    
  end

end
