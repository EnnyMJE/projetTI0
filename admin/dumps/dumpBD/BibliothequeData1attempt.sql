--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-27 00:22:10

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 24827)
-- Name: bibli_cat_livre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bibli_cat_livre (
    id_cat_livre integer NOT NULL,
    nom_cat character varying(50) NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 24811)
-- Name: bibli_livres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bibli_livres (
    id_livre bigint NOT NULL,
    titre_livre character varying(150) NOT NULL,
    author_livre character varying(50) NOT NULL,
    date_publication date NOT NULL,
    nbr_page integer NOT NULL,
    id_cat integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 24838)
-- Name: bibli_membres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bibli_membres (
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    ad_mail character varying(50) NOT NULL,
    mot_pass character varying(50) NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 24825)
-- Name: cat_livre_id_cat_livre_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cat_livre_id_cat_livre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 202
-- Name: cat_livre_id_cat_livre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cat_livre_id_cat_livre_seq OWNED BY public.bibli_cat_livre.id_cat_livre;


--
-- TOC entry 200 (class 1259 OID 24809)
-- Name: collection_livres_id_livre_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.collection_livres_id_livre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 200
-- Name: collection_livres_id_livre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.collection_livres_id_livre_seq OWNED BY public.bibli_livres.id_livre;


--
-- TOC entry 2861 (class 2604 OID 24830)
-- Name: bibli_cat_livre id_cat_livre; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_cat_livre ALTER COLUMN id_cat_livre SET DEFAULT nextval('public.cat_livre_id_cat_livre_seq'::regclass);


--
-- TOC entry 2860 (class 2604 OID 24814)
-- Name: bibli_livres id_livre; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_livres ALTER COLUMN id_livre SET DEFAULT nextval('public.collection_livres_id_livre_seq'::regclass);


--
-- TOC entry 3002 (class 0 OID 24827)
-- Dependencies: 203
-- Data for Name: bibli_cat_livre; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat) VALUES (1, 'enfants');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat) VALUES (2, 'biographie');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat) VALUES (3, 'divers');


--
-- TOC entry 3000 (class 0 OID 24811)
-- Dependencies: 201
-- Data for Name: bibli_livres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bibli_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat) VALUES (1, 'Au clair de la lune', 'Audrey Bord', '2017-01-01', 65, 1);
INSERT INTO public.bibli_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat) VALUES (2, 'Nihongo Shoho', 'The Japan Faundation', '2009-01-01', 150, 3);
INSERT INTO public.bibli_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat) VALUES (3, 'Becoming Michelle Obama', 'Michelle Obama', '2018-11-13', 448, 2);


--
-- TOC entry 3003 (class 0 OID 24838)
-- Dependencies: 204
-- Data for Name: bibli_membres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bibli_membres (nom, prenom, ad_mail, mot_pass) VALUES ('Jojo', 'Vanwes', 'jojo@gmail.com', 'jojovanwes');
INSERT INTO public.bibli_membres (nom, prenom, ad_mail, mot_pass) VALUES ('Ade', 'Vanwes', 'ade@gmail.com', 'adevanwes');


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 202
-- Name: cat_livre_id_cat_livre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cat_livre_id_cat_livre_seq', 3, true);


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 200
-- Name: collection_livres_id_livre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.collection_livres_id_livre_seq', 3, true);


--
-- TOC entry 2865 (class 2606 OID 24832)
-- Name: bibli_cat_livre cat_livre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_cat_livre
    ADD CONSTRAINT cat_livre_pkey PRIMARY KEY (id_cat_livre);


--
-- TOC entry 2863 (class 2606 OID 24816)
-- Name: bibli_livres collection_livres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_livres
    ADD CONSTRAINT collection_livres_pkey PRIMARY KEY (id_livre);


--
-- TOC entry 2867 (class 2606 OID 24842)
-- Name: bibli_membres membre_bibli_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_membres
    ADD CONSTRAINT membre_bibli_pkey PRIMARY KEY (ad_mail);


--
-- TOC entry 2868 (class 2606 OID 24833)
-- Name: bibli_livres collection_livres_id_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_livres
    ADD CONSTRAINT collection_livres_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public.bibli_cat_livre(id_cat_livre);


-- Completed on 2021-04-27 00:22:10

--
-- PostgreSQL database dump complete
--

