class Question


  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id).first
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    self.new(results)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.find_by_author_id(author_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, author_id).first
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

    self.new(results)
  end

  def initialize(attributes)
    @id = attributes['id']
    @title = attributes['title']
    @body = attributes['body']
    @author_id = attributes['author_id']
  end

  def author
    results = QuestionsDatabase.instance.execute(<<-SQL).first
      SELECT
        fname, lname
      FROM
        users
      WHERE
        id = #{@author_id}
    SQL
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end


end
