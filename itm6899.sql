DROP TABLE IF EXISTS survey_lang;
CREATE TABLE survey_lang(
RespondentID VARCHAR(255),
AgeBeginCoding VARCHAR(255),
Age VARCHAR(255),
Gender VARCHAR(255),
HiringManager VARCHAR(255),
Industry VARCHAR(255),
Agnostic VARCHAR(255),
C VARCHAR(255),
CPlusPlus VARCHAR(255),
Java VARCHAR(255),
Python VARCHAR(255),
Ruby VARCHAR(255),
Javascript VARCHAR(255),
CSharp VARCHAR(255),
Go VARCHAR(255),
Scala VARCHAR(255),
Perl VARCHAR(255),
Swift VARCHAR(255),
Pascal VARCHAR(255),
Clojure VARCHAR(255),
PHP VARCHAR(255),
Haskell VARCHAR(255),
Lua VARCHAR(255),
R VARCHAR(255))

TRUNCATE TABLE survey_lang;
DELETE FROM survey_lang WHERE Gender= 'q3Gender';
DELETE FROM survey_lang 
WHERE 
(q3Gender = 'Non-Binary') OR 
(q3Gender = '');

DELETE FROM survey_lang WHERE HiringManager= 'No';
DROP TABLE IF EXISTS survey_1;
CREATE TABLE survey_1 AS
SELECT * FROM survey_lang 
WHERE industry = 'security';

 
-- 125 non-binary
-- data for employer languages
DROP TABLE IF EXISTS proficient_lang;
CREATE TABLE proficient_lang AS 
SELECT c AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY c UNION
SELECT CPlusPlus AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY CPlusPlus UNION
SELECT Java AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Java UNION
SELECT Python AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Python UNION
SELECT Ruby AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Ruby UNION
SELECT Javascript AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Javascript UNION
SELECT CSharp AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY CSharp UNION
SELECT Go AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Go UNION
SELECT Scala AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Scala UNION
SELECT Scala AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Scala UNION
SELECT Scala AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Scala UNION
SELECT Perl AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Perl UNION
SELECT Swift AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Swift UNION
SELECT Pascal AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Pascal UNION
SELECT Clojure AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Clojure UNION
SELECT PHP AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY PHP UNION
SELECT Haskell AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Haskell UNION
SELECT Lua AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY Lua UNION
SELECT R AS proficient_lang,COUNT(*) AS dev_count
FROM survey_lang
GROUP BY R;

DELETE FROM proficient_lang WHERE proficient_lang = ''
ALTER TABLE proficient_lang CHANGE q3Gender gender VARCHAR(255) NOT NULL;

DROP TABLE IF EXISTS `survey_learning`;
CREATE TABLE survey_learning (RespondentID VARCHAR(225),Gender VARCHAR(225),uni VARCHAR(225),
selftaught VARCHAR(225),accel VARCHAR(225),other VARCHAR(225));

DELETE FROM survey_learning WHERE gender= 'q3Gender';

-- learning methods 
SELECT uni AS method, COUNT(*) AS cnt
FROM survey_learning
GROUP BY uni
UNION
SELECT selftaught AS method, COUNT(*) AS cnt
FROM survey_learning
GROUP BY selftaught
UNION
SELECT accel AS method, COUNT(*) AS cnt
FROM survey_learning
GROUP BY accel
UNION
SELECT other AS method, COUNT(*) AS cnt
FROM survey_learning
GROUP BY other

DROP TABLE IF EXISTS languages;
CREATE TABLE languages(RespondentID VARCHAR(255), Gender VARCHAR(255), Student VARCHAR(255), C VARCHAR(255), CPlusPlus VARCHAR(255), Java VARCHAR(255), Python VARCHAR(255), Ruby VARCHAR(255), Javascript VARCHAR(255), 
CSharp VARCHAR(255), Go VARCHAR(255), Scala VARCHAR(255), Perl VARCHAR(255), Swift VARCHAR(255), Pascal VARCHAR(255), Clojure VARCHAR(255), PHP VARCHAR(255), Haskell VARCHAR(255), Lua VARCHAR(255), R VARCHAR(255), 
Rust VARCHAR(255), Typescript VARCHAR(255), Kotlin VARCHAR(255), Julia VARCHAR(255), Erlang VARCHAR(255), Ocaml VARCHAR(255));

