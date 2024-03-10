-- tables
-- Table: Art_Song
CREATE TABLE Art_Song (
    Artist_Person varchar2(9)  NOT NULL,
    Song_ID integer  NOT NULL,
    CONSTRAINT Art_Song_pk PRIMARY KEY (Artist_Person,Song_ID)
) ;

-- Table: Artist
CREATE TABLE Artist (
    Person varchar2(9)  NOT NULL,
    ArtistName varchar2(20)  NOT NULL,
    Country integer  NOT NULL,
    CONSTRAINT Artist_pk PRIMARY KEY (Person)
) ;

-- Table: Country
CREATE TABLE Country (
    ID integer  NOT NULL,
    Name varchar2(20)  NOT NULL,
    Language_ID integer  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (ID)
) ;

-- Table: Genre
CREATE TABLE Genre (
    ID integer  NOT NULL,
    Name varchar2(20)  NOT NULL,
    CONSTRAINT Genre_pk PRIMARY KEY (ID)
) ;

-- Table: Language
CREATE TABLE Language (
    ID integer  NOT NULL,
    Name varchar2(20)  NOT NULL,
    CONSTRAINT Language_pk PRIMARY KEY (ID)
) ;

-- Table: MusicAlbum
CREATE TABLE MusicAlbum (
    ID integer  NOT NULL,
    AlbumTitle varchar2(20)  NOT NULL,
    ReleaseDate date  NOT NULL,
    Genre integer  NOT NULL,
    Artist_Person varchar2(9)  NOT NULL,
    CONSTRAINT MusicAlbum_pk PRIMARY KEY (ID)
) ;

-- Table: Person
CREATE TABLE Person (
    ID varchar2(9)  NOT NULL,
    Name varchar2(20)  NOT NULL,
    Surname varchar2(20)  NOT NULL,
    DateOfBirth date  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (ID)
) ;

-- Table: Play_Song
CREATE TABLE Play_Song (
    Playlist_ID integer  NOT NULL,
    Song_ID integer  NOT NULL,
    CONSTRAINT Play_Song_pk PRIMARY KEY (Playlist_ID,Song_ID)
) ;

-- Table: Playlist
CREATE TABLE Playlist (
    ID integer  NOT NULL,
    PlaylistName varchar2(20)  NOT NULL,
    User_Person varchar2(9)  NOT NULL,
    CONSTRAINT Playlist_pk PRIMARY KEY (ID)
) ;

-- Table: Prod_Song
CREATE TABLE Prod_Song (
    Producer_Person varchar2(9)  NOT NULL,
    Song_ID integer  NOT NULL,
    CONSTRAINT Prod_Song_pk PRIMARY KEY (Producer_Person,Song_ID)
) ;

-- Table: Producer
CREATE TABLE Producer (
    Person varchar2(9)  NOT NULL,
    ProducerName varchar2(20)  NOT NULL,
    CONSTRAINT Producer_pk PRIMARY KEY (Person)
) ;

-- Table: Song
CREATE TABLE Song (
    ID integer  NOT NULL,
    Title varchar2(20)  NOT NULL,
    Length number(4,2)  NOT NULL,
    Lyrics varchar2(100)  NOT NULL,
    MusicAlbum integer  NULL,
    CONSTRAINT Song_pk PRIMARY KEY (ID)
) ;

-- Table: User
CREATE TABLE "User" (
    Person varchar2(9)  NOT NULL,
    AccountName varchar2(20)  NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (Person)
) ;

-- foreign keys
-- Reference: Art_Song_Artist (table: Art_Song)
ALTER TABLE Art_Song ADD CONSTRAINT Art_Song_Artist
    FOREIGN KEY (Artist_Person)
    REFERENCES Artist (Person);

-- Reference: Art_Song_Song (table: Art_Song)
ALTER TABLE Art_Song ADD CONSTRAINT Art_Song_Song
    FOREIGN KEY (Song_ID)
    REFERENCES Song (ID);

-- Reference: Artist_Country (table: Artist)
ALTER TABLE Artist ADD CONSTRAINT Artist_Country
    FOREIGN KEY (Country)
    REFERENCES Country (ID);

-- Reference: Artist_Human (table: Artist)
ALTER TABLE Artist ADD CONSTRAINT Artist_Human
    FOREIGN KEY (Person)
    REFERENCES Person (ID);

-- Reference: Country_Language (table: Country)
ALTER TABLE Country ADD CONSTRAINT Country_Language
    FOREIGN KEY (Language_ID)
    REFERENCES Language (ID);

-- Reference: Listener_Person (table: User)
ALTER TABLE "User" ADD CONSTRAINT Listener_Person
    FOREIGN KEY (Person)
    REFERENCES Person (ID);

-- Reference: MusicAlbum_Artist (table: MusicAlbum)
ALTER TABLE MusicAlbum ADD CONSTRAINT MusicAlbum_Artist
    FOREIGN KEY (Artist_Person)
    REFERENCES Artist (Person);

-- Reference: MusicAlbum_Genre (table: MusicAlbum)
ALTER TABLE MusicAlbum ADD CONSTRAINT MusicAlbum_Genre
    FOREIGN KEY (Genre)
    REFERENCES Genre (ID);

-- Reference: Play_Song_Playlist (table: Play_Song)
ALTER TABLE Play_Song ADD CONSTRAINT Play_Song_Playlist
    FOREIGN KEY (Playlist_ID)
    REFERENCES Playlist (ID);

-- Reference: Play_Song_Song (table: Play_Song)
ALTER TABLE Play_Song ADD CONSTRAINT Play_Song_Song
    FOREIGN KEY (Song_ID)
    REFERENCES Song (ID);

-- Reference: Playlist_User (table: Playlist)
ALTER TABLE Playlist ADD CONSTRAINT Playlist_User
    FOREIGN KEY (User_Person)
    REFERENCES "User" (Person);

-- Reference: Prod_Song_Producer (table: Prod_Song)
ALTER TABLE Prod_Song ADD CONSTRAINT Prod_Song_Producer
    FOREIGN KEY (Producer_Person)
    REFERENCES Producer (Person);

-- Reference: Prod_Song_Song (table: Prod_Song)
ALTER TABLE Prod_Song ADD CONSTRAINT Prod_Song_Song
    FOREIGN KEY (Song_ID)
    REFERENCES Song (ID);

-- Reference: Producer_Person (table: Producer)
ALTER TABLE Producer ADD CONSTRAINT Producer_Person
    FOREIGN KEY (Person)
    REFERENCES Person (ID);

-- Reference: Song_MusicAlbum (table: Song)
ALTER TABLE Song ADD CONSTRAINT Song_MusicAlbum
    FOREIGN KEY (MusicAlbum)
    REFERENCES MusicAlbum (ID);

-- End of file.