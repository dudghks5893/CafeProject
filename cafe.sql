CREATE DATABASE IF NOT EXISTS cafe DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
use cafe;

-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
-- drop table 은 맨 밑에 다 적어 놨습니다.

-- User Table Create SQL
CREATE TABLE User
(
    `userid`       varchar(30) not null    NOT NULL    COMMENT 'userid', 
    `password`     varchar(30) not null    NULL        COMMENT 'password', 
    `phonenumber`  VARCHAR(20) not null    NULL        COMMENT 'phonenumber', 
    `mail`         varchar(30)             NULL        COMMENT 'mail', 
    PRIMARY KEY (userid)
);

ALTER TABLE User COMMENT 'User';

select * from User;

insert into user values('dud','1234','00011117777','zfsa@naver.com');
insert into user values('abc','1234','00011117777','dfsa@naver.com');
insert into user values('admin','1234','00011117777','dfsa@naver.com');

-- User Table Create SQL
CREATE TABLE Coffee
(
    `cafeid`      INT not null auto_increment    NOT NULL    COMMENT 'cafeid', 
    `kind`        VARCHAR(20) not null           NULL        COMMENT 'kind', 
    `name`        VARCHAR(30) not null           NULL        COMMENT 'name', 
    `beans`       VARCHAR(30) not null           NULL        COMMENT 'beans', 
    `regist_day`  VARCHAR(30) not null           NULL        COMMENT 'regist_day', 
    `explan`      text not null                  NULL        COMMENT 'explan',
    `variety`       VARCHAR(30) not null           NULL        COMMENT 'variety',  
    `level`       VARCHAR(20) not null           NULL        COMMENT 'level', 
    `fileName`    VARCHAR(50) not null           NULL        COMMENT 'fileName', 
    PRIMARY KEY (cafeid)
);

ALTER TABLE Coffee COMMENT 'Coffee';

select * from Coffee;
insert into Coffee values('1','원두','아메리카노 원두','뭐시기생두를 사용합니다','수확시기는 언제입니다','재배고도는 몰라요','품종은 이래요','A등급입니다.','이미지파일');
insert into Coffee values('2','커피','카라멜마끼아또','뭐시기생두를 사용합니다','수확시기는 언제입니다','재배고도는 몰라요','품종은 이래요','A등급입니다.','이미지파일');

-- User Table Create SQL
CREATE TABLE Review
(
    `num`         INT not null auto_increment    NOT NULL    COMMENT 'num', 
    `userid`      VARCHAR(30) not null           NULL        COMMENT 'userid', 
    `content`     text not null                  NULL        COMMENT 'content', 
    `regist_day`  varchar(30)                    NULL        COMMENT 'regist_day', 
    `cafeid`      INT                            NULL        COMMENT 'cafeid', 
    PRIMARY KEY (num)
);

ALTER TABLE Review COMMENT 'Review';

ALTER TABLE Review
    ADD CONSTRAINT FK_Review_cafeid_Coffee_cafeid FOREIGN KEY (cafeid)
        REFERENCES Coffee (cafeid) on update cascade on delete cascade;

ALTER TABLE Review
    ADD CONSTRAINT FK_Review_userid_User_userid FOREIGN KEY (userid)
        REFERENCES User (userid) on update cascade on delete cascade;

select * from Review;
select num from review order by num desc;

select count(*) from review;
select count(*) from review where cafeid='1';
select count(*) from review where userid='abc';
select * from review where userid = 'abc' order by num desc;
select * from review where cafeid = '1';
select count(*) from review where userid='dud' and content like '%안녕%';
select review.*,coffee.name from Review,Coffee where Review.cafeid = Coffee.cafeid and userid='dud' and num <= 24 and (content like '%안녕%'or review.regist_day like '%안녕%'or name like'%안녕%'or userid like '%안녕%') order by num desc; -- 마이 리뷰 검색기능
select review.*,coffee.name from Review,Coffee where Review.cafeid = Coffee.cafeid and userid='abc' and num <= 21 order by num desc ; -- 마이 리뷰
select * from Review,Coffee where Review.cafeid = Coffee.cafeid and userid= 'dud' and num < 3 order by num desc limit 3;  -- 마이 리뷰
select * from Review,Coffee where Review.cafeid = Coffee.cafeid and Coffee.cafeid=2 order by num desc limit 2; -- 상품 2번 리뷰

insert into review values('1','dud','안녕하세요 제가 이거 자주 사용하는 원두입니다!!','2021-01-18','2');
insert into review values('2','dud','안녕 내이름은 김하온 탑정이지','2021-01-18','1');
insert into review values('3','dud','이거 리얼 맛도리','2021-01-19','2');
insert into review values('4','dud','제가 자주 먹는건데','2021-01-18','1');
insert into review values('5','dud','내용좀 다르게 적어봅니다.','2021-01-18','2');
insert into review values('6','abc','abc아이디로 리뷰 작성합니다.','2021-01-18','2');
insert into review values('7','dud','dud아이디로 리뷰 작성합니다.','2021-01-19','2');
insert into review values('8','dud','가나다라마바사','2021-01-20','2');
insert into review values('9','abc','abc아이디로 리뷰 작성합니다.','2021-01-18','2');
insert into review values('10','dud','안녕하세요 10번째 등록이네요 ㅎㅎ','2021-01-18','1');
insert into review values('11','dud','펭하 펭하 펭하 펭하','2021-01-18','2');
insert into review values('12','abc','안녕하세요 abc아이디로 리뷰 작성합니다.','2021-01-18','2');
insert into review values('13','abc','안녕하세요22 abc아이디로 리뷰 작성합니다.','2021-01-18','2');
insert into review values('14','dud','안녕하세요 111','2021-01-18','2');
insert into review values('15','dud','안녕하세요 222','2021-01-18','1');
insert into review values('16','dud','안녕하세요 333','2021-01-18','2');
insert into review values('17','dud','안녕하세요 444','2021-01-18','1');
insert into review values('18','dud','5555','2021-01-18','1');
insert into review values('19','dud','안녕하세요 555','2021-01-18','2');
insert into review values('20','dud','666','2021-01-18','2');
insert into review values('21','dud','안녕하세요 666','2021-01-18','1');
insert into review values('22','abc','안녕하세요 abc111','2021-01-18','1');
insert into review values('23','abc','abc 2222222','2021-01-18','1');
insert into review values('24','abc','안녕 abc로 작성3333','2021-01-18','1');
insert into review values('24','dud','안녕 dud로 작성124235','2021-01-18','1');
insert into review values('25','dud','','','1');


