--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discover_year integer,
    diameter_in_light_years numeric(15,2),
    discovered_by character varying(60)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km numeric(10,2) NOT NULL,
    radius_in_earth_radii numeric(5,3) NOT NULL,
    mass_in_kg numeric(10,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km numeric(10,2) NOT NULL,
    radius_in_earth_radii numeric(5,2) NOT NULL,
    mass_in_kg numeric(10,2),
    star_id integer NOT NULL,
    has_live boolean,
    is_ringless boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_visit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_visit (
    planet_visit_id integer NOT NULL,
    visit_date date NOT NULL,
    is_human_visitors boolean,
    num_of_visitors integer,
    planet_id integer,
    name character varying(60),
    visit_outcomes text
);


ALTER TABLE public.planet_visit OWNER TO freecodecamp;

--
-- Name: planet_visit_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_visit_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_visit_visit_id_seq OWNER TO freecodecamp;

--
-- Name: planet_visit_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_visit_visit_id_seq OWNED BY public.planet_visit.planet_visit_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km numeric(10,2) NOT NULL,
    radius_in_earth_radii integer NOT NULL,
    mass_in_kg numeric(10,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_visit planet_visit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_visit ALTER COLUMN planet_visit_id SET DEFAULT nextval('public.planet_visit_visit_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2003, 152000.00, NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 2005, 500000.00, 'Nasa');
INSERT INTO public.galaxy VALUES (3, 'NGC 4622', 2001, 172000.00, NULL);
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 1779, 64000.00, 'Edward Pigott');
INSERT INTO public.galaxy VALUES (5, 'Milky Way', NULL, 628000.00, NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 6872', 1979, 65000.00, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'M 1', 4950.00, 1.900, 129000.00, 1);
INSERT INTO public.moon VALUES (2, 'M 2', 4950.00, 1.900, 129000.00, 1);
INSERT INTO public.moon VALUES (3, 'M 3', 4950.00, 1.900, 129000.00, 1);
INSERT INTO public.moon VALUES (4, 'M 4', 4950.00, 1.900, 129000.00, 1);
INSERT INTO public.moon VALUES (7, 'M 5', 2950.00, 0.900, 9000.00, 6);
INSERT INTO public.moon VALUES (8, 'M 6', 2950.00, 0.900, 9000.00, 7);
INSERT INTO public.moon VALUES (9, 'M 7', 2950.00, 0.900, 9000.00, 7);
INSERT INTO public.moon VALUES (10, 'M 8', 2950.00, 0.900, 9000.00, 8);
INSERT INTO public.moon VALUES (11, 'M 9', 2950.00, 0.900, 9000.00, 9);
INSERT INTO public.moon VALUES (12, 'M 10', 2950.00, 0.900, 9000.00, 10);
INSERT INTO public.moon VALUES (13, 'M 11', 2950.00, 0.900, 9000.00, 11);
INSERT INTO public.moon VALUES (14, 'M 12', 2950.00, 0.900, 9000.00, 12);
INSERT INTO public.moon VALUES (15, 'M 13', 2950.00, 0.900, 9000.00, 13);
INSERT INTO public.moon VALUES (16, 'M 14', 2950.00, 0.900, 9000.00, 14);
INSERT INTO public.moon VALUES (17, 'M 15', 2950.00, 0.900, 9000.00, 15);
INSERT INTO public.moon VALUES (18, 'M 16', 2950.00, 0.900, 9000.00, 2);
INSERT INTO public.moon VALUES (19, 'M 17', 1950.00, 0.200, 900.00, 3);
INSERT INTO public.moon VALUES (20, 'M 18', 1950.00, 0.200, 900.00, 4);
INSERT INTO public.moon VALUES (21, 'M 19', 1950.00, 0.200, 900.00, 5);
INSERT INTO public.moon VALUES (22, 'M 20', 1950.00, 0.200, 900.00, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2450.00, 0.30, 100000.00, 4, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 2950.00, 0.45, 105000.00, 4, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 3550.00, 1.00, 155000.00, 4, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 3650.00, 1.20, 159000.00, 4, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 6650.00, 3.20, 199000.00, 4, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 6250.00, 2.80, 179000.00, 4, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 5250.00, 2.10, 159000.00, 4, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 4950.00, 1.90, 129000.00, 4, false, true);
INSERT INTO public.planet VALUES (9, 'Ploto', 3950.00, 1.40, 120000.00, 4, false, true);
INSERT INTO public.planet VALUES (10, 'Alph Planet', 5250.00, 2.10, 159000.00, 1, false, true);
INSERT INTO public.planet VALUES (11, 'Alph Planet 2', 4950.00, 1.90, 129000.00, 1, false, true);
INSERT INTO public.planet VALUES (12, 'Alph Planet 3', 4950.00, 1.90, 129000.00, 1, false, true);
INSERT INTO public.planet VALUES (13, 'Alm Planet 1', 6650.00, 3.20, 199000.00, 2, false, true);
INSERT INTO public.planet VALUES (14, 'Dia Planet 1', 6650.00, 3.20, 199000.00, 6, false, true);
INSERT INTO public.planet VALUES (15, 'Dia Planet 2', 4950.00, 1.90, 129000.00, 6, false, true);


--
-- Data for Name: planet_visit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_visit VALUES (1, '1990-05-19', true, 3, 6, 'PV 1', NULL);
INSERT INTO public.planet_visit VALUES (2, '1890-12-11', false, 3, 6, 'PV 2', NULL);
INSERT INTO public.planet_visit VALUES (3, '2001-12-11', false, 2, 4, 'PV 3', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 13800.00, 100, 200000.00, 1);
INSERT INTO public.star VALUES (2, 'Mirach', 12200.00, 70, 20000.00, 1);
INSERT INTO public.star VALUES (3, 'Almach', 15200.00, 75, 23000.00, 1);
INSERT INTO public.star VALUES (4, 'Sun', 11200.00, 50, 13000.00, 5);
INSERT INTO public.star VALUES (5, 'Alpha', 10200.00, 30, 11200.00, 4);
INSERT INTO public.star VALUES (6, 'Diadem', 12000.00, 33, 10000.00, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: planet_visit_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_visit_visit_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_visit planet_visit_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_visit
    ADD CONSTRAINT planet_visit_name_key UNIQUE (name);


--
-- Name: planet_visit planet_visit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_visit
    ADD CONSTRAINT planet_visit_pkey PRIMARY KEY (planet_visit_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet_visit planet_visit_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_visit
    ADD CONSTRAINT planet_visit_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

