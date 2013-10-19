-- 
-- Additional
--

create user contact_form with password 'contact_form';

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: contact_form; Tablespace: 
--

CREATE TABLE contacts (
    pk integer NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    address text NOT NULL,
    city text NOT NULL,
    state text NOT NULL,
    zip integer NOT NULL
);


ALTER TABLE public.contacts OWNER TO contact_form;

--
-- Name: contacts_pk_seq; Type: SEQUENCE; Schema: public; Owner: contact_form
--

CREATE SEQUENCE contacts_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_pk_seq OWNER TO contact_form;

--
-- Name: contacts_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: contact_form
--

ALTER SEQUENCE contacts_pk_seq OWNED BY contacts.pk;


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: contact_form
--

ALTER TABLE ONLY contacts ALTER COLUMN pk SET DEFAULT nextval('contacts_pk_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: contact_form
--

COPY contacts (pk, firstname, lastname, address, city, state, zip) FROM stdin;
26	Rafael	Pascual	kasjdfkl	kjaslkdfj	kjlkasdjf	23423
27	ksjdfl	kljasdklfj	kljlkasjdfkl	kjlkasjdkfl	kjsakdfj	23423
28	sadf	asdfas	dfs	fsdf	asdf	23423
29	sdfdsfdfs	ksdjf	kljdsfkl	kjlksjdf	kjkslf	243423
30	Rafael	Pascual	4828 V. Baltazar St. Pinagbuhatan	Pasig	Metro Manila	1602
31	sdfsd	sdfsadf	sdfsdf	sdfasdf	sdafasdf	234234
32	sdfdf	sdfsd	sdfsd	sdfsd	sdfsd	3534
33	askdfj	kjasdf	kjasdkfj	kasdjfk	asjdfkj	234
34	Rafael	kajsdf	kjklsdjf	kjklasjdf	kjskdfjk	234324
35	dsdf	sdf	sdfsdf	sdf	sdf	352345
\.


--
-- Name: contacts_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: contact_form
--

SELECT pg_catalog.setval('contacts_pk_seq', 35, true);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: contact_form; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (pk);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

