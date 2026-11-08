--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discovery_year integer NOT NULL,
    radius_km numeric(8,2),
    is_tidally_locked boolean NOT NULL,
    has_atmosphere boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type text NOT NULL,
    orbital_period_days integer NOT NULL,
    radius_km numeric(10,2),
    has_rings boolean NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_mission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(50) NOT NULL,
    launch_year integer NOT NULL,
    budget_billions numeric(6,2),
    is_manned boolean NOT NULL,
    was_successful boolean NOT NULL,
    description text
);


ALTER TABLE public.space_mission OWNER TO postgres;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO postgres;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    spectral_class character varying(10) NOT NULL,
    temperature_kelvin integer NOT NULL,
    mass_solar_masses numeric(8,2),
    is_main_sequence boolean NOT NULL,
    has_planets boolean NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.54, false, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 2.73, false, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000, 0.16, false, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 6500, 0.20, false, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Lenticular', 13200, 28.00, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 0, 1737.40, true, false);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 1877, 11.26, true, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 1877, 6.20, true, false);
INSERT INTO public.moon VALUES (4, 5, 'Io', 1610, 1821.60, true, true);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 1610, 1560.80, true, false);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 1610, 2634.10, true, true);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 1610, 2410.30, true, false);
INSERT INTO public.moon VALUES (8, 6, 'Mimas', 1789, 198.20, true, false);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 1789, 252.10, true, true);
INSERT INTO public.moon VALUES (10, 6, 'Tethys', 1684, 531.10, true, false);
INSERT INTO public.moon VALUES (11, 6, 'Dione', 1684, 561.40, true, false);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', 1672, 763.80, true, false);
INSERT INTO public.moon VALUES (13, 6, 'Titan', 1655, 2574.70, true, true);
INSERT INTO public.moon VALUES (14, 6, 'Iapetus', 1671, 734.50, true, false);
INSERT INTO public.moon VALUES (15, 7, 'Ariel', 1851, 578.90, true, false);
INSERT INTO public.moon VALUES (16, 7, 'Umbriel', 1851, 584.70, true, false);
INSERT INTO public.moon VALUES (17, 7, 'Titania', 1787, 788.40, true, false);
INSERT INTO public.moon VALUES (18, 7, 'Oberon', 1787, 761.40, true, false);
INSERT INTO public.moon VALUES (19, 7, 'Miranda', 1948, 235.80, true, false);
INSERT INTO public.moon VALUES (20, 8, 'Triton', 1846, 1353.40, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', 88, 2439.70, false, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', 225, 6051.80, false, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', 365, 6371.00, false, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', 687, 3389.50, false, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', 4333, 69911.00, true, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant', 10759, 58232.00, true, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', 30687, 25362.00, true, false);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice Giant', 60190, 24622.00, true, false);
INSERT INTO public.planet VALUES (9, 2, 'Proxima Centauri b', 'Terrestrial', 11, 6800.00, false, true);
INSERT INTO public.planet VALUES (10, 2, 'Rigel Kentaurus b', 'Gas Giant', 342, 45000.00, true, false);
INSERT INTO public.planet VALUES (11, 4, 'Andromeda Prime', 'Terrestrial', 450, 7100.00, false, false);
INSERT INTO public.planet VALUES (12, 5, 'Belzagor', 'Super Earth', 180, 9500.00, false, false);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.space_mission VALUES (1, 'Apollo 11', 1969, 25.40, true, true, 'First manned moon landing.');
INSERT INTO public.space_mission VALUES (2, 'Voyager 1', 1977, 0.25, false, true, 'Exploration of outer solar system.');
INSERT INTO public.space_mission VALUES (3, 'Perseverance', 2020, 2.70, false, true, 'Mars rover searching for signs of ancient life.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G2V', 5778, 1.00, true, true);
INSERT INTO public.star VALUES (2, 1, 'Alpha Centauri A', 'G2V', 5790, 1.10, true, true);
INSERT INTO public.star VALUES (3, 1, 'Sirius A', 'A1V', 9940, 2.06, true, false);
INSERT INTO public.star VALUES (4, 2, 'Andromeda Alpha', 'B8IV', 13000, 3.60, false, true);
INSERT INTO public.star VALUES (5, 2, 'Andromeda Beta', 'M0III', 3800, 2.20, false, true);
INSERT INTO public.star VALUES (6, 3, 'Triangulum Alpha', 'F2V', 6500, 1.40, true, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
