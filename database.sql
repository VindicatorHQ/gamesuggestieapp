CREATE IF NOT EXISTS DATABASE gamesuggestieapp;

USE DATABASE 'gamesuggestieapp';

CREATE TABLE user (
	userID int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	userName VARCHAR(255) NOT NULL
);

CREATE TABLE gameData (
	gameID int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	releaseYear DATE NOT NULL
	gameName VARCHAR(255) NOT NULL UNIQUE,
	gamePublisher VARCHAR(255) NOT NULL,
	gameGenre VARCHAR(255) NOT NULL,
);

CREATE TABLE rating (
	ratingID int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	gameID int FOREIGN KEY REFERENCES gameData(gameID),
	userID int FOREIGN KEY REFERENCES user(userID),
	ratingValue DOUBLE NOT NULL
);

INSERT INTO gameData (releaseYear, gameName, gamePublisher, gameGenre) VALUES (
	(2020-06-02, "Valorant", "Riot Games", "First-person shooter"),
	(2019-10-25, "Call of Duty: Modern Warfare", "Activision", "First-person shooter"),
	(2012-08-21, "Counter-Strike: Global Offensive", "Valve", "First-person shooter"),
	(2006-11-29, "Garry's Mod", "Facepunch Studios", "Sandbox"),
	(2017-03-03, "The Legend of Zelda: Breath of the Wild", "Nintendo", "Action-adventure"),
	(2013-09-17, "Grand Theft Auto V", "Rockstar Games", "Action-adventure"),
	(2020-03-23, "Half-Life: Alyx", "Valve", "VR"),
	(2010-07-27, "Starcraft 2", "Blizzard entertainment", "Strategy"),
	(2012-10-19, "Euro Truck Simulator 2", "SCS Software", "Simulation"),
	(2018-05-01, "Beat Saber", "Beat Games", "VR"),
	(2020-08-17, "Microsoft Flight Simulator", "Asobo Studio", "Simulation"),
	(2015-03-10, "Cities: Skylines", "Paradox Interactive", "Simulation"),
	(2000-04-02, "The Sims", "Electronic Arts", "Sandbox"),
	(2011-11-18, "Minecraft", "Mojang Studios", "Sandbox"),
	(2016-02-02, "American Truck Simulator", "SCS Software", "Simulation"),
	(2018-10-26, "Red Read Redemption 2", "Rockstar Games", "Action-adventure"),
	(2021-09-28, "Age of Empires IV", "Xbox Game Studios", "Strategy"),
	(2018-06-15, "Among Us", "Innersloth", "Indie"),
	(2016-04-05, "Job Simulator", "Owlchemy Labs", "VR"),
	(2011-08-28, "The Binding of Isaac", "Edmund McMiller", "Indie" ),
	(2022-02-25, "Elden ring", "From Software", "Action-adventure"),
    	(2021-09-16, "Call of Duty: Vanguard, Activison", "First person shooter"),
    	(2009-10-27, "League of legends", "Riot games", "Strategy"),
    	(2006-08-27, "Roblox", "Roblox Corporation", "Sandbox"),
    	(2014-04-01, "Goat simulator", "Coffee stain studio", "Indie"),
);