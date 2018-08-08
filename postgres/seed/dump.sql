--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Debian 10.3-1.pgdg90+1)
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: login; Type: TABLE; Schema: public; Owner: tacotruffles
--

CREATE TABLE public.login (
    id integer NOT NULL,
    hash character varying(100) NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.login OWNER TO tacotruffles;

--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: tacotruffles
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_id_seq OWNER TO tacotruffles;

--
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tacotruffles
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tacotruffles
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email text NOT NULL,
    entries bigint DEFAULT 0,
    joined timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO tacotruffles;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tacotruffles
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO tacotruffles;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tacotruffles
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: login id; Type: DEFAULT; Schema: public; Owner: tacotruffles
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: tacotruffles
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: tacotruffles
--

COPY public.login (id, hash, email) FROM stdin;
1	$2a$10$Fo2QnC/f0vTQesmgGE36y.oQJCcV/dmGiIsEYKq5FaOxcGeeFYxmW	test@test.com
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tacotruffles
--

COPY public.users (id, name, email, entries, joined) FROM stdin;
1	Test	test@test.com	0	2018-08-08 23:11:06.179
\.


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tacotruffles
--

SELECT pg_catalog.setval('public.login_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tacotruffles
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: login login_email_key; Type: CONSTRAINT; Schema: public; Owner: tacotruffles
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_email_key UNIQUE (email);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: tacotruffles
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: tacotruffles
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tacotruffles
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

