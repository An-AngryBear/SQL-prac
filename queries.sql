-- Query all of the entries in the Genre table
SELECT * FROM Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist
(ArtistId, ArtistName, YearEstablished)
VALUES
(424, "Fleet Foxes", 2006)

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album
(AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES
(122, "Crack-Up", "06/16/2017", 2331, "Nonesuch Records", 424, 15)

---or you don't have to look up ID's---

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
SELECT "Crack-Up", 2017, 2331, "Nonesuch Records", ar.Artist, g.Genre
FROM Artist ar, Genre g
Where ar.ArtistName = "The Fleet Foxes"
and g.Label = "Rock"

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song
(SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
(1232, "I Should See Memphis","4:44" , "06/16/2017", 15, 424, 122)

INSERT INTO Song
(SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
(2331, "Fool's Errand", "4:48", "06/16/2017", 15, 424, 122)

INSERT INTO Song
(SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
(672, "Kept Woman", "3:55", "06/16/2017", 15, 424, 122)

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
SELECT s.title, a.artistname, al.title
FROM song s, artist a, album al
ON s.albumid = al.albumid AND s.artistid = a.artistid
WHERE al.albumid = 122

-- Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. 

SELECT a.Title, s.Title 
FROM Song s 
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId
WHERE a.albumid = 122

-- Here is some more info on joins that might help.
-- Reminder: Direction of join matters. Try the following statements and see the difference in results.
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(songid), a.title
FROM song s
LEFT JOIN Album a ON s.albumid = a.albumid
GROUP BY s.albumid
ORDER BY a.title AS ASC

"DESC" = Descending order, "ASC" = Ascending order, "ORDER BY COUNT(songid)" = orders by count
-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT albumlength, title
FROM Album
WHERE albumlength = (SELECT MAX(albumlength) FROM album)
--^david's example^--

SELECT MAX(albumlength) as "length", title
from album
-- ^joe's example^

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

-- Modify the previous query to also display the title of the album.