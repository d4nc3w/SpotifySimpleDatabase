--Functionalities
--1. Count songs of each Playlist
SELECT p.PlaylistName, COUNT(p2.Song_ID) AS NumOfSongs
FROM Playlist p
LEFT JOIN Play_Song p2 ON p.ID = p2.Playlist_ID
GROUP BY p.PlaylistName;

--2. Top 3 artists sorted by numbers of songs released
SELECT a.ArtistName, COUNT(ars.Song_ID) AS SongCount
FROM Artist a
LEFT JOIN Art_Song ars ON a.Person = ars.Artist_Person
GROUP BY a.ArtistName
ORDER BY SongCount DESC
FETCH FIRST 3 ROWS ONLY;

--3. Count songs in a specific genre
SELECT g.Name AS Genre, COUNT(*) AS SongCount
FROM Genre g
INNER JOIN MusicAlbum m ON g.ID = m.Genre
INNER JOIN Song s ON m.ID = s.MusicAlbum
GROUP BY g.Name;

--4. Show albums released in 2023
SELECT AlbumTitle, ReleaseDate
FROM MusicAlbum
WHERE EXTRACT(YEAR FROM ReleaseDate) = 2023;

--5. Retrieve songs in a playlist where the lyrics contain a specific keyword.
SELECT s.Title, s.Lyrics
FROM Song s
INNER JOIN Play_Song ps ON s.ID = ps.Song_ID
WHERE ps.Playlist_ID = 1 
AND s.Lyrics LIKE '%for%';