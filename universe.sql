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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    discovered_year integer,
    period_years numeric,
    is_observeable boolean,
    has_tail boolean,
    eccentricity numeric,
    last_perihelion_date date,
    diameter_km integer,
    composition text NOT NULL,
    discovered_by text,
    description text,
    classification text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance integer NOT NULL,
    age integer NOT NULL,
    has_black_hole boolean NOT NULL,
    has_spiral_arms boolean,
    galaxy_type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    mass_kg numeric NOT NULL,
    distance_km numeric NOT NULL,
    diameter_km integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_terraformed boolean NOT NULL,
    is_captured boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    mass_kg numeric NOT NULL,
    distance_km numeric NOT NULL,
    radius_km integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    has_water boolean NOT NULL,
    discovery_year integer NOT NULL,
    discovery_method text NOT NULL,
    orbital_period_days integer NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    mass_kg numeric NOT NULL,
    age_years numeric NOT NULL,
    distance_ly numeric NOT NULL,
    has_planets boolean NOT NULL,
    is_binary boolean NOT NULL,
    spectral_class text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (2, 'Halley', -240, 76, NULL, true, NULL, NULL, NULL, 'dust, ice, organic compounds', NULL, NULL, 'periodic');
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 1995, 2520, NULL, true, NULL, NULL, NULL, 'dust, ice, organic compounds', NULL, NULL, 'non-periodic');
INSERT INTO public.comet VALUES (4, 'ATLAS', 2019, 6090, NULL, false, NULL, NULL, NULL, 'unknown', NULL, NULL, 'non-periodic');
INSERT INTO public.comet VALUES (5, 'PANSTARRS', 2017, 6000, NULL, false, NULL, NULL, NULL, 'unknown', NULL, NULL, 'non-periodic');
INSERT INTO public.comet VALUES (6, 'Catalina', 2013, 7680, NULL, false, NULL, NULL, NULL, 'unknown', NULL, NULL, 'non-periodic');
INSERT INTO public.comet VALUES (7, 'NEOWISE', 2020, 8786, NULL, true, NULL, NULL, NULL, 'dust, ice, organic compounds', NULL, NULL, 'non-periodic');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Andromeda', 2500000, 7000, true, true, 'spiral');
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 0, 13000, true, true, 'spiral');
INSERT INTO public.galaxy VALUES (7, 'Triangulum', 3000000, 13000, false, false, 'irregular');
INSERT INTO public.galaxy VALUES (8, 'Bode''s', 12000000, 12000, true, false, 'elliptical');
INSERT INTO public.galaxy VALUES (9, 'Canis Major', 25000000, 10000, false, true, 'spiral');
INSERT INTO public.galaxy VALUES (10, 'Hoag''s', 60000000, 13000, false, false, 'ring');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 73420000000000000000000, 384400, 3474, false, false, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 10720000000000000, 9377, 22, false, false, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1476200000000000, 23460, 12, false, false, true);
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, 148190000000000000000000, 1070400, 5268, true, false, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 47998000000000000000000, 670900, 3122, true, false, false);
INSERT INTO public.moon VALUES (6, 'Io', 3, 89319000000000000000000, 421700, 3643, true, false, false);
INSERT INTO public.moon VALUES (7, 'Mimas', 4, 37500000000000000000, 185520, 396, false, false, true);
INSERT INTO public.moon VALUES (8, 'Enceladus', 4, 108000000000000000000, 238020, 504, true, false, true);
INSERT INTO public.moon VALUES (9, 'Titan', 4, 134520000000000000000000, 1221870, 5151, true, false, false);
INSERT INTO public.moon VALUES (10, 'Tethys', 4, 617450000000000000000, 294619, 1062, false, false, true);
INSERT INTO public.moon VALUES (11, 'Miranda', 5, 65900000000000000000, 129390, 471, false, false, true);
INSERT INTO public.moon VALUES (12, 'Ariel', 5, 1353000000000000000000, 190900, 1158, true, false, false);
INSERT INTO public.moon VALUES (13, 'Umbriel', 5, 1172000000000000000000, 266000, 1169, true, false, true);
INSERT INTO public.moon VALUES (14, 'Titania', 5, 3527000000000000000000, 436300, 1578, true, false, true);
INSERT INTO public.moon VALUES (15, 'Triton', 6, 21400000000000000000000, 354759, 2707, true, false, false);
INSERT INTO public.moon VALUES (16, 'Charon', 7, 1520000000000000000000, 19591, 1208, true, false, true);
INSERT INTO public.moon VALUES (17, 'Nereid', 8, 31000000000000000000, 5513400, 340, true, false, true);
INSERT INTO public.moon VALUES (18, 'Proteus', 9, 56700000000000000000, 117647, 420, true, false, true);
INSERT INTO public.moon VALUES (19, 'Calypso', 10, 4520000000000000, 294619, 21, true, false, true);
INSERT INTO public.moon VALUES (20, 'Janus', 11, 1900000000000000000, 151460, 179, true, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Kepler-10b', 1, 4560000000000000000000000, 1472119, 12651, true, false, 2011, 'Transit', 1, false);
INSERT INTO public.planet VALUES (2, 'Kepler-10c', 1, 3520000000000000000000000, 2344208, 15838, true, false, 2011, 'Transit', 45, false);
INSERT INTO public.planet VALUES (3, 'Kepler-10d', 1, 2260000000000000000000000, 3352818, 10934, true, false, 2011, 'Transit', 21, false);
INSERT INTO public.planet VALUES (4, 'Kepler-18b', 2, 6900000000000000000000000, 2976480, 21923, true, false, 2011, 'Transit', 4, false);
INSERT INTO public.planet VALUES (5, 'Kepler-18c', 2, 16700000000000000000000000, 5374500, 34573, true, false, 2011, 'Transit', 8, false);
INSERT INTO public.planet VALUES (6, 'Kepler-18d', 2, 3470000000000000000000000, 9333850, 55313, true, false, 2011, 'Transit', 15, false);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 3, 6360000000000000000000000, 3847430, 24751, true, true, 2011, 'Transit', 290, true);
INSERT INTO public.planet VALUES (8, 'Kepler-62e', 4, 4780000000000000000000000, 28255634, 11652, true, false, 2013, 'Transit', 122, true);
INSERT INTO public.planet VALUES (9, 'Kepler-62f', 4, 2730000000000000000000000, 39587264, 16077, true, false, 2013, 'Transit', 267, true);
INSERT INTO public.planet VALUES (10, 'Kepler-69c', 5, 6400000000000000000000000, 24382712, 14703, true, false, 2013, 'Transit', 243, false);
INSERT INTO public.planet VALUES (11, 'Kepler-69d', 5, 7600000000000000000000000, 39342604, 15299, true, false, 2013, 'Transit', 704, false);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 6, 3880000000000000000000000, 79500508, 6379, true, false, 2014, 'Transit', 130, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1989000000000000000000000000000, 4600000000, 0, true, false, 'G2V');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', NULL, 244700000000000000000000000000, 4850000000, 4.244, true, false, 'M5.5Ve');
INSERT INTO public.star VALUES (3, 'Sirius', NULL, 1989000000000000000000000000000, 237000000, 8.6, true, false, 'A1V');
INSERT INTO public.star VALUES (4, 'Betelgeuse', NULL, 14320000000000000000000000000000, 8500000, 642.5, false, false, 'M1-2Ia-ab');
INSERT INTO public.star VALUES (5, 'Rigel', NULL, 26600000000000000000000000000000, 7500000, 863, false, false, 'B8Ia');
INSERT INTO public.star VALUES (6, 'Antares', NULL, 18440000000000000000000000000000, 120000000, 550, false, false, 'M1.5Iab-b');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 7, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 10, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

