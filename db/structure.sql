--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying,
    care_type character varying,
    care_sub_type character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vendors (
    id integer NOT NULL,
    name character varying,
    category character varying,
    care_type character varying,
    care_sub_type character varying,
    address character varying,
    city character varying,
    state character varying,
    zip character varying,
    price_rating integer,
    wellist_id integer
);


--
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vendors_id_seq OWNED BY vendors.id;


--
-- Name: wellist_vendors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wellist_vendors (
    id integer NOT NULL,
    wellist_id integer,
    vendor_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: wellist_vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wellist_vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wellist_vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wellist_vendors_id_seq OWNED BY wellist_vendors.id;


--
-- Name: wellists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wellists (
    id integer NOT NULL,
    user_id integer,
    vendor_id integer
);


--
-- Name: wellists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wellists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wellists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wellists_id_seq OWNED BY wellists.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vendors ALTER COLUMN id SET DEFAULT nextval('vendors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wellist_vendors ALTER COLUMN id SET DEFAULT nextval('wellist_vendors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wellists ALTER COLUMN id SET DEFAULT nextval('wellists_id_seq'::regclass);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: wellist_vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wellist_vendors
    ADD CONSTRAINT wellist_vendors_pkey PRIMARY KEY (id);


--
-- Name: wellists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wellists
    ADD CONSTRAINT wellists_pkey PRIMARY KEY (id);


--
-- Name: index_vendors_on_wellist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vendors_on_wellist_id ON vendors USING btree (wellist_id);


--
-- Name: index_wellist_vendors_on_vendor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wellist_vendors_on_vendor_id ON wellist_vendors USING btree (vendor_id);


--
-- Name: index_wellist_vendors_on_wellist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wellist_vendors_on_wellist_id ON wellist_vendors USING btree (wellist_id);


--
-- Name: index_wellists_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wellists_on_user_id ON wellists USING btree (user_id);


--
-- Name: index_wellists_on_vendor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wellists_on_vendor_id ON wellists USING btree (vendor_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_02705fc62d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT fk_rails_02705fc62d FOREIGN KEY (wellist_id) REFERENCES wellists(id);


--
-- Name: fk_rails_13244e6239; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wellists
    ADD CONSTRAINT fk_rails_13244e6239 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_15c9c576f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wellists
    ADD CONSTRAINT fk_rails_15c9c576f3 FOREIGN KEY (vendor_id) REFERENCES vendors(id);


--
-- Name: fk_rails_67a7c2d068; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wellist_vendors
    ADD CONSTRAINT fk_rails_67a7c2d068 FOREIGN KEY (vendor_id) REFERENCES vendors(id);


--
-- Name: fk_rails_93d32d854d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wellist_vendors
    ADD CONSTRAINT fk_rails_93d32d854d FOREIGN KEY (wellist_id) REFERENCES wellists(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20151023204542');

INSERT INTO schema_migrations (version) VALUES ('20170707145125');

INSERT INTO schema_migrations (version) VALUES ('20170707152637');

INSERT INTO schema_migrations (version) VALUES ('20170710204809');

