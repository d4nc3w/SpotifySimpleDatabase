--TriggersAndProcedures
-- Trigger1
CREATE OR REPLACE TRIGGER Prevent_Song_Deletion
BEFORE DELETE ON Song
FOR EACH ROW
DECLARE
    playlist_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO playlist_count
    FROM Play_Song
    WHERE Song_ID = :OLD.ID;

    IF playlist_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Deletion not allowed: Song is in one or more playlists.');
    END IF;
END;
	
-- Check case:
DELETE FROM Song WHERE ID = 9;

-- Trigger2
CREATE OR REPLACE TRIGGER Prevent_Duplicate_Producer
BEFORE INSERT ON Producer
FOR EACH ROW
DECLARE
    producer_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO producer_count FROM Producer WHERE Person = :NEW.Person;
    
    IF producer_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Producer already exists. Cannot create a duplicate.');
    END IF;
END;

--Check case:
INSERT INTO Producer (Person, ProducerName) VALUES ('101', 'New Producer Name');

------------------------------------------------------
-- Procedure1
CREATE OR REPLACE PROCEDURE GetSongsByArtist(
    artist_id VARCHAR2,
    songs_cursor OUT SYS_REFCURSOR
)
AS
    song_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO song_count
    FROM Art_Song
    WHERE Artist_Person = artist_id;

    IF song_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No songs found for the artist.');
    ELSE
        OPEN songs_cursor FOR
        SELECT s.Title
        FROM Song s
        JOIN Art_Song ar ON s.ID = ar.Song_ID
        WHERE ar.Artist_Person = artist_id;
    END IF;
END;

-- Check case:
DECLARE
    songs_cursor SYS_REFCURSOR;
    artist_id_with_songs VARCHAR2(9) := '001'; 
    artist_id_without_songs VARCHAR2(9) := '999'; 
    song_title VARCHAR2(50);
BEGIN
    --artist who has songs
    BEGIN
        GetSongsByArtist(artist_id_with_songs, songs_cursor);
        LOOP
            FETCH songs_cursor INTO song_title;
            EXIT WHEN songs_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Song Title: ' || song_title);
        END LOOP;
        CLOSE songs_cursor;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;

    --artist who has no songs
    BEGIN
        GetSongsByArtist(artist_id_without_songs, songs_cursor);
        LOOP
            FETCH songs_cursor INTO song_title;
            EXIT WHEN songs_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Song Title: ' || song_title);
        END LOOP;
        CLOSE songs_cursor;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
END;

-- Procedure2
CREATE OR REPLACE PROCEDURE GetAlbumsByGenreWithDetails(
    genre_id NUMBER,
    albums_cursor OUT SYS_REFCURSOR
)
AS
    album_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO album_count
    FROM MusicAlbum
    WHERE Genre = genre_id;

    IF album_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No albums found for the genre.');
    ELSE
        OPEN albums_cursor FOR
        SELECT m.AlbumTitle, m.ReleaseDate, a.ArtistName
        FROM MusicAlbum m
        JOIN Artist a ON m.Artist_Person = a.Person
        WHERE m.Genre = genre_id;
    END IF;
END;

-- Check case: 
DECLARE
    albums_cursor SYS_REFCURSOR;
    genre_id_with_albums NUMBER := 1; 
    genre_id_without_albums NUMBER := 99; 
    album_title VARCHAR2(50);
    release_date DATE;
    artist_name VARCHAR2(50);
BEGIN
    --genre that has albums
    BEGIN
        GetAlbumsByGenreWithDetails(genre_id_with_albums, albums_cursor);
        LOOP
            FETCH albums_cursor INTO album_title, release_date, artist_name;
            EXIT WHEN albums_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Album Title: ' || album_title || ', Release Date: ' || TO_CHAR(release_date, 'YYYY-MM-DD') || ', Artist: ' || artist_name);
        END LOOP;
        CLOSE albums_cursor;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;

    --genre that has no albums
    BEGIN
        GetAlbumsByGenreWithDetails(genre_id_without_albums, albums_cursor);
        LOOP
            FETCH albums_cursor INTO album_title, release_date, artist_name;
            EXIT WHEN albums_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Album Title: ' || album_title || ', Release Date: ' || TO_CHAR(release_date, 'YYYY-MM-DD') || ', Artist: ' || artist_name);
        END LOOP;
        CLOSE albums_cursor;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
END;