DELETE FROM languages WHERE Gender= 'q3Gender';
UPDATE languages SET student = 'developer'
WHERE student != 'Students' -- 14379

-- table used for graphs on what students vs professioanls will learn
DROP TABLE IF EXISTS lang_cnt;
CREATE TABLE lang_cnt AS
SELECT student, 'C' AS LANGUAGE, C AS stage, COUNT(*) AS cnt
FROM languages 
GROUP BY student,C
UNION
SELECT student, 'CPlusPlus' AS LANGUAGE, CPlusPlus AS stage, COUNT(*) AS cnt 
FROM languages GROUP BY student,CPlusPlus
UNION
SELECT student, 'Java' AS LANGUAGE, Java AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student, Java
UNION
SELECT student, 'Python' AS LANGUAGE, python AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,python
UNION
SELECT student, 'Ruby' AS LANGUAGE, ruby AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,ruby
UNION
SELECT student, 'Javascript' AS LANGUAGE, Javascript AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,Javascript
UNION
SELECT student, 'CSharp' AS LANGUAGE, CSharp AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,CSharp
UNION
SELECT student, 'Go' AS LANGUAGE, Go AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,Go
UNION
SELECT student, 'Scala' AS LANGUAGE, Scala AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,Scala
UNION
SELECT student, 'Perl' AS LANGUAGE, Perl AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,Perl
UNION
SELECT student, 'Swift' AS LANGUAGE, Swift AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,Swift
UNION
SELECT student, 'Pascal' AS LANGUAGE, Perl AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,Perl
UNION
SELECT student, 'Clojure' AS LANGUAGE, Clojure AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,Clojure
UNION
SELECT student, 'PHP' AS LANGUAGE, PHP AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,PHP
UNION
SELECT student, 'Haskell' AS LANGUAGE, Haskell AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student,Haskell
UNION
SELECT student, 'Lua' AS LANGUAGE, Lua AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student, Lua
UNION
SELECT student, 'R' AS LANGUAGE, R AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student, R
UNION
SELECT student, 'Rust' AS LANGUAGE, Rust AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student, Rust
UNION
SELECT student, 'Typescript' AS LANGUAGE, Typescript AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student, Typescript
UNION
SELECT student, 'Kotlin' AS LANGUAGE, Kotlin AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student, Kotlin
UNION
SELECT student, 'Julia' AS LANGUAGE, Julia AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student, Julia
UNION
SELECT student, 'Erlang' AS LANGUAGE, Erlang AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student, Erlang
UNION
SELECT student, 'Ocaml' AS LANGUAGE, Ocaml AS stage, COUNT(*) AS cnt
FROM languages GROUP BY student, Ocaml;

DELETE FROM lang_cnt WHERE stage = ''; -- 46


