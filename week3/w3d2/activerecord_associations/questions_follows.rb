class QuestionFollow

  def self.most_followed_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        title, COUNT(questions.id)
      FROM
        questions_follows
      LEFT OUTER JOIN
        questions ON questions.id = questions_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(questions.id) DESC
    SQL
    results.take(n)
  end

  def self.followers_for_question_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        fname, lname
      FROM
        questions
      JOIN
        questions_follows ON questions.id = questions_follows.question_id
      JOIN
        users ON questions_follows.user_id = users.id
      WHERE
        questions.id = #{id}
    SQL

    results.map { |result| User.new(result)}
  end

  def self.followed_questions_for_user_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        title
      FROM
        questions
      JOIN
        questions_follows ON questions.id = questions_follows.question_id
      JOIN
        users ON questions_follows.user_id = users.id
      WHERE
        users.id = #{id}
    SQL

    results.map { |result| Question.new(result)}
  end
end
