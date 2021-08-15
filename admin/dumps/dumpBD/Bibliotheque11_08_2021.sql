--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-08-11 11:28:15

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
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 209 (class 1255 OID 24844)
-- Name: ajout_categorie(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_categorie(text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_cat alias for $1;
	declare id integer;
	declare retour integer;
begin
	select into id id_cat_livre from bibli_cat_livre where nom_cat = f_nom_cat;
	if not found
	then
		insert into bibli_cat_livre(nom_cat) values(f_nom_cat);
		retour = 1;
	else
		retour = 0;
	end if;
	return retour;
end;
';


--
-- TOC entry 210 (class 1255 OID 24863)
-- Name: is_admin(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_login alias for $1;
	declare f_password alias for $2;
	declare id integer;
	declare retour integer;
begin
	select into id id_admin from bibli_admin where login = f_login and password = f_password;
	if not found
	then
		retour = 0;
	else
		retour = 1;
		
	end if;
	return retour;
end;
';


--
-- TOC entry 212 (class 1255 OID 24888)
-- Name: is_mail(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_mail(text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_mail alias for $1;
	declare id integer;
	declare retour integer;
begin
	select into id id_membre from bibli_membres where ad_mail = f_mail;
	if not found
	then
		retour = 0;
	else
		retour = 1;
		
	end if;
	return retour;
end;
';


--
-- TOC entry 211 (class 1255 OID 24885)
-- Name: is_membre(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_membre(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_mail alias for $1;
	declare f_motpass alias for $2;
	declare id integer;
	declare retour integer;
begin
	select into id id_membre from bibli_membres where ad_mail = f_mail and mot_pass = f_motpass;
	if not found
	then
		retour = 0;
	else
		retour = 1;
		
	end if;
	return retour;
end;
';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 24854)
-- Name: bibli_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bibli_admin (
    id_admin integer NOT NULL,
    login text,
    password text
);


--
-- TOC entry 205 (class 1259 OID 24852)
-- Name: bibli_admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bibli_admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 205
-- Name: bibli_admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bibli_admin_id_admin_seq OWNED BY public.bibli_admin.id_admin;


--
-- TOC entry 203 (class 1259 OID 24827)
-- Name: bibli_cat_livre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bibli_cat_livre (
    id_cat_livre integer NOT NULL,
    nom_cat character varying(50) NOT NULL,
    image text,
    detail_cat character varying(250)
);


--
-- TOC entry 204 (class 1259 OID 24838)
-- Name: bibli_membres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bibli_membres (
    ad_mail character varying(50) NOT NULL,
    mot_pass character varying(50) NOT NULL,
    id_membre integer NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 24875)
-- Name: bibli_membres_id_membre_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bibli_membres_id_membre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 208
-- Name: bibli_membres_id_membre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bibli_membres_id_membre_seq OWNED BY public.bibli_membres.id_membre;


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
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 202
-- Name: cat_livre_id_cat_livre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cat_livre_id_cat_livre_seq OWNED BY public.bibli_cat_livre.id_cat_livre;


--
-- TOC entry 201 (class 1259 OID 24811)
-- Name: collection_livres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection_livres (
    id_livre bigint NOT NULL,
    titre_livre character varying(150) NOT NULL,
    author_livre character varying(50) NOT NULL,
    date_publication date NOT NULL,
    nbr_page integer NOT NULL,
    id_cat integer NOT NULL,
    photos character varying(50),
    livre_status character varying(100),
    reference text
);


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
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 200
-- Name: collection_livres_id_livre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.collection_livres_id_livre_seq OWNED BY public.collection_livres.id_livre;


--
-- TOC entry 207 (class 1259 OID 24871)
-- Name: vue_livres_cat; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_livres_cat AS
 SELECT collection_livres.id_livre,
    collection_livres.titre_livre,
    collection_livres.author_livre,
    collection_livres.date_publication,
    collection_livres.nbr_page,
    collection_livres.photos,
    collection_livres.livre_status,
    collection_livres.reference,
    bibli_cat_livre.id_cat_livre,
    bibli_cat_livre.nom_cat,
    bibli_cat_livre.detail_cat
   FROM public.collection_livres,
    public.bibli_cat_livre
  WHERE (bibli_cat_livre.id_cat_livre = collection_livres.id_cat);


--
-- TOC entry 2882 (class 2604 OID 24857)
-- Name: bibli_admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_admin ALTER COLUMN id_admin SET DEFAULT nextval('public.bibli_admin_id_admin_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 24830)
-- Name: bibli_cat_livre id_cat_livre; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_cat_livre ALTER COLUMN id_cat_livre SET DEFAULT nextval('public.cat_livre_id_cat_livre_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 24877)
-- Name: bibli_membres id_membre; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_membres ALTER COLUMN id_membre SET DEFAULT nextval('public.bibli_membres_id_membre_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 24814)
-- Name: collection_livres id_livre; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_livres ALTER COLUMN id_livre SET DEFAULT nextval('public.collection_livres_id_livre_seq'::regclass);


--
-- TOC entry 3031 (class 0 OID 24854)
-- Dependencies: 206
-- Data for Name: bibli_admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bibli_admin (id_admin, login, password) VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3');


--
-- TOC entry 3028 (class 0 OID 24827)
-- Dependencies: 203
-- Data for Name: bibli_cat_livre; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image, detail_cat) VALUES (1, 'enfants/bébés', 'au-clair-de-la-lune.jpg', 'les livres pour l''ages de 0-10ans');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image, detail_cat) VALUES (4, 'fiction', 'got1.jpg', 'La fiction est toute œuvre créative (principalement toute œuvre narrative) composée de personnes, d''événements ou de lieux imaginaires');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image, detail_cat) VALUES (5, 'manga/bande dessinée', 'tintin-au-pays-des-soviets-fr.png', 'La bande dessinée est un art à la croisée de l''écriture littéraire et de l''écriture graphique.');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image, detail_cat) VALUES (2, 'biographie', 'Becoming.jpg', 'Une biographie (du grec ancien bios, « la vie » et graphein, « écrire ») est un écrit qui a pour objet l''histoire d''une vie particulière. ');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image, detail_cat) VALUES (3, 'divers', 'Nihongo-shoho.jpg', 'Divers de notre collection de livres');


--
-- TOC entry 3029 (class 0 OID 24838)
-- Dependencies: 204
-- Data for Name: bibli_membres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bibli_membres (ad_mail, mot_pass, id_membre) VALUES ('jojo@gmail.com', 'jojovanwes', 1);
INSERT INTO public.bibli_membres (ad_mail, mot_pass, id_membre) VALUES ('ade@gmail.com', 'adevanwes', 2);


--
-- TOC entry 3026 (class 0 OID 24811)
-- Dependencies: 201
-- Data for Name: collection_livres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos, livre_status, reference) VALUES (2, 'Nihongo Shoho', 'The JF', '2009-01-01', 150, 3, 'Nihongo-shoho.jpg', 'disponible', 'E2');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos, livre_status, reference) VALUES (4, 'Les Aventures de TINTIN au pays des soviets', 'Casterman', '2000-07-29', 140, 5, 'tintin-au-pays-des-soviets-fr.png', 'non disponible', 'E5');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos, livre_status, reference) VALUES (3, 'Becoming Michelle Obama', 'Michelle Obama', '2018-11-13', 448, 2, 'Becoming.jpg', 'disponible', 'E3');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos, livre_status, reference) VALUES (5, 'Tchoupi va à l''école comme un grand', 'Nathan', '2021-07-08', 14, 1, 'Tchoupi1.jpg', 'perdu, en attente de remplacement', 'E4');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos, livre_status, reference) VALUES (9, 'Tchoupi fête son anniversaire ', 'Nathan', '2017-01-12', 24, 1, 'Tchoupi_anniv.jpg', 'disponible avec temp limité a 3 jours', 'E6');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos, livre_status, reference) VALUES (7, 'T''choupi va sur le pot', 'Nathan', '2017-01-12', 24, 1, 'Tchoupi_pot.jpg', 'disponible', 'E7');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos, livre_status, reference) VALUES (6, 'Le Livre sans nom', 'Le Livre de Poche', '2011-06-01', 512, 4, 'got1.jpg', 'disponible', 'E8');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos, livre_status, reference) VALUES (1, 'Au clair de la lune', 'Audrey Bord', '2017-01-01', 65, 1, 'au-clair-de-la-lune.jpg', 'disponible', 'E1');


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 205
-- Name: bibli_admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bibli_admin_id_admin_seq', 1, true);


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 208
-- Name: bibli_membres_id_membre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bibli_membres_id_membre_seq', 2, true);


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 202
-- Name: cat_livre_id_cat_livre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cat_livre_id_cat_livre_seq', 5, true);


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 200
-- Name: collection_livres_id_livre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.collection_livres_id_livre_seq', 24, true);


