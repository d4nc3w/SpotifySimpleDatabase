-- tables
CREATE TABLE Art_Song (
    Artist_Person varchar(9)  NOT NULL,
    Song_ID int  NOT NULL,
    CONSTRAINT Art_Song_pk PRIMARY KEY (Artist_Person, Song_ID)
);

CREATE TABLE Artist (
    Person varchar(9)  NOT NULL,
    ArtistName varchar(20)  NOT NULL,
    Country int  NOT NULL,
    CONSTRAINT Artist_pk PRIMARY KEY (Person)
);

CREATE TABLE Country (
    ID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    Language_ID int  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (ID)
);

CREATE TABLE Genre (
    ID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    CONSTRAINT Genre_pk PRIMARY KEY (ID)
);

CREATE TABLE Language (
    ID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    CONSTRAINT Language_pk PRIMARY KEY (ID)
);

CREATE TABLE MusicAlbum (
    ID int  NOT NULL,
    AlbumTitle varchar(20)  NOT NULL,
    ReleaseDate date  NOT NULL,
    Genre int  NOT NULL,
    Artist_Person varchar(9)  NOT NULL,
    CONSTRAINT MusicAlbum_pk PRIMARY KEY (ID)
);

CREATE TABLE Person (
    ID varchar(9)  NOT NULL,
    Name varchar(20)  NOT NULL,
    Surname varchar(20)  NOT NULL,
    DateOfBirth date  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (ID)
);

CREATE TABLE Play_Song (
    Playlist_ID int  NOT NULL,
    Song_ID int  NOT NULL,
    CONSTRAINT Play_Song_pk PRIMARY KEY (Playlist_ID, Song_ID)
);

CREATE TABLE Playlist (
    ID int  NOT NULL,
    PlaylistName varchar(20)  NOT NULL,
    User_Person varchar(9)  NOT NULL,
    CONSTRAINT Playlist_pk PRIMARY KEY (ID)
);

CREATE TABLE Prod_Song (
    Producer_Person varchar(9)  NOT NULL,
    Song_ID int  NOT NULL,
    CONSTRAINT Prod_Song_pk PRIMARY KEY (Producer_Person, Song_ID)
);

CREATE TABLE Producer (
    Person varchar(9)  NOT NULL,
    ProducerName varchar(20)  NOT NULL,
    CONSTRAINT Producer_pk PRIMARY KEY (Person)
);

CREATE TABLE Song (
    ID int  NOT NULL,
    Title varchar(20)  NOT NULL,
    Length decimal(4,2)  NOT NULL,
    Lyrics varchar(100)  NOT NULL,
    MusicAlbum int  NULL,
    CONSTRAINT Song_pk PRIMARY KEY (ID)
);

CREATE TABLE [User] (
    Person varchar(9)  NOT NULL,
    AccountName varchar(20)  NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (Person)
);

-- foreign keys
ALTER TABLE Art_Song ADD CONSTRAINT Art_Song_Artist
    FOREIGN KEY (Artist_Person)
    REFERENCES Artist (Person);

ALTER TABLE Art_Song ADD CONSTRAINT Art_Song_Song
    FOREIGN KEY (Song_ID)
    REFERENCES Song (ID);

ALTER TABLE Artist ADD CONSTRAINT Artist_Country
    FOREIGN KEY (Country)
    REFERENCES Country (ID);

ALTER TABLE Artist ADD CONSTRAINT Artist_Human
    FOREIGN KEY (Person)
    REFERENCES Person (ID);

ALTER TABLE Country ADD CONSTRAINT Country_Language
    FOREIGN KEY (Language_ID)
    REFERENCES Language (ID);

ALTER TABLE [User] ADD CONSTRAINT Listener_Person
    FOREIGN KEY (Person)
    REFERENCES Person (ID);

ALTER TABLE MusicAlbum ADD CONSTRAINT MusicAlbum_Artist
    FOREIGN KEY (Artist_Person)
    REFERENCES Artist (Person);

ALTER TABLE MusicAlbum ADD CONSTRAINT MusicAlbum_Genre
    FOREIGN KEY (Genre)
    REFERENCES Genre (ID);

ALTER TABLE Play_Song ADD CONSTRAINT Play_Song_Playlist
    FOREIGN KEY (Playlist_ID)
    REFERENCES Playlist (ID);

ALTER TABLE Play_Song ADD CONSTRAINT Play_Song_Song
    FOREIGN KEY (Song_ID)
    REFERENCES Song (ID);

ALTER TABLE Playlist ADD CONSTRAINT Playlist_User
    FOREIGN KEY (User_Person)
    REFERENCES [User] (Person);

ALTER TABLE Prod_Song ADD CONSTRAINT Prod_Song_Producer
    FOREIGN KEY (Producer_Person)
    REFERENCES Producer (Person);

ALTER TABLE Prod_Song ADD CONSTRAINT Prod_Song_Song
    FOREIGN KEY (Song_ID)
    REFERENCES Song (ID);

ALTER TABLE Producer ADD CONSTRAINT Producer_Person
    FOREIGN KEY (Person)
    REFERENCES Person (ID);

ALTER TABLE Song ADD CONSTRAINT Song_MusicAlbum
    FOREIGN KEY (MusicAlbum)
    REFERENCES MusicAlbum (ID);