-- User Table Create SQL
CREATE TABLE Notie
(
    `num`         INT not null auto_increment    NOT NULL    COMMENT 'num', 
    `title`       VARCHAR(50) not null           NULL        COMMENT 'title', 
    `content`     text not null                  NULL        COMMENT 'content', 
    `regist_day`  varchar(30)                    NULL        COMMENT 'regist_day', 
    `fileName`    VARCHAR(50) not null           NULL        COMMENT 'fileName', 
    `userid`      VARCHAR(30) not null           NULL        COMMENT 'userid', 
    PRIMARY KEY (num)
);

ALTER TABLE Notie COMMENT 'Notie';

SELECT * FROM notie ORDER BY num DESC;
select * from Notie;

insert into notie values('1','시험','테스트해봅니다','2021-01-18','','admin');




-- User Table Create SQL
CREATE TABLE Cusvoice
(
    `num`         INT not null auto_increment    NOT NULL    COMMENT 'num', 
    `title`       VARCHAR(50) not null           NULL        COMMENT 'title', 
    `content`     text not null                  NULL        COMMENT 'content', 
    `regist_day`  varchar(30)                    NULL        COMMENT 'regist_day', 
    `userid`      VARCHAR(30) not null           NULL        COMMENT 'userid', 
    PRIMARY KEY (num)
);

ALTER TABLE Cusvoice COMMENT 'Cusvoice';

ALTER TABLE Cusvoice
    ADD CONSTRAINT FK_Cusvoice_userid_User_userid FOREIGN KEY (userid)
        REFERENCES User (userid) on update cascade on delete cascade;

select * from Cusvoice;

insert into Cusvoice values('1','요구사항 있습니다!','이러쿵저러쿵 이런거저런거 요구 합니다!','2021-01-21','dud');
insert into Cusvoice values('2','건의좀 해봅니다','어쩌고 저쩌고 요구 합니다!','2021-01-22','dud');
insert into Cusvoice values('3','언제나 감사합니다!','맛있는 커피 개발해 주셔서 감사합니다!','2021-01-23','dud');
insert into Cusvoice values('4','오늘 가입했습니다!','안녕하세요!!','2021-01-24','dud');
insert into Cusvoice values('5','커피 맛있네요ㅎㅎ','따끈따끈 커피','2021-01-24','dud');
insert into Cusvoice values('6','abc로 글 남김','ㅎㅎㅎㅎㅎㅎ 커피','2021-01-24','abc');
insert into Cusvoice values('7','abc로 글 남김2222','ㅎㅎㅎㅎㅎㅎ2222 커피','2021-01-24','abc');
insert into Cusvoice values('8','abc로 글 남김33333','ㅎㅎㅎㅎㅎㅎ3333 커피','2021-01-24','abc');
insert into Cusvoice values('9','abc로 글 남김4444','ㅎㅎㅎㅎㅎㅎ4444 커피','2021-01-24','abc');
insert into Cusvoice values('10','abc로 글 남김55555','ㅎㅎㅎㅎㅎㅎ55555 커피','2021-01-24','abc');
insert into Cusvoice values('11','abc로 글 남김666666','ㅎㅎㅎㅎㅎㅎ666666 커피','2021-01-24','abc');
insert into Cusvoice values('12','dud 로 글남김커피 맛있네요ㅎㅎ777777','따끈따끈 커피777777','2021-01-24','dud');
insert into Cusvoice values('13','abc로 글 남김888888','ㅎㅎㅎㅎㅎㅎ666666 커피','2021-01-24','abc');
insert into Cusvoice values('14','abc로 글 남김999999','ㅎㅎㅎ99ㅎㅎ99996 커피','2021-01-24','abc');
insert into Cusvoice values('15','dud로 글 남김888888','ㅎㅎㅎㅎㅎㅎ666666 커피','2021-01-24','dud');
insert into Cusvoice values('16','dud로 글 남김9999','ㅎㅎㅎㅎㅎㅎ666666 커피','2021-01-24','dud');
insert into Cusvoice values('17','dud로 글 남김101010','ㅎㅎㅎㅎㅎㅎ666666 커피','2021-01-24','dud');
insert into Cusvoice values('18','펭하1111111','ㅎㅎㅎㅎㅎㅎ666666 커피','2021-01-24','dud');
insert into Cusvoice values('19','펭하222222','ㅎㅎㅎㅎㅎㅎ666666 커피','2021-01-24','dud');
insert into Cusvoice values('20','펭하333333','ㅎㅎㅎㅎㅎㅎ666666 커피','2021-01-24','dud');
insert into Cusvoice values('21','펭하4444441','ㅎㅎㅎㅎㅎㅎ666666 커피','2021-01-24','dud');


drop table review;
drop table cusvoice;
drop table notie;
drop table coffee;
drop table user;