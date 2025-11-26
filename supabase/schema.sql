-- Create the users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL, -- In a real application, this should be a hashed password
  wishlist_text TEXT,
  is_admin BOOLEAN DEFAULT FALSE
);

-- Create the pairs table
CREATE TABLE pairs (
  id SERIAL PRIMARY KEY,
  santa_id INTEGER REFERENCES users(id),
  receiver_id INTEGER REFERENCES users(id)
);

-- Create the messages table
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  sender_id INTEGER REFERENCES users(id),
  receiver_id INTEGER REFERENCES users(id),
  text TEXT,
  timestamp TIMESTAMPTZ DEFAULT NOW()
);

-- Insert the 12 users
INSERT INTO users (name, password, is_admin) VALUES
('Наталья', 'password123', FALSE),
('Наталия', 'password123', FALSE),
('Евгений', 'password123', FALSE),
('Андрей', 'password123', TRUE), -- Андрей is the admin
('Светлана', 'password123', FALSE),
('Эдуард', 'password123', FALSE),
('Виталий', 'password123', FALSE),
('Яна', 'password123', FALSE),
('Тамерлан', 'password123', FALSE),
('Ясмина', 'password123', FALSE),
('Александра', 'password123', FALSE),
('Галина', 'password123', FALSE);
