
--
-- TOC entry 206 (class 1255 OID 24844)
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


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 24827)
-- Name: bibli_cat_livre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bibli_cat_livre (
    id_cat_livre integer NOT NULL,
    nom_cat character varying(50) NOT NULL,
    image text
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
-- TOC entry 3017 (class 0 OID 0)
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
    photos character varying(50)
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
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 200
-- Name: collection_livres_id_livre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.collection_livres_id_livre_seq OWNED BY public.collection_livres.id_livre;


--
-- TOC entry 205 (class 1259 OID 24848)
-- Name: vue_livres_cat; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_livres_cat AS
 SELECT collection_livres.id_livre,
    collection_livres.titre_livre,
    collection_livres.author_livre,
    collection_livres.date_publication,
    collection_livres.nbr_page,
    collection_livres.photos,
    bibli_cat_livre.id_cat_livre,
    bibli_cat_livre.nom_cat
   FROM public.collection_livres,
    public.bibli_cat_livre
  WHERE (bibli_cat_livre.id_cat_livre = collection_livres.id_cat);


--
-- TOC entry 2867 (class 2604 OID 24830)
-- Name: bibli_cat_livre id_cat_livre; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_cat_livre ALTER COLUMN id_cat_livre SET DEFAULT nextval('public.cat_livre_id_cat_livre_seq'::regclass);


--
-- TOC entry 2866 (class 2604 OID 24814)
-- Name: collection_livres id_livre; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_livres ALTER COLUMN id_livre SET DEFAULT nextval('public.collection_livres_id_livre_seq'::regclass);


--
-- TOC entry 3009 (class 0 OID 24827)
-- Dependencies: 203
-- Data for Name: bibli_cat_livre; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image) VALUES (2, 'biographie', 'Becoming.jpg');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image) VALUES (1, 'enfants/bébés', 'au-clair-de-la-lune.jpg');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image) VALUES (3, 'divers', 'Nihongo-shoho.jpg');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image) VALUES (4, 'fiction', 'got1.jpg');
INSERT INTO public.bibli_cat_livre (id_cat_livre, nom_cat, image) VALUES (5, 'manga/bande dessinée', 'tintin-au-pays-des-soviets-fr.png');


--
-- TOC entry 3010 (class 0 OID 24838)
-- Dependencies: 204
-- Data for Name: bibli_membres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bibli_membres (nom, prenom, ad_mail, mot_pass) VALUES ('Jojo', 'Vanwes', 'jojo@gmail.com', 'jojovanwes');
INSERT INTO public.bibli_membres (nom, prenom, ad_mail, mot_pass) VALUES ('Ade', 'Vanwes', 'ade@gmail.com', 'adevanwes');


--
-- TOC entry 3007 (class 0 OID 24811)
-- Dependencies: 201
-- Data for Name: collection_livres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos) VALUES (1, 'Au clair de la lune', 'Audrey Bord', '2017-01-01', 65, 1, 'au-clair-de-la-lune.jpg');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos) VALUES (2, 'Nihongo Shoho', 'The Japan Faundation', '2009-01-01', 150, 3, 'Nihongo-shoho.jpg');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos) VALUES (3, 'Becoming Michelle Obama', 'Michelle Obama', '2018-11-13', 448, 2, 'Becoming.jpg');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos) VALUES (5, 'Tchoupi va à l''école comme un grand', 'Nathan', '2021-07-08', 14, 1, 'Tchoupi1.jpg');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos) VALUES (4, 'Les Aventures de TINTIN au pays des soviets', 'Casterman', '2000-07-29', 140, 5, 'tintin-au-pays-des-soviets-fr.png');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos) VALUES (6, 'Le Livre sans nom', 'Le Livre de Poche', '2011-06-01', 512, 4, 'got1.jpg');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos) VALUES (9, 'Tchoupi fête son anniversaire ', 'Nathan', '2017-01-12', 24, 1, 'Tchoupi_anniv.jpg');
INSERT INTO public.collection_livres (id_livre, titre_livre, author_livre, date_publication, nbr_page, id_cat, photos) VALUES (7, 'T''choupi va sur le pot', 'Nathan', '2017-01-12', 24, 1, 'Tchoupi_pot.jpg');


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 202
-- Name: cat_livre_id_cat_livre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cat_livre_id_cat_livre_seq', 5, true);


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 200
-- Name: collection_livres_id_livre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.collection_livres_id_livre_seq', 9, true);


--
-- TOC entry 2871 (class 2606 OID 24832)
-- Name: bibli_cat_livre cat_livre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_cat_livre
    ADD CONSTRAINT cat_livre_pkey PRIMARY KEY (id_cat_livre);


--
-- TOC entry 2869 (class 2606 OID 24816)
-- Name: collection_livres collection_livres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_livres
    ADD CONSTRAINT collection_livres_pkey PRIMARY KEY (id_livre);


--
-- TOC entry 2873 (class 2606 OID 24842)
-- Name: bibli_membres membre_bibli_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bibli_membres
    ADD CONSTRAINT membre_bibli_pkey PRIMARY KEY (ad_mail);


--
-- TOC entry 2874 (class 2606 OID 24833)
-- Name: collection_livres collection_livres_id_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_livres
    ADD CONSTRAINT collection_livres_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public.bibli_cat_livre(id_cat_livre);


-- Completed on 2021-07-29 15:31:33

--
-- PostgreSQL database dump complete
--