--
-- TOC entry 2892 (class 2606 OID 24862)
-- Name: bibli_admin bibli_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_admin
    ADD CONSTRAINT bibli_admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 2886 (class 2606 OID 24832)
-- Name: bibli_cat_livre cat_livre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_cat_livre
    ADD CONSTRAINT cat_livre_pkey PRIMARY KEY (id_cat_livre);


--
-- TOC entry 2884 (class 2606 OID 24816)
-- Name: collection_livres collection_livres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_livres
    ADD CONSTRAINT collection_livres_pkey PRIMARY KEY (id_livre);


--
-- TOC entry 2888 (class 2606 OID 24842)
-- Name: bibli_membres membre_bibli_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_membres
    ADD CONSTRAINT membre_bibli_pkey PRIMARY KEY (ad_mail);


--
-- TOC entry 2890 (class 2606 OID 24883)
-- Name: bibli_membres u_membre; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_membres
    ADD CONSTRAINT u_membre UNIQUE (id_membre);


--
-- TOC entry 2893 (class 2606 OID 24833)
-- Name: collection_livres collection_livres_id_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_livres
    ADD CONSTRAINT collection_livres_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public.bibli_cat_livre(id_cat_livre);


-- Completed on 2021-08-11 11:28:18

--
-- PostgreSQL database dump complete
--

