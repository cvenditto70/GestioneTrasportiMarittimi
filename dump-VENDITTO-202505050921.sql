--
-- PostgreSQL database dump
--

-- Dumped from database version 13.20 (Debian 13.20-0+deb11u1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-05-05 09:21:06

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
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 29703)
-- Name: biglietto; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.biglietto (
    id_biglietto integer NOT NULL,
    codiceqr character varying(100) NOT NULL,
    dataemissione date NOT NULL,
    "datavalidità" date NOT NULL,
    stato character varying(20) NOT NULL,
    id_prenotazione integer NOT NULL,
    id_passeggero integer NOT NULL,
    id_viaggio integer NOT NULL,
    id_canaledivendita integer NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.biglietto OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 222 (class 1259 OID 29701)
-- Name: biglietto_id_biglietto_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.biglietto_id_biglietto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.biglietto_id_biglietto_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 222
-- Name: biglietto_id_biglietto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.biglietto_id_biglietto_seq OWNED BY public.biglietto.id_biglietto;


--
-- TOC entry 203 (class 1259 OID 29561)
-- Name: canaledivendita; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.canaledivendita (
    id_canaledivendita integer NOT NULL,
    descrizionecanale character varying(50) NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.canaledivendita OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 202 (class 1259 OID 29559)
-- Name: canaledivendita_id_canaledivendita_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.canaledivendita_id_canaledivendita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.canaledivendita_id_canaledivendita_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 202
-- Name: canaledivendita_id_canaledivendita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.canaledivendita_id_canaledivendita_seq OWNED BY public.canaledivendita.id_canaledivendita;


--
-- TOC entry 201 (class 1259 OID 29550)
-- Name: compagnia; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.compagnia (
    id_compagnia integer NOT NULL,
    nome character varying(50) NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.compagnia OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 200 (class 1259 OID 29548)
-- Name: compagnia_id_compagnia_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.compagnia_id_compagnia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compagnia_id_compagnia_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 200
-- Name: compagnia_id_compagnia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.compagnia_id_compagnia_seq OWNED BY public.compagnia.id_compagnia;


--
-- TOC entry 211 (class 1259 OID 29609)
-- Name: metodopagamento; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.metodopagamento (
    id_metodopagamento integer NOT NULL,
    descrizionemetodo character varying(30) NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.metodopagamento OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 210 (class 1259 OID 29607)
-- Name: metodopagamento_id_metodopagamento_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.metodopagamento_id_metodopagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metodopagamento_id_metodopagamento_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 210
-- Name: metodopagamento_id_metodopagamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.metodopagamento_id_metodopagamento_seq OWNED BY public.metodopagamento.id_metodopagamento;


--
-- TOC entry 219 (class 1259 OID 29664)
-- Name: nave; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.nave (
    id_nave integer NOT NULL,
    nome character varying(50) NOT NULL,
    "capacitàpasseggeri" integer NOT NULL,
    "capacitàveicoli" integer NOT NULL,
    annocostruzione integer NOT NULL,
    id_compagnia integer NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.nave OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 218 (class 1259 OID 29662)
-- Name: nave_id_nave_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.nave_id_nave_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nave_id_nave_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 218
-- Name: nave_id_nave_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.nave_id_nave_seq OWNED BY public.nave.id_nave;


--
-- TOC entry 213 (class 1259 OID 29620)
-- Name: passeggero; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.passeggero (
    id_passeggero integer NOT NULL,
    nome character varying(50) NOT NULL,
    cognome character varying(50) NOT NULL,
    datanascita date NOT NULL,
    email character varying(100) NOT NULL,
    documentoid character varying(20) NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.passeggero OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 212 (class 1259 OID 29618)
-- Name: passeggero_id_passeggero_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.passeggero_id_passeggero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passeggero_id_passeggero_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 212
-- Name: passeggero_id_passeggero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.passeggero_id_passeggero_seq OWNED BY public.passeggero.id_passeggero;


--
-- TOC entry 215 (class 1259 OID 29631)
-- Name: prenotazione; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.prenotazione (
    id_prenotazione integer NOT NULL,
    dataprenotazione timestamp without time zone NOT NULL,
    id_statoprenotazione integer NOT NULL,
    id_metodopagamento integer NOT NULL,
    importototale numeric(8,2) NOT NULL,
    id_passeggero integer NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.prenotazione OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 214 (class 1259 OID 29629)
-- Name: prenotazione_id_prenotazione_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.prenotazione_id_prenotazione_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prenotazione_id_prenotazione_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 214
-- Name: prenotazione_id_prenotazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.prenotazione_id_prenotazione_seq OWNED BY public.prenotazione.id_prenotazione;


--
-- TOC entry 225 (class 1259 OID 29734)
-- Name: scalo; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.scalo (
    id_scalo integer NOT NULL,
    id_tratta integer NOT NULL,
    porto character varying(50) NOT NULL,
    ordinescalo integer NOT NULL,
    tempososta time without time zone NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.scalo OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 224 (class 1259 OID 29732)
-- Name: scalo_id_scalo_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.scalo_id_scalo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scalo_id_scalo_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 224
-- Name: scalo_id_scalo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.scalo_id_scalo_seq OWNED BY public.scalo.id_scalo;


--
-- TOC entry 207 (class 1259 OID 29587)
-- Name: statoprenotazione; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.statoprenotazione (
    id_statoprenotazione integer NOT NULL,
    descrizionestato character varying(30) NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.statoprenotazione OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 206 (class 1259 OID 29585)
-- Name: statoprenotazione_id_statoprenotazione_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.statoprenotazione_id_statoprenotazione_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.statoprenotazione_id_statoprenotazione_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 206
-- Name: statoprenotazione_id_statoprenotazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.statoprenotazione_id_statoprenotazione_seq OWNED BY public.statoprenotazione.id_statoprenotazione;


--
-- TOC entry 205 (class 1259 OID 29576)
-- Name: statoviaggio; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.statoviaggio (
    id_statoviaggio integer NOT NULL,
    descrizionestato character varying(30) NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.statoviaggio OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 204 (class 1259 OID 29574)
-- Name: statoviaggio_id_statoviaggio_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.statoviaggio_id_statoviaggio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.statoviaggio_id_statoviaggio_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 204
-- Name: statoviaggio_id_statoviaggio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.statoviaggio_id_statoviaggio_seq OWNED BY public.statoviaggio.id_statoviaggio;


--
-- TOC entry 209 (class 1259 OID 29598)
-- Name: tipoveicolo; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.tipoveicolo (
    id_tipoveicolo integer NOT NULL,
    descrizionetipo character varying(30) NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tipoveicolo OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 208 (class 1259 OID 29596)
-- Name: tipoveicolo_id_tipoveicolo_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.tipoveicolo_id_tipoveicolo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipoveicolo_id_tipoveicolo_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 208
-- Name: tipoveicolo_id_tipoveicolo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.tipoveicolo_id_tipoveicolo_seq OWNED BY public.tipoveicolo.id_tipoveicolo;


--
-- TOC entry 217 (class 1259 OID 29655)
-- Name: tratta; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.tratta (
    id_tratta integer NOT NULL,
    portopartenza character varying(50) NOT NULL,
    portoarrivo character varying(50) NOT NULL,
    duratastimata time without time zone NOT NULL,
    "periodicità" character varying(20) NOT NULL,
    prezzobase numeric(6,2) NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tratta OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 216 (class 1259 OID 29653)
-- Name: tratta_id_tratta_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.tratta_id_tratta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tratta_id_tratta_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 216
-- Name: tratta_id_tratta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.tratta_id_tratta_seq OWNED BY public.tratta.id_tratta;


--
-- TOC entry 227 (class 1259 OID 29748)
-- Name: veicolo; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.veicolo (
    id_veicolo integer NOT NULL,
    id_tipoveicolo integer NOT NULL,
    targa character varying(20) NOT NULL,
    lunghezzametri numeric(4,2) NOT NULL,
    id_prenotazione integer NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.veicolo OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 226 (class 1259 OID 29746)
-- Name: veicolo_id_veicolo_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.veicolo_id_veicolo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.veicolo_id_veicolo_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 226
-- Name: veicolo_id_veicolo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.veicolo_id_veicolo_seq OWNED BY public.veicolo.id_veicolo;


--
-- TOC entry 221 (class 1259 OID 29678)
-- Name: viaggio; Type: TABLE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE TABLE public.viaggio (
    id_viaggio integer NOT NULL,
    id_tratta integer NOT NULL,
    id_nave integer NOT NULL,
    datapartenza date NOT NULL,
    orapartenza time without time zone NOT NULL,
    id_statoviaggio integer NOT NULL,
    flagcancellato boolean DEFAULT false NOT NULL
);


ALTER TABLE public.viaggio OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 220 (class 1259 OID 29676)
-- Name: viaggio_id_viaggio_seq; Type: SEQUENCE; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE SEQUENCE public.viaggio_id_viaggio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.viaggio_id_viaggio_seq OWNER TO "c.venditto@emminformatica.it";

--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 220
-- Name: viaggio_id_viaggio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER SEQUENCE public.viaggio_id_viaggio_seq OWNED BY public.viaggio.id_viaggio;


--
-- TOC entry 2953 (class 2604 OID 29706)
-- Name: biglietto id_biglietto; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto ALTER COLUMN id_biglietto SET DEFAULT nextval('public.biglietto_id_biglietto_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 29564)
-- Name: canaledivendita id_canaledivendita; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.canaledivendita ALTER COLUMN id_canaledivendita SET DEFAULT nextval('public.canaledivendita_id_canaledivendita_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 29553)
-- Name: compagnia id_compagnia; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.compagnia ALTER COLUMN id_compagnia SET DEFAULT nextval('public.compagnia_id_compagnia_seq'::regclass);


--
-- TOC entry 2941 (class 2604 OID 29612)
-- Name: metodopagamento id_metodopagamento; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.metodopagamento ALTER COLUMN id_metodopagamento SET DEFAULT nextval('public.metodopagamento_id_metodopagamento_seq'::regclass);


--
-- TOC entry 2949 (class 2604 OID 29667)
-- Name: nave id_nave; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.nave ALTER COLUMN id_nave SET DEFAULT nextval('public.nave_id_nave_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 29623)
-- Name: passeggero id_passeggero; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.passeggero ALTER COLUMN id_passeggero SET DEFAULT nextval('public.passeggero_id_passeggero_seq'::regclass);


--
-- TOC entry 2945 (class 2604 OID 29634)
-- Name: prenotazione id_prenotazione; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.prenotazione ALTER COLUMN id_prenotazione SET DEFAULT nextval('public.prenotazione_id_prenotazione_seq'::regclass);


--
-- TOC entry 2955 (class 2604 OID 29737)
-- Name: scalo id_scalo; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.scalo ALTER COLUMN id_scalo SET DEFAULT nextval('public.scalo_id_scalo_seq'::regclass);


--
-- TOC entry 2937 (class 2604 OID 29590)
-- Name: statoprenotazione id_statoprenotazione; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.statoprenotazione ALTER COLUMN id_statoprenotazione SET DEFAULT nextval('public.statoprenotazione_id_statoprenotazione_seq'::regclass);


--
-- TOC entry 2935 (class 2604 OID 29579)
-- Name: statoviaggio id_statoviaggio; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.statoviaggio ALTER COLUMN id_statoviaggio SET DEFAULT nextval('public.statoviaggio_id_statoviaggio_seq'::regclass);


--
-- TOC entry 2939 (class 2604 OID 29601)
-- Name: tipoveicolo id_tipoveicolo; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.tipoveicolo ALTER COLUMN id_tipoveicolo SET DEFAULT nextval('public.tipoveicolo_id_tipoveicolo_seq'::regclass);


--
-- TOC entry 2947 (class 2604 OID 29658)
-- Name: tratta id_tratta; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.tratta ALTER COLUMN id_tratta SET DEFAULT nextval('public.tratta_id_tratta_seq'::regclass);


--
-- TOC entry 2957 (class 2604 OID 29751)
-- Name: veicolo id_veicolo; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.veicolo ALTER COLUMN id_veicolo SET DEFAULT nextval('public.veicolo_id_veicolo_seq'::regclass);


--
-- TOC entry 2951 (class 2604 OID 29681)
-- Name: viaggio id_viaggio; Type: DEFAULT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.viaggio ALTER COLUMN id_viaggio SET DEFAULT nextval('public.viaggio_id_viaggio_seq'::regclass);


--
-- TOC entry 3187 (class 0 OID 29703)
-- Dependencies: 223
-- Data for Name: biglietto; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.biglietto (id_biglietto, codiceqr, dataemissione, "datavalidità", stato, id_prenotazione, id_passeggero, id_viaggio, id_canaledivendita, flagcancellato) FROM stdin;
1	QR001	2025-05-04	2025-08-01	valido	1	1	1	1	f
2	QR002	2025-05-04	2025-08-02	valido	2	2	2	2	f
3	QR003	2025-05-04	2025-08-03	valido	3	3	3	3	f
4	QR004	2025-05-04	2025-08-04	valido	4	4	4	1	f
6	QR006	2025-05-04	2025-08-06	valido	6	6	6	3	f
7	QR007	2025-05-04	2025-08-07	valido	7	7	7	1	f
8	QR008	2025-05-04	2025-08-08	valido	8	8	8	2	f
10	QR010	2025-05-04	2025-08-10	valido	10	10	10	1	f
5	QR005	2025-05-04	2025-08-05	valido	5	1	5	2	f
9	QR009	2025-05-04	2025-08-09	valido	9	2	9	3	f
33	QR0011	2025-05-04	2025-08-01	valido	41	1	1	1	f
\.


--
-- TOC entry 3167 (class 0 OID 29561)
-- Dependencies: 203
-- Data for Name: canaledivendita; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.canaledivendita (id_canaledivendita, descrizionecanale, flagcancellato) FROM stdin;
1	Portale	f
2	Call Center	f
3	Biglietteria	f
\.


--
-- TOC entry 3165 (class 0 OID 29550)
-- Dependencies: 201
-- Data for Name: compagnia; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.compagnia (id_compagnia, nome, flagcancellato) FROM stdin;
1	VIAMAR	f
\.


--
-- TOC entry 3175 (class 0 OID 29609)
-- Dependencies: 211
-- Data for Name: metodopagamento; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.metodopagamento (id_metodopagamento, descrizionemetodo, flagcancellato) FROM stdin;
1	Carta di Credito	f
2	Contanti	f
3	Paypal	f
\.


--
-- TOC entry 3183 (class 0 OID 29664)
-- Dependencies: 219
-- Data for Name: nave; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.nave (id_nave, nome, "capacitàpasseggeri", "capacitàveicoli", annocostruzione, id_compagnia, flagcancellato) FROM stdin;
1	Traghetto A	850	120	2010	1	f
2	Traghetto B	950	130	2012	1	f
3	Traghetto C	780	110	2015	1	f
4	Traghetto D	1000	140	2018	1	f
5	Traghetto E	1200	180	2020	1	f
6	Traghetto F	900	125	2011	1	f
7	Traghetto G	1100	160	2013	1	f
8	Traghetto H	950	135	2016	1	f
\.


--
-- TOC entry 3177 (class 0 OID 29620)
-- Dependencies: 213
-- Data for Name: passeggero; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.passeggero (id_passeggero, nome, cognome, datanascita, email, documentoid, flagcancellato) FROM stdin;
2	Anna	Bianchi	1990-04-20	anna.bianchi@example.com	DOC002	f
4	Elisa	Neri	1995-07-01	elisa.neri@example.com	DOC004	f
5	Giulia	Conti	1988-12-05	giulia.conti@example.com	DOC005	f
7	Chiara	Riva	1993-06-03	chiara.riva@example.com	DOC007	f
8	Paolo	Moretti	1980-04-22	paolo.moretti@example.com	DOC008	f
9	Davide	Greco	1992-10-14	davide.greco@example.com	DOC009	f
10	Serena	Romano	1986-09-09	serena.romano@example.com	DOC010	f
1	Claudio	Venditto	1985-06-15	claudio.venditto@example.com	DOC001	f
3	Francesco	Verdi	1982-03-12	Francesco.verdi@example.com	DOC003	f
6	Giulio	Rossi	1979-11-22	Giulio.Rossi@example.com	DOC006	f
\.


--
-- TOC entry 3179 (class 0 OID 29631)
-- Dependencies: 215
-- Data for Name: prenotazione; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.prenotazione (id_prenotazione, dataprenotazione, id_statoprenotazione, id_metodopagamento, importototale, id_passeggero, flagcancellato) FROM stdin;
5	2025-05-04 11:23:59.259643	1	1	90.00	5	f
8	2025-05-04 11:23:59.259643	2	3	25.00	8	f
2	2025-04-23 11:23:59.259	1	2	60.00	2	f
3	2025-05-24 11:23:59.259	1	1	70.00	3	f
4	2025-03-20 11:23:59.259	2	3	30.00	4	f
6	2025-01-08 11:23:59.259	1	2	45.00	6	f
7	2025-05-30 11:23:59.259	1	1	55.00	7	f
9	2025-03-08 11:23:59.259	1	1	65.00	9	f
1	2025-03-03 11:23:59.259	1	1	50.55	1	f
10	2025-02-02 11:23:59.259	1	2	35.62	10	f
41	2025-05-04 16:41:00.670316	1	2	50.55	1	f
\.


--
-- TOC entry 3189 (class 0 OID 29734)
-- Dependencies: 225
-- Data for Name: scalo; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.scalo (id_scalo, id_tratta, porto, ordinescalo, tempososta, flagcancellato) FROM stdin;
1	1	Ischia	1	00:30:00	f
2	2	Porto Torres	1	01:00:00	f
4	4	Ponza	1	00:45:00	f
5	5	Capraia	1	00:30:00	f
6	6	Vulcano	1	00:40:00	f
7	7	Vis	1	00:50:00	f
8	8	Patrasso	1	01:10:00	f
9	9	Paxos	1	00:55:00	f
10	10	Milazzo	1	00:35:00	f
21	1	Capri	2	00:30:00	f
\.


--
-- TOC entry 3171 (class 0 OID 29587)
-- Dependencies: 207
-- Data for Name: statoprenotazione; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.statoprenotazione (id_statoprenotazione, descrizionestato, flagcancellato) FROM stdin;
1	Confermata	f
2	Annullata	f
\.


--
-- TOC entry 3169 (class 0 OID 29576)
-- Dependencies: 205
-- Data for Name: statoviaggio; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.statoviaggio (id_statoviaggio, descrizionestato, flagcancellato) FROM stdin;
1	Programmato	f
2	In Ritardo	f
3	Terminato	f
4	Annullato	f
\.


--
-- TOC entry 3173 (class 0 OID 29598)
-- Dependencies: 209
-- Data for Name: tipoveicolo; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.tipoveicolo (id_tipoveicolo, descrizionetipo, flagcancellato) FROM stdin;
1	Auto	f
2	Moto	f
3	Camper	f
4	Bus	f
5	Autotreno	f
6	Bicicletta	f
7	Furgone	f
\.


--
-- TOC entry 3181 (class 0 OID 29655)
-- Dependencies: 217
-- Data for Name: tratta; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.tratta (id_tratta, portopartenza, portoarrivo, duratastimata, "periodicità", prezzobase, flagcancellato) FROM stdin;
1	Napoli	Palermo	08:00:00	Giornaliera	49.99	f
2	Genova	Olbia	10:30:00	Settimanale	69.90	f
3	Bari	Durazzo	09:15:00	Giornaliera	59.00	f
4	Civitavecchia	Cagliari	13:00:00	Settimanale	89.00	f
5	Livorno	Bastia	04:45:00	Giornaliera	39.90	f
6	Reggio Calabria	Messina	01:00:00	Ogni ora	10.00	f
7	Ancona	Split	10:00:00	Settimanale	70.00	f
8	Trieste	Igoumenitsa	12:00:00	Mensile	95.00	f
9	Brindisi	Corfù	07:00:00	Stagionale	65.00	f
10	Salerno	Catania	06:30:00	Giornaliera	55.00	f
\.


--
-- TOC entry 3191 (class 0 OID 29748)
-- Dependencies: 227
-- Data for Name: veicolo; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.veicolo (id_veicolo, id_tipoveicolo, targa, lunghezzametri, id_prenotazione, flagcancellato) FROM stdin;
1	1	AA001AA	4.50	1	f
2	2	BB002BB	2.10	2	f
3	3	CC003CC	6.00	3	f
4	4	DD004DD	5.20	4	f
5	5	EE005EE	4.70	5	f
6	6	FF006FF	4.90	6	f
7	7	GG007GG	2.20	7	f
8	1	HH008HH	4.30	8	f
9	2	II009II	2.50	9	f
10	3	JJ010JJ	6.10	10	f
\.


--
-- TOC entry 3185 (class 0 OID 29678)
-- Dependencies: 221
-- Data for Name: viaggio; Type: TABLE DATA; Schema: public; Owner: c.venditto@emminformatica.it
--

COPY public.viaggio (id_viaggio, id_tratta, id_nave, datapartenza, orapartenza, id_statoviaggio, flagcancellato) FROM stdin;
1	1	1	2025-08-01	08:00:00	1	f
2	2	2	2025-08-02	08:00:00	2	f
3	3	3	2025-08-03	08:00:00	3	f
4	4	4	2025-08-04	08:00:00	4	f
5	5	5	2025-08-05	08:00:00	1	f
6	6	6	2025-08-06	08:00:00	2	f
7	7	7	2025-08-07	08:00:00	3	f
8	8	8	2025-08-08	08:00:00	4	f
9	9	1	2025-08-09	08:00:00	1	f
10	10	2	2025-08-10	08:00:00	2	f
\.


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 222
-- Name: biglietto_id_biglietto_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.biglietto_id_biglietto_seq', 33, true);


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 202
-- Name: canaledivendita_id_canaledivendita_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.canaledivendita_id_canaledivendita_seq', 3, true);


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 200
-- Name: compagnia_id_compagnia_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.compagnia_id_compagnia_seq', 1, true);


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 210
-- Name: metodopagamento_id_metodopagamento_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.metodopagamento_id_metodopagamento_seq', 4, true);


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 218
-- Name: nave_id_nave_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.nave_id_nave_seq', 8, true);


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 212
-- Name: passeggero_id_passeggero_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.passeggero_id_passeggero_seq', 10, true);


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 214
-- Name: prenotazione_id_prenotazione_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.prenotazione_id_prenotazione_seq', 41, true);


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 224
-- Name: scalo_id_scalo_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.scalo_id_scalo_seq', 21, true);


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 206
-- Name: statoprenotazione_id_statoprenotazione_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.statoprenotazione_id_statoprenotazione_seq', 2, true);


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 204
-- Name: statoviaggio_id_statoviaggio_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.statoviaggio_id_statoviaggio_seq', 4, true);


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 208
-- Name: tipoveicolo_id_tipoveicolo_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.tipoveicolo_id_tipoveicolo_seq', 7, true);


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 216
-- Name: tratta_id_tratta_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.tratta_id_tratta_seq', 20, true);


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 226
-- Name: veicolo_id_veicolo_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.veicolo_id_veicolo_seq', 30, true);


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 220
-- Name: viaggio_id_viaggio_seq; Type: SEQUENCE SET; Schema: public; Owner: c.venditto@emminformatica.it
--

SELECT pg_catalog.setval('public.viaggio_id_viaggio_seq', 30, true);


--
-- TOC entry 3002 (class 2606 OID 29711)
-- Name: biglietto biglietto_codiceqr_key; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_codiceqr_key UNIQUE (codiceqr);


--
-- TOC entry 3004 (class 2606 OID 29709)
-- Name: biglietto biglietto_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_pkey PRIMARY KEY (id_biglietto);


--
-- TOC entry 2964 (class 2606 OID 29567)
-- Name: canaledivendita canaledivendita_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.canaledivendita
    ADD CONSTRAINT canaledivendita_pkey PRIMARY KEY (id_canaledivendita);


--
-- TOC entry 2960 (class 2606 OID 29558)
-- Name: compagnia compagnia_nome_key; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.compagnia
    ADD CONSTRAINT compagnia_nome_key UNIQUE (nome);


--
-- TOC entry 2962 (class 2606 OID 29556)
-- Name: compagnia compagnia_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.compagnia
    ADD CONSTRAINT compagnia_pkey PRIMARY KEY (id_compagnia);


--
-- TOC entry 2978 (class 2606 OID 29617)
-- Name: metodopagamento metodopagamento_descrizionemetodo_key; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.metodopagamento
    ADD CONSTRAINT metodopagamento_descrizionemetodo_key UNIQUE (descrizionemetodo);


--
-- TOC entry 2980 (class 2606 OID 29615)
-- Name: metodopagamento metodopagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.metodopagamento
    ADD CONSTRAINT metodopagamento_pkey PRIMARY KEY (id_metodopagamento);


--
-- TOC entry 2996 (class 2606 OID 29670)
-- Name: nave nave_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.nave
    ADD CONSTRAINT nave_pkey PRIMARY KEY (id_nave);


--
-- TOC entry 2983 (class 2606 OID 29628)
-- Name: passeggero passeggero_email_key; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.passeggero
    ADD CONSTRAINT passeggero_email_key UNIQUE (email);


--
-- TOC entry 2985 (class 2606 OID 29626)
-- Name: passeggero passeggero_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.passeggero
    ADD CONSTRAINT passeggero_pkey PRIMARY KEY (id_passeggero);


--
-- TOC entry 2992 (class 2606 OID 29637)
-- Name: prenotazione prenotazione_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_pkey PRIMARY KEY (id_prenotazione);


--
-- TOC entry 3015 (class 2606 OID 29740)
-- Name: scalo scalo_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.scalo
    ADD CONSTRAINT scalo_pkey PRIMARY KEY (id_scalo);


--
-- TOC entry 2970 (class 2606 OID 29595)
-- Name: statoprenotazione statoprenotazione_descrizionestato_key; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.statoprenotazione
    ADD CONSTRAINT statoprenotazione_descrizionestato_key UNIQUE (descrizionestato);


--
-- TOC entry 2972 (class 2606 OID 29593)
-- Name: statoprenotazione statoprenotazione_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.statoprenotazione
    ADD CONSTRAINT statoprenotazione_pkey PRIMARY KEY (id_statoprenotazione);


--
-- TOC entry 2966 (class 2606 OID 29584)
-- Name: statoviaggio statoviaggio_descrizionestato_key; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.statoviaggio
    ADD CONSTRAINT statoviaggio_descrizionestato_key UNIQUE (descrizionestato);


--
-- TOC entry 2968 (class 2606 OID 29582)
-- Name: statoviaggio statoviaggio_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.statoviaggio
    ADD CONSTRAINT statoviaggio_pkey PRIMARY KEY (id_statoviaggio);


--
-- TOC entry 2974 (class 2606 OID 29606)
-- Name: tipoveicolo tipoveicolo_descrizionetipo_key; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.tipoveicolo
    ADD CONSTRAINT tipoveicolo_descrizionetipo_key UNIQUE (descrizionetipo);


--
-- TOC entry 2976 (class 2606 OID 29604)
-- Name: tipoveicolo tipoveicolo_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.tipoveicolo
    ADD CONSTRAINT tipoveicolo_pkey PRIMARY KEY (id_tipoveicolo);


--
-- TOC entry 2994 (class 2606 OID 29661)
-- Name: tratta tratta_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_pkey PRIMARY KEY (id_tratta);


--
-- TOC entry 3017 (class 2606 OID 29754)
-- Name: veicolo veicolo_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.veicolo
    ADD CONSTRAINT veicolo_pkey PRIMARY KEY (id_veicolo);


--
-- TOC entry 3019 (class 2606 OID 29756)
-- Name: veicolo veicolo_targa_key; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.veicolo
    ADD CONSTRAINT veicolo_targa_key UNIQUE (targa);


--
-- TOC entry 3000 (class 2606 OID 29684)
-- Name: viaggio viaggio_pkey; Type: CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.viaggio
    ADD CONSTRAINT viaggio_pkey PRIMARY KEY (id_viaggio);


--
-- TOC entry 3005 (class 1259 OID 29772)
-- Name: idx_biglietto_codiceqr; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_biglietto_codiceqr ON public.biglietto USING btree (codiceqr);


--
-- TOC entry 3006 (class 1259 OID 29774)
-- Name: idx_biglietto_datavalidita; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_biglietto_datavalidita ON public.biglietto USING btree ("datavalidità");


--
-- TOC entry 3007 (class 1259 OID 29773)
-- Name: idx_biglietto_flag; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_biglietto_flag ON public.biglietto USING btree (flagcancellato);


--
-- TOC entry 3008 (class 1259 OID 29780)
-- Name: idx_biglietto_flagcancellato; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_biglietto_flagcancellato ON public.biglietto USING btree (flagcancellato);


--
-- TOC entry 3009 (class 1259 OID 29779)
-- Name: idx_biglietto_id_passeggero; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_biglietto_id_passeggero ON public.biglietto USING btree (id_passeggero);


--
-- TOC entry 3010 (class 1259 OID 29770)
-- Name: idx_biglietto_id_prenotazione; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_biglietto_id_prenotazione ON public.biglietto USING btree (id_prenotazione);


--
-- TOC entry 3011 (class 1259 OID 29776)
-- Name: idx_biglietto_id_viaggio; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_biglietto_id_viaggio ON public.biglietto USING btree (id_viaggio);


--
-- TOC entry 3012 (class 1259 OID 29777)
-- Name: idx_biglietto_stato; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_biglietto_stato ON public.biglietto USING btree (stato);


--
-- TOC entry 2981 (class 1259 OID 29767)
-- Name: idx_passeggero_cognome; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_passeggero_cognome ON public.passeggero USING btree (cognome);


--
-- TOC entry 2986 (class 1259 OID 29769)
-- Name: idx_prenotazione_flag; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_prenotazione_flag ON public.prenotazione USING btree (flagcancellato);


--
-- TOC entry 2987 (class 1259 OID 29782)
-- Name: idx_prenotazione_flagcancellato_2; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_prenotazione_flagcancellato_2 ON public.prenotazione USING btree (flagcancellato);


--
-- TOC entry 2988 (class 1259 OID 29784)
-- Name: idx_prenotazione_id_metodo; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_prenotazione_id_metodo ON public.prenotazione USING btree (id_metodopagamento);


--
-- TOC entry 2989 (class 1259 OID 29768)
-- Name: idx_prenotazione_id_passeggero; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_prenotazione_id_passeggero ON public.prenotazione USING btree (id_passeggero);


--
-- TOC entry 2990 (class 1259 OID 29781)
-- Name: idx_prenotazione_id_passeggero_2; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_prenotazione_id_passeggero_2 ON public.prenotazione USING btree (id_passeggero);


--
-- TOC entry 3013 (class 1259 OID 29783)
-- Name: idx_scalo_id_tratta; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_scalo_id_tratta ON public.scalo USING btree (id_tratta);


--
-- TOC entry 2997 (class 1259 OID 29775)
-- Name: idx_viaggio_id_nave; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_viaggio_id_nave ON public.viaggio USING btree (id_nave);


--
-- TOC entry 2998 (class 1259 OID 29771)
-- Name: idx_viaggio_id_tratta; Type: INDEX; Schema: public; Owner: c.venditto@emminformatica.it
--

CREATE INDEX idx_viaggio_id_tratta ON public.viaggio USING btree (id_tratta);


--
-- TOC entry 3027 (class 2606 OID 29727)
-- Name: biglietto biglietto_id_canaledivendita_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_id_canaledivendita_fkey FOREIGN KEY (id_canaledivendita) REFERENCES public.canaledivendita(id_canaledivendita);


--
-- TOC entry 3028 (class 2606 OID 29717)
-- Name: biglietto biglietto_id_passeggero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_id_passeggero_fkey FOREIGN KEY (id_passeggero) REFERENCES public.passeggero(id_passeggero);


--
-- TOC entry 3029 (class 2606 OID 29712)
-- Name: biglietto biglietto_id_prenotazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_id_prenotazione_fkey FOREIGN KEY (id_prenotazione) REFERENCES public.prenotazione(id_prenotazione);


--
-- TOC entry 3030 (class 2606 OID 29722)
-- Name: biglietto biglietto_id_viaggio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_id_viaggio_fkey FOREIGN KEY (id_viaggio) REFERENCES public.viaggio(id_viaggio);


--
-- TOC entry 3023 (class 2606 OID 29671)
-- Name: nave nave_id_compagnia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.nave
    ADD CONSTRAINT nave_id_compagnia_fkey FOREIGN KEY (id_compagnia) REFERENCES public.compagnia(id_compagnia);


--
-- TOC entry 3020 (class 2606 OID 29648)
-- Name: prenotazione prenotazione_id_metodopagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_id_metodopagamento_fkey FOREIGN KEY (id_metodopagamento) REFERENCES public.metodopagamento(id_metodopagamento);


--
-- TOC entry 3021 (class 2606 OID 29638)
-- Name: prenotazione prenotazione_id_passeggero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_id_passeggero_fkey FOREIGN KEY (id_passeggero) REFERENCES public.passeggero(id_passeggero);


--
-- TOC entry 3022 (class 2606 OID 29643)
-- Name: prenotazione prenotazione_id_statoprenotazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_id_statoprenotazione_fkey FOREIGN KEY (id_statoprenotazione) REFERENCES public.statoprenotazione(id_statoprenotazione);


--
-- TOC entry 3031 (class 2606 OID 29741)
-- Name: scalo scalo_id_tratta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.scalo
    ADD CONSTRAINT scalo_id_tratta_fkey FOREIGN KEY (id_tratta) REFERENCES public.tratta(id_tratta);


--
-- TOC entry 3032 (class 2606 OID 29757)
-- Name: veicolo veicolo_id_prenotazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.veicolo
    ADD CONSTRAINT veicolo_id_prenotazione_fkey FOREIGN KEY (id_prenotazione) REFERENCES public.prenotazione(id_prenotazione);


--
-- TOC entry 3033 (class 2606 OID 29762)
-- Name: veicolo veicolo_id_tipoveicolo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.veicolo
    ADD CONSTRAINT veicolo_id_tipoveicolo_fkey FOREIGN KEY (id_tipoveicolo) REFERENCES public.tipoveicolo(id_tipoveicolo);


--
-- TOC entry 3024 (class 2606 OID 29690)
-- Name: viaggio viaggio_id_nave_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.viaggio
    ADD CONSTRAINT viaggio_id_nave_fkey FOREIGN KEY (id_nave) REFERENCES public.nave(id_nave);


--
-- TOC entry 3025 (class 2606 OID 29695)
-- Name: viaggio viaggio_id_statoviaggio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.viaggio
    ADD CONSTRAINT viaggio_id_statoviaggio_fkey FOREIGN KEY (id_statoviaggio) REFERENCES public.statoviaggio(id_statoviaggio);


--
-- TOC entry 3026 (class 2606 OID 29685)
-- Name: viaggio viaggio_id_tratta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: c.venditto@emminformatica.it
--

ALTER TABLE ONLY public.viaggio
    ADD CONSTRAINT viaggio_id_tratta_fkey FOREIGN KEY (id_tratta) REFERENCES public.tratta(id_tratta);


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO "c.venditto@emminformatica.it";


-- Completed on 2025-05-05 09:21:06

--
-- PostgreSQL database dump complete
--

