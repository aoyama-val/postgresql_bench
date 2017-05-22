CREATE TABLE bus_locations (
    id bigserial NOT NULL PRIMARY KEY,
    bus_code character varying,
    positioning_time timestamp without time zone,
    latitude double precision,
    longitude double precision,
    altitude double precision,
    course double precision,
    speed double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    dropped smallint DEFAULT 0 NOT NULL,
    percentage double precision DEFAULT '-1.0'::numeric NOT NULL,
    olat double precision DEFAULT 0.0 NOT NULL,
    olng double precision DEFAULT 0.0 NOT NULL,
    x double precision DEFAULT 0.0 NOT NULL,
    y double precision DEFAULT 0.0 NOT NULL,
    battery_percent smallint,
    battery_status character varying DEFAULT ''::character varying NOT NULL,
    battery_source character varying DEFAULT ''::character varying NOT NULL,
    route_id integer,
    count_sensor character varying DEFAULT ''::character varying NOT NULL,
    accuracy double precision
);

CREATE INDEX index_bus_locations_on_bus_code_and_positioning_time ON bus_locations USING btree (bus_code, positioning_time);
CREATE INDEX index_bus_locations_on_positioning_time ON bus_locations USING btree (positioning_time);
