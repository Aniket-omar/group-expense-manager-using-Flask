drop table if exists users;
    create table users (
    id integer primary key autoincrement,
    username text not null,
    password text not null,
    email text not null
);

drop table if exists friendship;
    create table friendship (
    friendone text not null, 
    friendtwo text not null, 
    status integer not null,
    UNIQUE(friendone, friendtwo) ON CONFLICT REPLACE
    foreign key (friendone) references users(username),
    foreign key (friendtwo) references users(username),
    primary key (friendone, friendtwo)
);

drop table if exists groups;
    create table groups (
    gname text not null,
    admin text not null,
    memeber text not null,
    groupDate text
);

drop table if exists bill;
    create table bill (
    tid integer primary key autoincrement,
    gname text not null,
    admin text not null,
    lender text not null,
    receiver text not null,
    amount integer not null,
    label text
);

drop table if exists comments;
    create table comments(
        cid integer primary key autoincrement,
        gname text,
        admin text,
        parent integer,
        username text,
        comment text not null,
        commentDate text not null
);

drop table if exists activity;
    create table activity(
        lid integer primary key autoincrement,
      	user text,
		log text
);

CREATE TRIGGER aft_insert AFTER INSERT ON users
BEGIN
INSERT INTO login(id,password)
         VALUES(NEW.id,NEW.password);
END

CREATE PROCEDURE viewpassword(id integer) AS
BEGIN
 SELECT password from login where id= @id
END;
