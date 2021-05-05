--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-27 00:03:37

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
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 202
-- Name: cat_livre_id_cat_livre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cat_livre_id_cat_livre_seq', 3, true);


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 200
-- Name: collection_livres_id_livre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.collection_livres_id_livre_seq', 3, true);


-- Completed on 2021-04-27 00:03:40

--
-- PostgreSQL database dump complete
--