DROP TABLE IF EXISTS lang_gender;
CREATE TABLE lang_gender
SELECT gender, 'C' AS LANGUAGE, C AS stage, COUNT(*) AS cnt
FROM languages 
GROUP BY gender,C UNION
SELECT gender, 'CPlusPlus' AS LANGUAGE, CPlusPlus AS stage, COUNT(*) AS cnt 
FROM languages GROUP BY gender,CPlusPlus UNION
SELECT gender, 'Java' AS LANGUAGE, Java AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender, Java UNION
SELECT gender, 'Python' AS LANGUAGE, python AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,python UNION
SELECT gender, 'Ruby' AS LANGUAGE, ruby AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,ruby UNION
SELECT gender, 'Javascript' AS LANGUAGE, Javascript AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,Javascript UNION
SELECT gender, 'CSharp' AS LANGUAGE, CSharp AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,CSharp UNION
SELECT gender, 'Go' AS LANGUAGE, Go AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,Go UNION
SELECT gender, 'Scala' AS LANGUAGE, Scala AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,Scala UNION
SELECT gender, 'Perl' AS LANGUAGE, Perl AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,Perl UNION
SELECT gender, 'Swift' AS LANGUAGE, Swift AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,Swift UNION
SELECT gender, 'Pascal' AS LANGUAGE, Perl AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,Perl UNION
SELECT gender, 'Clojure' AS LANGUAGE, Clojure AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,Clojure UNION
SELECT gender, 'PHP' AS LANGUAGE, PHP AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,PHP UNION
SELECT gender, 'Haskell' AS LANGUAGE, Haskell AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender,Haskell UNION
SELECT gender, 'Lua' AS LANGUAGE, Lua AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender, Lua UNION
SELECT gender, 'R' AS LANGUAGE, R AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender, R UNION
SELECT gender, 'Rust' AS LANGUAGE, Rust AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender, Rust UNION
SELECT gender, 'Typescript' AS LANGUAGE, Typescript AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender, Typescript UNION
SELECT gender, 'Kotlin' AS LANGUAGE, Kotlin AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender, Kotlin UNION
SELECT gender, 'Julia' AS LANGUAGE, Julia AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender, Julia UNION
SELECT gender, 'Erlang' AS LANGUAGE, Erlang AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender, Erlang UNION
SELECT gender, 'Ocaml' AS LANGUAGE, Ocaml AS stage, COUNT(*) AS cnt
FROM languages GROUP BY gender, Ocaml;

DELETE FROM lang_gender
WHERE gender NOT IN ('Female','Male')

DELETE FROM lang_gender WHERE stage IS NULL

DELETE FROM lang_gender WHERE stage = '';

SELECT * FROM lang_gender WHERE stage = 'Know'

ALTER TABLE lang_cnt ADD COLUMN total INT;
UPDATE lang_cnt
SET total = 
(SELECT COUNT(*) AS cnt FROM languages WHERE student = 'Students')
WHERE student = 'Students'

UPDATE lang_cnt
SET total = 
(SELECT COUNT(*) AS cnt FROM languages WHERE student = 'developer')
WHERE student = 'developer'


ALTER TABLE lang_cnt ADD COLUMN prop FLOAT;

UPDATE lang_cnt 
SET prop = ROUND(cnt/total,2);

DELETE FROM lang_cnt WHERE stage IS NULL;

-- used for potential heatmap betwn current age & age begin
-- not used in final report
DROP TABLE IF EXISTS success;
CREATE TABLE success AS
SELECT respondentid, agebegincoding,age,joblevel
FROM preferences 
WHERE agebegincoding NOT IN ('!','#NULL!')
AND age NOT IN ('!','#NULL!')
AND joblevel NOT IN ('student','','New grad');

ALTER TABLE success ADD COLUMN age_begin INT;
UPDATE success t1, mapping t2
SET age_begin = val
WHERE t1.agebegincoding = t2.words
AND t2.question = 'q1AgeBeginCoding'

CREATE TABLE mapping
(question VARCHAR(255), val INT(2), words VARCHAR(255));
DELETE FROM mapping WHERE words = 'label';

ALTER TABLE success ADD COLUMN age_code INT;
UPDATE success t1, mapping t2
SET age_code = val
WHERE t1.age = t2.words
AND t2.question = 'q2Age'

ALTER TABLE success ADD COLUMN success_code INT;
UPDATE success t1, mapping t2
SET success_code = val
WHERE t1.joblevel = t2.words
AND t2.question = 'q8JobLevel';

DELETE FROM success WHERE success_code = 11

SELECT * FROM success WHERE success_code > 3 -- 12221


SELECT * FROM survery_1 

