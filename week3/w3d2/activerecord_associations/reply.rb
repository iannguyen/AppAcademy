class Reply
  def self.find_by_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
      SQL

    results.map { |result| self.new(result) }
  end

  def self.find_by_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id).first
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
      SQL

    self.new(results)
  end

  def initialize(attributes)
    @id = attributes["id"]
    @question_id = attributes["question_id"]
    @parent_id = attributes["parent_id"]
    @user_id = attributes["user_id"]
    @body = attributes["body"]
  end

  def author
    results = QuestionsDatabase.instance.execute(<<-SQL).first
      SELECT
        fname, lname
      FROM
        users
      WHERE
        id = #{@user_id}
    SQL
  end

  def question
    results = QuestionsDatabase.instance.execute(<<-SQL).first
      SELECT
        title
      FROM
        questions
      WHERE
        id = #{@question_id}
    SQL
  end

  def parent_reply
    # return nil unless results
    results = QuestionsDatabase.instance.execute(<<-SQL, id: @parent_id).first
      SELECT
        body
      FROM
        replies
      WHERE
        id = :id
    SQL
  end

  def child_replies
    results = QuestionsDatabase.instance.execute(<<-SQL, id: @id).first
      SELECT
        body
      FROM
        replies
      WHERE
        parent_id = :id
    SQL
  end

end
