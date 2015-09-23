DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER REFERENCES users(id)
);

DROP TABLE IF EXISTS questions_follows;

CREATE TABLE questions_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER REFERENCES questions(id),
  user_id INTEGER REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER REFERENCES questions(id),
  parent_id INTEGER REFERENCES replies(id),
  user_id INTEGER REFERENCES user(id),
  body TEXT NOT NULL

);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  question_id INTEGER REFERENCES questions(id)
);


INSERT INTO
  users(fname, lname)
VALUES
  ('sven', 'ten haaf'), ('ian', 'nguyen')
;

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('dear eric', 'sven: why does sql suck?', (SELECT id FROM users WHERE fname = 'sven')),
  ('dear max', 'ian: why does sql suck?', (SELECT id FROM users WHERE fname = 'ian'))
;

INSERT INTO
  questions_follows(question_id, user_id)
VALUES
  (
    (SELECT id FROM questions WHERE body LIKE '%sven%'),
    (SELECT id FROM users WHERE fname = 'ian')
  ),
  (
    (SELECT id FROM questions WHERE body LIKE '%ian%'),
    (SELECT id FROM users WHERE fname = 'sven')
  )
  ;

INSERT INTO
  replies(question_id, user_id, parent_id, body)
VALUES
  (
    (SELECT id FROM questions WHERE body LIKE '%sven%'),
    (SELECT id FROM users WHERE fname = 'ian'),
    (NULL),
    ('I AGREE WITH YOU SVEN!')
  ),
  (
    (SELECT id FROM questions WHERE body LIKE '%ian%'),
    (SELECT id FROM users WHERE fname = 'sven'),
    (NULL),
    ('I AGREE WITH YOU IAN!')
  ),
  (
    (SELECT id FROM replies WHERE body LIKE '%ian%'),
    (SELECT id FROM users WHERE fname = 'sven'),
    (1),
    ('Thanks')
  )
  ;

  INSERT INTO
    question_likes(user_id, question_id)
  VALUES
    (
      (SELECT id FROM users WHERE fname = 'ian'),
      (SELECT id FROM questions WHERE body LIKE '%sven%')
    ),
    (
      (SELECT id FROM users WHERE fname = 'sven'),
      (SELECT id FROM questions WHERE body LIKE '%ian%')
    ),
    (
      (SELECT id FROM users WHERE fname = 'ian'),
      (SELECT id FROM questions WHERE body LIKE '%ian%')
    )
    ;
