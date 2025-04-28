--
-- PostgreSQL database dump
--

-- Dumped from database version 13.20 (Debian 13.20-0+deb11u1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-04-28 17:16:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 29020)
-- Name: biglietto; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.biglietto (
    id_biglietto integer NOT NULL,
    data_emissione date NOT NULL,
    prezzo numeric(10,2) NOT NULL,
    stato character varying(20) NOT NULL,
    cod_validazione character varying(50),
    id_tratta integer
);


ALTER TABLE public.biglietto OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 202 (class 1259 OID 29032)
-- Name: nave; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.nave (
    id_nave integer NOT NULL,
    nome character varying(100),
    tipologia character varying(50),
    capacita integer,
    dotazioni text
);


ALTER TABLE public.nave OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 206 (class 1259 OID 29065)
-- Name: nave_tratta; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.nave_tratta (
    id_nave integer NOT NULL,
    id_tratta integer NOT NULL
);


ALTER TABLE public.nave_tratta OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 203 (class 1259 OID 29040)
-- Name: passeggero; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.passeggero (
    id_passeggero integer NOT NULL,
    nome character varying(50),
    cognome character varying(100),
    data_nascita date,
    documenti character varying(100),
    contatti character varying(100)
);


ALTER TABLE public.passeggero OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 205 (class 1259 OID 29060)
-- Name: porto; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.porto (
    id_porto integer NOT NULL,
    nome character varying(100),
    ubicazione character varying(150),
    orari_operativi character varying(100)
);


ALTER TABLE public.porto OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 204 (class 1259 OID 29045)
-- Name: prenotazione; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.prenotazione (
    id_prenotazione integer NOT NULL,
    data_prenotazione date NOT NULL,
    stato character varying(20),
    id_biglietto integer,
    id_passeggero integer
);


ALTER TABLE public.prenotazione OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 200 (class 1259 OID 29015)
-- Name: tratta; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.tratta (
    id_tratta integer NOT NULL,
    porto_partenza character varying(50) NOT NULL,
    porto_arrivo character varying(50) NOT NULL,
    durata integer NOT NULL,
    distanza numeric(10,2)
);


ALTER TABLE public.tratta OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3028 (class 0 OID 29020)
-- Dependencies: 201
-- Data for Name: biglietto; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.biglietto (id_biglietto, data_emissione, prezzo, stato, cod_validazione, id_tratta) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 29032)
-- Dependencies: 202
-- Data for Name: nave; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.nave (id_nave, nome, tipologia, capacita, dotazioni) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 29065)
-- Dependencies: 206
-- Data for Name: nave_tratta; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.nave_tratta (id_nave, id_tratta) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 29040)
-- Dependencies: 203
-- Data for Name: passeggero; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.passeggero (id_passeggero, nome, cognome, data_nascita, documenti, contatti) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 29060)
-- Dependencies: 205
-- Data for Name: porto; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.porto (id_porto, nome, ubicazione, orari_operativi) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 29045)
-- Dependencies: 204
-- Data for Name: prenotazione; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.prenotazione (id_prenotazione, data_prenotazione, stato, id_biglietto, id_passeggero) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 29015)
-- Dependencies: 200
-- Data for Name: tratta; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.tratta (id_tratta, porto_partenza, porto_arrivo, durata, distanza) FROM stdin;
\.


--
-- TOC entry 2879 (class 2606 OID 29026)
-- Name: biglietto biglietto_cod_validazione_key; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_cod_validazione_key UNIQUE (cod_validazione);


--
-- TOC entry 2881 (class 2606 OID 29024)
-- Name: biglietto biglietto_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_pkey PRIMARY KEY (id_biglietto);


--
-- TOC entry 2883 (class 2606 OID 29039)
-- Name: nave nave_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.nave
    ADD CONSTRAINT nave_pkey PRIMARY KEY (id_nave);


--
-- TOC entry 2891 (class 2606 OID 29069)
-- Name: nave_tratta nave_tratta_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.nave_tratta
    ADD CONSTRAINT nave_tratta_pkey PRIMARY KEY (id_nave, id_tratta);


--
-- TOC entry 2885 (class 2606 OID 29044)
-- Name: passeggero passeggero_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.passeggero
    ADD CONSTRAINT passeggero_pkey PRIMARY KEY (id_passeggero);


--
-- TOC entry 2889 (class 2606 OID 29064)
-- Name: porto porto_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.porto
    ADD CONSTRAINT porto_pkey PRIMARY KEY (id_porto);


--
-- TOC entry 2887 (class 2606 OID 29049)
-- Name: prenotazione prenotazione_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_pkey PRIMARY KEY (id_prenotazione);


--
-- TOC entry 2877 (class 2606 OID 29019)
-- Name: tratta tratta_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_pkey PRIMARY KEY (id_tratta);


--
-- TOC entry 2892 (class 2606 OID 29027)
-- Name: biglietto biglietto_id_tratta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_id_tratta_fkey FOREIGN KEY (id_tratta) REFERENCES public.tratta(id_tratta);


--
-- TOC entry 2895 (class 2606 OID 29070)
-- Name: nave_tratta nave_tratta_id_nave_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.nave_tratta
    ADD CONSTRAINT nave_tratta_id_nave_fkey FOREIGN KEY (id_nave) REFERENCES public.nave(id_nave);


--
-- TOC entry 2896 (class 2606 OID 29075)
-- Name: nave_tratta nave_tratta_id_tratta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.nave_tratta
    ADD CONSTRAINT nave_tratta_id_tratta_fkey FOREIGN KEY (id_tratta) REFERENCES public.tratta(id_tratta);


--
-- TOC entry 2893 (class 2606 OID 29050)
-- Name: prenotazione prenotazione_id_biglietto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_id_biglietto_fkey FOREIGN KEY (id_biglietto) REFERENCES public.biglietto(id_biglietto);


--
-- TOC entry 2894 (class 2606 OID 29055)
-- Name: prenotazione prenotazione_id_passeggero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_id_passeggero_fkey FOREIGN KEY (id_passeggero) REFERENCES public.passeggero(id_passeggero);


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO "c.venditto@emminformatica.it";


-- Completed on 2025-04-28 17:16:44

--
-- PostgreSQL database dump complete
--

