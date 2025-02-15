CREATE TABLE movement (
    id serial primary key,
    thing_id integer,
    geometry GEOMETRY(Point, 4326) NOT NULL,
    geometry_string varchar(50) not null,
    dt TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    speed_mph integer not null
);

insert into movement(thing_id, geometry,geometry_string,  dt, speed_mph) values (55, ST_GeomFromText('Point(-90 38.5)'),'Point(-90 38.5)', '2004-10-19 10:23:54', 12) ;  
insert into movement(thing_id, geometry,geometry_string, dt, speed_mph) values (55, ST_GeomFromText('Point(-90 38.501)'),'Point(-90 38.501)', '2004-10-19 11:23:54', 12) ;  
insert into movement(thing_id, geometry,geometry_string, dt, speed_mph) values (35, ST_GeomFromText('Point(-90.0 38.5)'),'Point(-90.0 38.5)', '2004-10-19 08:23:54', 12) ;  
insert into movement(thing_id, geometry,geometry_string, dt, speed_mph) values (35, ST_GeomFromText('Point(-90.1 38.58)'),'Point(-90.1 38.58)', '2004-10-19 11:23:54', 120) ;  

CREATE TABLE movement_report (
    id serial primary key,
    target_thing_id integer,
    geometry GEOMETRY(Point, 4326) NOT NULL,
    geometry_string varchar(50) not null,
    geometry_json json ,
    dt TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    speed_mph integer not null
);

insert into movement_report(target_thing_id, geometry,geometry_string,geometry_json, dt, speed_mph) values (55, ST_GeomFromText('Point(-90 38.5)'),'Point(-90 38.5)','{"coordinates":[-90,38.5]}', '2004-10-19 10:23:54', 12) ;  
insert into movement_report(target_thing_id, geometry,geometry_string, dt, speed_mph) values (55, ST_GeomFromText('Point(-90 38.501)'),'Point(-90 38.501)', '2004-10-19 11:23:54', 12) ;  
insert into movement_report(target_thing_id, geometry,geometry_string, dt, speed_mph) values (35, ST_GeomFromText('Point(-90.0 38.5002)'),'Point(-90.0 38.5002)', '2004-10-19 08:24:54', 12) ;  
insert into movement_report(target_thing_id, geometry,geometry_string, dt, speed_mph) values (35, ST_GeomFromText('Point(-90.01 38.58)'),'Point(-90.01 38.58)', '2004-10-19 11:29:04', 129) ;  
