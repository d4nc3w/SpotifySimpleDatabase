--------------------------
--1st Trigger
CREATE TRIGGER PreventArtistChange
ON MusicAlbum
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Artist_Person)
    BEGIN
        RAISERROR('Changing the artist of an album is not allowed.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
    IF UPDATE(AlbumTitle)
    BEGIN
        DECLARE @RestrictedTitle VARCHAR(50) = 'RestrictedTitle'; 
        
        IF EXISTS (SELECT 1 FROM inserted WHERE AlbumTitle = @RestrictedTitle)
        BEGIN
            RAISERROR('Changing to a restricted album title is not allowed.', 16, 1);
            ROLLBACK TRANSACTION;
        END;
    END;
END;

--Check case:
UPDATE MusicAlbum SET Artist_Person = '002' WHERE ID = 7;
--------------------------
UPDATE MusicAlbum
SET AlbumTitle = 'RestrictedTitle' 
WHERE ID = '03'; 

--2nd Trigger
CREATE TRIGGER AddDefaultLyrics
ON Song
AFTER INSERT
AS
BEGIN
    UPDATE Song
    SET Lyrics = 
        CASE 
            WHEN Lyrics = '' OR Lyrics IS NULL THEN
                CASE 
                    WHEN LEN(Title) < 10 THEN 'No lyrics available'
                    WHEN LEN(Title) >= 10 AND LEN(Title) < 20 THEN 'Lyrics will be added soon'
                    ELSE 'Stay tuned for the lyrics'
                END
        END
    WHERE ID IN (SELECT ID FROM inserted);
END;

--Check case:
INSERT INTO Song (ID, Title, Length, MusicAlbum, Lyrics)
VALUES (17, 'New Song', 3.45, 5, '');
SELECT * FROM Song WHERE ID = 17;

----------------------------------------------------------------------------
--1st Procedure
CREATE PROCEDURE GetPlaylistSongs
    @playlistID INT
AS
BEGIN
    SELECT S.ID, S.Title, S.Lyrics, A.ArtistName
    FROM Song S
    INNER JOIN Play_Song PS ON S.ID = PS.Song_ID
    INNER JOIN Art_Song AS ASG ON ASG.Song_ID = S.ID
    INNER JOIN Artist A ON ASG.Artist_Person = A.Person
    WHERE PS.Playlist_ID = @playlistID;
END;

--Check case:
EXEC GetPlaylistSongs @playlistID = 1;

--2nd Procedure
CREATE PROCEDURE SumSongLengthsByArtist
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @artist_name VARCHAR(20);
    DECLARE @total_length DECIMAL(10, 2);

    DECLARE artist_cursor CURSOR FOR
        SELECT DISTINCT a.ArtistName
        FROM Artist a
        JOIN Art_Song ar ON a.Person = ar.Artist_Person;

    OPEN artist_cursor;

    FETCH NEXT FROM artist_cursor INTO @artist_name;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Calculate total length of songs for each artist
        SET @total_length = (
            SELECT SUM(s.Length)
            FROM Song s
            JOIN Art_Song ar ON s.ID = ar.Song_ID
            JOIN Artist a ON ar.Artist_Person = a.Person
            WHERE a.ArtistName = @artist_name
        );

        -- Display artist's name and total length of songs
        PRINT CONCAT('Artist: ', @artist_name, ' - Total Song Length: ', @total_length, ' minutes');

        FETCH NEXT FROM artist_cursor INTO @artist_name;
    END;

    CLOSE artist_cursor;
    DEALLOCATE artist_cursor;
END;

--Check case:
EXEC SumSongLengthsByArtist;