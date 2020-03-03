--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: boards; Type: SCHEMA; Schema: -; Owner: csandras
--

CREATE SCHEMA boards;


ALTER SCHEMA boards OWNER TO csandras;

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
-- Name: boards; Type: TABLE; Schema: public; Owner: csandras
--

CREATE TABLE public.boards (
    boards_id integer NOT NULL,
    boards_title character varying
);


ALTER TABLE public.boards OWNER TO csandras;

--
-- Name: boards_boards_id_seq; Type: SEQUENCE; Schema: public; Owner: csandras
--

CREATE SEQUENCE public.boards_boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_boards_id_seq OWNER TO csandras;

--
-- Name: boards_boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: csandras
--

ALTER SEQUENCE public.boards_boards_id_seq OWNED BY public.boards.boards_id;


--
-- Name: cards; Type: TABLE; Schema: public; Owner: csandras
--

CREATE TABLE public.cards (
    cards_id integer NOT NULL,
    boards_id integer,
    cards_title character varying,
    statuses_id integer,
    cards_order integer
);


ALTER TABLE public.cards OWNER TO csandras;

--
-- Name: cards_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: csandras
--

CREATE SEQUENCE public.cards_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_cards_id_seq OWNER TO csandras;

--
-- Name: cards_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: csandras
--

ALTER SEQUENCE public.cards_cards_id_seq OWNED BY public.cards.cards_id;


--
-- Name: statuses; Type: TABLE; Schema: public; Owner: csandras
--

CREATE TABLE public.statuses (
    statuses_id integer NOT NULL,
    statuses_title character varying
);


ALTER TABLE public.statuses OWNER TO csandras;

--
-- Name: statuses_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: csandras
--

CREATE SEQUENCE public.statuses_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statuses_statuses_id_seq OWNER TO csandras;

--
-- Name: statuses_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: csandras
--

ALTER SEQUENCE public.statuses_statuses_id_seq OWNED BY public.statuses.statuses_id;


--
-- Name: boards boards_id; Type: DEFAULT; Schema: public; Owner: csandras
--

ALTER TABLE ONLY public.boards ALTER COLUMN boards_id SET DEFAULT nextval('public.boards_boards_id_seq'::regclass);


--
-- Name: cards cards_id; Type: DEFAULT; Schema: public; Owner: csandras
--

ALTER TABLE ONLY public.cards ALTER COLUMN cards_id SET DEFAULT nextval('public.cards_cards_id_seq'::regclass);


--
-- Name: statuses statuses_id; Type: DEFAULT; Schema: public; Owner: csandras
--

ALTER TABLE ONLY public.statuses ALTER COLUMN statuses_id SET DEFAULT nextval('public.statuses_statuses_id_seq'::regclass);


--
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: csandras
--

COPY public.boards (boards_id, boards_title) FROM stdin;
1	Board 1
2	Board 2
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: csandras
--

COPY public.cards (cards_id, boards_id, cards_title, statuses_id, cards_order) FROM stdin;
5	1	done card 1	4	0
4	1	planning	3	0
6	1	done card 1	4	1
11	2	done card 1	4	0
10	2	planning	3	0
9	2	in progress card	2	0
7	2	new card 1	1	0
8	2	new card 2	1	1
3	1	in progress card	2	0
1	1	new card 1	1	0
2	1	new card 2	1	1
12	2	done card 1	4	1
\.


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: csandras
--

COPY public.statuses (statuses_id, statuses_title) FROM stdin;
1	new
2	"in progress"
3	testing
4	done
\.


--
-- Name: boards_boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: csandras
--

SELECT pg_catalog.setval('public.boards_boards_id_seq', 2, true);


--
-- Name: cards_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: csandras
--

SELECT pg_catalog.setval('public.cards_cards_id_seq', 12, true);


--
-- Name: statuses_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: csandras
--

SELECT pg_catalog.setval('public.statuses_statuses_id_seq', 4, true);


--
-- Name: boards boards_pk; Type: CONSTRAINT; Schema: public; Owner: csandras
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pk PRIMARY KEY (boards_id);


--
-- Name: cards cards_pk; Type: CONSTRAINT; Schema: public; Owner: csandras
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pk PRIMARY KEY (cards_id);


--
-- Name: statuses statuses_pk; Type: CONSTRAINT; Schema: public; Owner: csandras
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pk PRIMARY KEY (statuses_id);


--
-- Name: boards_boards_id_uindex; Type: INDEX; Schema: public; Owner: csandras
--

CREATE UNIQUE INDEX boards_boards_id_uindex ON public.boards USING btree (boards_id);


--
-- Name: cards_cards_id_uindex; Type: INDEX; Schema: public; Owner: csandras
--

CREATE UNIQUE INDEX cards_cards_id_uindex ON public.cards USING btree (cards_id);


--
-- Name: statuses_statuses_id_uindex; Type: INDEX; Schema: public; Owner: csandras
--

CREATE UNIQUE INDEX statuses_statuses_id_uindex ON public.statuses USING btree (statuses_id);


--
-- Name: cards boards_id; Type: FK CONSTRAINT; Schema: public; Owner: csandras
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT boards_id FOREIGN KEY (boards_id) REFERENCES public.boards(boards_id);


--
-- Name: cards statuses_id; Type: FK CONSTRAINT; Schema: public; Owner: csandras
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT statuses_id FOREIGN KEY (statuses_id) REFERENCES public.statuses(statuses_id);


--
-- PostgreSQL database dump complete
--

