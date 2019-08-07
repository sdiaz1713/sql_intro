CREATE TABLE zodiac(
  id SERIAL PRIMARY KEY,
  sun VARCHAR NOT NULL UNIQUE,
  dates VARCHAR NOT NULL,
  element VARCHAR NOT NULL
);

INSERT INTO zodiac(sun, dates, element) VALUES('aries', 'mar21-apr19', 'fire');
INSERT INTO zodiac(sun, dates, element) VALUES('taurus', 'apr20-may20', 'earth');
INSERT INTO zodiac(sun, dates, element) VALUES('gemini', 'may21-jun20', 'air');
INSERT INTO zodiac(sun, dates, element) VALUES('cancer', 'jun21-jul22', 'water');
INSERT INTO zodiac(sun, dates, element) VALUES('leo', 'jul23-aug22', 'fire');
INSERT INTO zodiac(sun, dates, element) VALUES('virgo', 'aug23-sep22', 'earth');
INSERT INTO zodiac(sun, dates, element) VALUES('libra', 'sep23-oct22', 'air');
INSERT INTO zodiac(sun, dates, element) VALUES('scorpio', 'oct23-nov21', 'water');
INSERT INTO zodiac(sun, dates, element) VALUES('sagittarius', 'nov22-dec21', 'fire');
INSERT INTO zodiac(sun, dates, element) VALUES('capricorn', 'dec22-jan19', 'earth');
INSERT INTO zodiac(sun, dates, element) VALUES('aquarius', 'jan20-feb18', 'air');
INSERT INTO zodiac(sun, dates, element) VALUES('pisces', 'feb19-mar20', 'water');


CREATE TABLE family(
  id SERIAL PRIMARY KEY,
  fname VARCHAR NOT NULL UNIQUE,
  sunsign VARCHAR NOT NULL UNIQUE,
  age INT,
  FOREIGN KEY (sunsign) REFERENCES zodiac(sun)
);

INSERT INTO family(fname, sunsign, age) VALUES('stephanie', 'cancer', 23);
INSERT INTO family(fname, sunsign, age) VALUES('tanya', 'scorpio', 22);
INSERT INTO family(fname, sunsign, age) VALUES('doggo', 'pisces', 3);
INSERT INTO family(fname, sunsign, age) VALUES('child', 'taurus', 2);


CREATE TABLE characteristics(
  id SERIAL PRIMARY KEY,
  person VARCHAR NOT NULL,
  characteristic VARCHAR NOT NULL,
  scale INT,
  FOREIGN KEY (person) REFERENCES family(fname)
);

INSERT INTO characteristics(person, characteristic, scale) VALUES('stephanie', 'smart', 10);
INSERT INTO characteristics(person, characteristic, scale) VALUES('stephanie', 'funny', 4);
INSERT INTO characteristics(person, characteristic, scale) VALUES('stephanie', 'hawt', 100);
INSERT INTO characteristics(person, characteristic, scale) VALUES('tanya', 'nerdy', 10);
INSERT INTO characteristics(person, characteristic, scale) VALUES('tanya', 'lame', 500);
INSERT INTO characteristics(person, characteristic, scale) VALUES('tanya', 'fashionable', 1000);


DELETE FROM zodiac WHERE element='fire';
UPDATE family SET fname='spike' WHERE fname='doggo';
SELECT * FROM family WHERE sunsign='scorpio';
SELECT * FROM characteristics WHERE person='tanya';
SELECT fname, sunsign AS zodiac FROM family;
