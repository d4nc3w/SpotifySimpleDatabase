
--------------------------------------------------------------------------------------------------------
-- Insert data into Person table
INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES
  ('101', 'John', 'Smith', '1980-04-15'),
  ('102', 'Emma', 'Johnson', '1975-09-20'),
  ('103', 'Daniel', 'Williams', '1982-06-10'),
  ('104', 'Sophie', 'Brown', '1978-12-28'),
  ('105', 'Michael', 'Anderson', '1985-07-02'),
  ('001', 'Emily', 'Davis', '1990-05-15'),
  ('002', 'David', 'Martinez', '1987-09-20'),
  ('003', 'Olivia', 'Garcia', '1992-03-10'),
  ('004', 'William', 'Rodriguez', '1980-12-28'),
  ('005', 'Sophia', 'Lopez', '1989-07-02'),
  ('201', 'Mark', 'Wilson', '1995-01-18'),
  ('202', 'Chloe', 'Gonzalez', '1998-11-02'),
  ('203', 'Ryan', 'Hernandez', '1993-08-20'),
  ('204', 'Grace', 'Rivera', '1997-04-07'),
  ('205', 'James', 'Perez', '1996-10-12');

-- Inserting data into Language table
INSERT INTO Language (ID, Name)
VALUES
  (1, 'English'),
  (2, 'Spanish'),
  (3, 'Polish'),
  (4, 'German'),
  (5, 'Japanese');

-- Inserting data into Genre Table
INSERT INTO Genre (ID, Name)
VALUES
  (1, 'Pop'),
  (2, 'Rock'),
  (3, 'Hip Hop'),
  (4, 'Jazz'),
  (5, 'Electronic');

-- Inserting data into Country table
INSERT INTO Country (ID, Name, Language_ID)
VALUES
  (1, 'United States', 1),
  (2, 'United Kingdom', 1),
  (3, 'Canada', 1),
  (4, 'Australia', 1),
  (5, 'Poland', 3);

-- Adding Artists
INSERT INTO Artist (Person, ArtistName, Country)
VALUES
  ('001', 'Emily Davis', 1),
  ('002', 'David Martinez', 2),
  ('003', 'Olivia Garcia', 3),
  ('004', 'William Rodriguez', 4),
  ('005', 'Sophia Lopez', 5);

-- Adding Producers
INSERT INTO Producer (Person, ProducerName)
VALUES
  ('101', 'John Smith'),
  ('102', 'Emma Johnson'),
  ('103', 'Daniel Williams'),
  ('104', 'Sophie Brown'),
  ('105', 'Michael Anderson');

-- Adding Users
INSERT INTO "User" (Person, AccountName)
VALUES
  ('201', 'MarkWilson94'),
  ('202', 'ChloeGonzalez98'),
  ('203', 'RyanHernandez93'),
  ('204', 'GraceRivera97'),
  ('205', 'JamesPerez96');

-- Creating Playlists
INSERT INTO Playlist (ID, PlaylistName, User_Person)
VALUES
  (1, 'Relaxation Station', '201'),
  (2, 'Lets go Gym', '202'),
  (3, 'Late Night', '203');

-- Adding Albums
INSERT INTO MusicAlbum (ID, AlbumTitle, ReleaseDate, Genre, Artist_Person)
VALUES
  (1, 'Greatest Hits', '2022-01-01', 1, '001'),
  (2, 'Rock Anthems', '2023-05-20', 2, '002'),
  (3, 'Hip Hop Beats', '2023-10-15', 3, '003'),
  (4, 'Classical Melodies', '2022-06-15', 4, '004'),
  (5, 'R&B Jams', '2023-02-28', 5, '005'),
  (6, 'Electronic Vibes', '2023-09-10', 2, '002');

-- Inserting songs into the Song table
INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES
  (1, 'Rainy Days', 2.15, 'Lyrics for Rainy Days', 1),
  (2, 'Dancing Stars', 4.21, 'Lyrics for Dancing Stars', 1),
  (3, 'Freedom Road', 3.30, 'Lyrics for Freedom Road', 2),
  (4, 'Echoes of Love', 3.05, 'Lyrics for Echoes of Love', 2),
  (5, 'City Lights', 3.20, 'Lyrics for City Lights', 3),
  (6, 'Moonlit Dreams', 1.10, 'Lyrics for Moonlit Dreams', 3),
  (7, 'Serenade for You', 3.45, 'Lyrics for Serenade for You', 4),
  (8, 'Heartbeat Rhythms', 3.55, 'Lyrics for Heartbeat Rhythms', 4),
  (9, 'Sunset Boulevard', 2.30, 'Lyrics for Sunset Boulevard', 5),
  (10, 'Midnight Groove', 3.25, 'Lyrics for Midnight Groove', 5),
  (11, 'Neon Dreams', 3.10, 'Lyrics for Neon Dreams', 6),
  (12, 'Electric Symphony', 3.40, 'Lyrics for Electric Symphony', 6),
  (13, 'Harmony of Souls', 1.20, 'Lyrics for Harmony of Souls', 6),
  (14, 'Eternal Melodies', 3.15, 'Lyrics for Eternal Melodies', 4),
  (15, 'Golden Memories', 3.50, 'Lyrics for Golden Memories', 3);

-- Adding songs to Playlists
INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES
  (1, 6),
  (1, 9),
  (1, 11),
  (2, 10),
  (2, 13),
  (2, 15),
  (3, 2),
  (3, 4),
  (3, 8);

-- Assigning songs to producers
INSERT INTO Prod_Song (Producer_Person, Song_ID)
VALUES
  ('101', 1),
  ('102', 2),
  ('103', 3),
  ('104', 4),
  ('105', 5);

-- Assigning songs to artists
INSERT INTO Art_Song (Artist_Person, Song_ID)
VALUES
  ('001', 6),
  ('002', 7),
  ('003', 8),
  ('004', 9),
  ('005', 10),
  ('001', 1),
  ('004', 3);
