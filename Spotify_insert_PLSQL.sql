--Insertion of data
-- Insert data into Person table
INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('101', 'John', 'Smith', TO_DATE('1980-04-15', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('102', 'Emma', 'Johnson', TO_DATE('1975-09-20', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('103', 'Daniel', 'Williams', TO_DATE('1982-06-10', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('104', 'Sophie', 'Brown', TO_DATE('1978-12-28', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('105', 'Michael', 'Anderson', TO_DATE('1985-07-02', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('001', 'Emily', 'Davis', TO_DATE('1990-05-15', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('002', 'David', 'Martinez', TO_DATE('1987-09-20', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('003', 'Olivia', 'Garcia', TO_DATE('1992-03-10', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('004', 'William', 'Rodriguez', TO_DATE('1980-12-28', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('005', 'Sophia', 'Lopez', TO_DATE('1989-07-02', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('201', 'Mark', 'Wilson', TO_DATE('1995-01-18', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('202', 'Chloe', 'Gonzalez', TO_DATE('1998-11-02', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('203', 'Ryan', 'Hernandez', TO_DATE('1993-08-20', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('204', 'Grace', 'Rivera', TO_DATE('1997-04-07', 'YYYY-MM-DD'));

INSERT INTO Person (ID, Name, Surname, DateOfBirth)
VALUES ('205', 'James', 'Perez', TO_DATE('1996-10-12', 'YYYY-MM-DD'));

-- Inserting data into Language table
INSERT INTO Language (ID, Name)
VALUES (1, 'English');

INSERT INTO Language (ID, Name)
VALUES (2, 'Spanish');

INSERT INTO Language (ID, Name)
VALUES (3, 'Polish');

INSERT INTO Language (ID, Name)
VALUES (4, 'German');

INSERT INTO Language (ID, Name)
VALUES (5, 'Japanese');

-- Inserting data into Genre Table
INSERT INTO Genre (ID, Name)
VALUES (1, 'Pop');

INSERT INTO Genre (ID, Name)
VALUES (2, 'Rock');

INSERT INTO Genre (ID, Name)
VALUES (3, 'Hip Hop');

INSERT INTO Genre (ID, Name)
VALUES (4, 'Jazz');

INSERT INTO Genre (ID, Name)
VALUES (5, 'Electronic');

-- Inserting data into Country table
INSERT INTO Country (ID, Name, Language_ID)
VALUES (1, 'United States', 1);

INSERT INTO Country (ID, Name, Language_ID)
VALUES (2, 'United Kingdom', 1);

INSERT INTO Country (ID, Name, Language_ID)
VALUES (3, 'Canada', 1);

INSERT INTO Country (ID, Name, Language_ID)
VALUES (4, 'Australia', 1);

INSERT INTO Country (ID, Name, Language_ID)
VALUES (5, 'Poland', 3);

-- Adding Artists
INSERT INTO Artist (Person, ArtistName, Country)
VALUES ('001', 'Emily Davis', 1);

INSERT INTO Artist (Person, ArtistName, Country)
VALUES ('002', 'David Martinez', 2);

INSERT INTO Artist (Person, ArtistName, Country)
VALUES ('003', 'Olivia Garcia', 3);

INSERT INTO Artist (Person, ArtistName, Country)
VALUES ('004', 'William Rodriguez', 4);

INSERT INTO Artist (Person, ArtistName, Country)
VALUES ('005', 'Sophia Lopez', 5);

-- Adding Producers
INSERT INTO Producer (Person, ProducerName)
VALUES ('101', 'John Smith');

INSERT INTO Producer (Person, ProducerName)
VALUES ('102', 'Emma Johnson');

INSERT INTO Producer (Person, ProducerName)
VALUES ('103', 'Daniel Williams');

INSERT INTO Producer (Person, ProducerName)
VALUES ('104', 'Sophie Brown');

INSERT INTO Producer (Person, ProducerName)
VALUES ('105', 'Michael Anderson');

-- Adding Users
INSERT INTO "User" (Person, AccountName)
VALUES ('201', 'MarkWilson94');

INSERT INTO "User" (Person, AccountName)
VALUES ('202', 'ChloeGonzalez98');

INSERT INTO "User" (Person, AccountName)
VALUES ('203', 'RyanHernandez93');

INSERT INTO "User" (Person, AccountName)
VALUES ('204', 'GraceRivera97');

INSERT INTO "User" (Person, AccountName)
VALUES ('205', 'JamesPerez96');

-- Creating Playlists
INSERT INTO Playlist (ID, PlaylistName, User_Person)
VALUES (1, 'Relaxation Station', 201);

INSERT INTO Playlist (ID, PlaylistName, User_Person)
VALUES (2, 'Lets go Gym', 202);

INSERT INTO Playlist (ID, PlaylistName, User_Person)
VALUES (3, 'Late Night', 202);

-- Adding Albums
INSERT INTO MusicAlbum (ID, AlbumTitle, ReleaseDate, Genre, Artist_Person)
VALUES (1, 'Greatest Hits', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1, '001');

INSERT INTO MusicAlbum (ID, AlbumTitle, ReleaseDate, Genre, Artist_Person)
VALUES (2, 'Rock Anthems', TO_DATE('2023-05-20', 'YYYY-MM-DD'), 2, '002');

INSERT INTO MusicAlbum (ID, AlbumTitle, ReleaseDate, Genre, Artist_Person)
VALUES (3, 'Hip Hop Beats', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 3, '001');

INSERT INTO MusicAlbum (ID, AlbumTitle, ReleaseDate, Genre, Artist_Person)
VALUES (4, 'Classical Melodies', TO_DATE('2022-06-15', 'YYYY-MM-DD'), 4, '003');

INSERT INTO MusicAlbum (ID, AlbumTitle, ReleaseDate, Genre, Artist_Person)
VALUES (5, 'R&B Jams', TO_DATE('2023-02-28', 'YYYY-MM-DD'), 5, '004');

INSERT INTO MusicAlbum (ID, AlbumTitle, ReleaseDate, Genre, Artist_Person)
VALUES (6, 'Electronic Vibes', TO_DATE('2023-09-10', 'YYYY-MM-DD'), 2, '005');

-- Adding Songs
INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (1, 'Rainy Days', 2.15, 'Lyrics for Rainy Days', 1);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (2, 'Dancing Stars', 4.21, 'Lyrics for Dancing Stars', 1);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (3, 'Freedom Road', 3.30, 'Lyrics for Freedom Road', 2);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (4, 'Echoes of Love', 3.05, 'Lyrics for Echoes of Love', 2);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (5, 'City Lights', 3.20, 'Lyrics for City Lights', 3);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (6, 'Moonlit Dreams', 1.10, 'Lyrics for Moonlit Dreams', 3);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (7, 'Serenade for You', 3.45, 'Lyrics for Serenade for You', 4);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (8, 'Heartbeat Rhythms', 3.55, 'Lyrics for Heartbeat Rhythms', 4);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (9, 'Sunset Boulevard', 2.30, 'Lyrics for Sunset Boulevard', 5);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (10, 'Midnight Groove', 3.25, 'Lyrics for Midnight Groove', 5);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (11, 'Neon Dreams', 3.10, 'Lyrics for Neon Dreams', 6);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (12, 'Electric Symphony', 3.40, 'Lyrics for Electric Symphony', 6);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (13, 'Harmony of Souls', 1.20, 'Lyrics for Harmony of Souls', 6);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (14, 'Eternal Melodies', 3.15, 'Lyrics for Eternal Melodies', 4);

INSERT INTO Song (ID, Title, Length, Lyrics, MusicAlbum)
VALUES (15, 'Golden Memories', 3.50, 'Lyrics for Golden Memories', 3);

-- Adding songs to Playlists
INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES (1, 6);
INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES (1, 9);
INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES (1, 11);

INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES (2, 10);
INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES (2, 13);
INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES (2, 15);

INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES (3, 2);
INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES (3, 4);
INSERT INTO Play_Song (Playlist_ID, Song_ID)
VALUES (3, 8);

-- Assigning songs to producers
INSERT INTO Prod_Song (Producer_Person, Song_ID) VALUES ('101', 1);
INSERT INTO Prod_Song (Producer_Person, Song_ID) VALUES ('102', 2);
INSERT INTO Prod_Song (Producer_Person, Song_ID) VALUES ('103', 3);
INSERT INTO Prod_Song (Producer_Person, Song_ID) VALUES ('104', 4);
INSERT INTO Prod_Song (Producer_Person, Song_ID) VALUES ('105', 5);

-- Assigning songs to artists 
INSERT INTO Art_Song (Artist_Person, Song_ID) VALUES ('001', 6);
INSERT INTO Art_Song (Artist_Person, Song_ID) VALUES ('002', 7);
INSERT INTO Art_Song (Artist_Person, Song_ID) VALUES ('003', 8);
INSERT INTO Art_Song (Artist_Person, Song_ID) VALUES ('004', 9);
INSERT INTO Art_Song (Artist_Person, Song_ID) VALUES ('005', 10);
INSERT INTO Art_Song (Artist_Person, Song_ID) VALUES ('001', 1);
INSERT INTO Art_Song (Artist_Person, Song_ID) VALUES ('004', 3);