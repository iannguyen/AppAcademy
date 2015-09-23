class QuestionLike


  def self.most_liked_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        title, COUNT(questions.id)
      FROM
        question_likes
      LEFT OUTER JOIN
        questions ON questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(questions.id) DESC
    SQL
    results.take(n)
  end


  def self.liked_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
    SELECT
      title
    FROM
      question_likes ql
    JOIN
      questions q ON ql.question_id = q.id
    WHERE
      ql.user_id = #{user_id}
    SQL
  end


  def self.likers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        fname, lname
      FROM
        question_likes
      JOIN
        users ON question_likes.user_id = users.id
      WHERE
        question_likes.question_id = #{question_id}
      -- GROUP BY
      --   questions.id
    SQL

  end

  def self.num_likes_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        COUNT(questions.id)
      FROM
        question_likes
      LEFT OUTER JOIN
        questions ON questions.id = question_likes.question_id
      WHERE
        questions.id = #{question_id}
      GROUP BY
        questions.id
      ORDER BY
        COUNT(questions.id) DESC
    SQL
    results.first.values.first
  end


end
