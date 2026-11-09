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
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    diameter integer,
    orbital_period numeric(10,2),
    has_tail boolean
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
    name character varying(30) NOT NULL,
    description text,
    num_stars integer,
    num_planets integer,
    size numeric(10,2),
    has_life boolean
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
    description text,
    planet_id integer,
    distance_from_planet integer,
    diameter numeric(10,2),
    has_water boolean
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
    description text,
    star_id integer,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    has_life boolean,
    is_spherical boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    distance_from_earth integer,
    temperature numeric(10,2),
    is_spherical boolean
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Famous comet', 1, 11, 75.30, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Bright comet', 1, 60, 2533.00, true);
INSERT INTO public.comet VALUES (3, 'Encke', 'Short period comet', 1, 4, 3.30, true);
INSERT INTO public.comet VALUES (4, 'Tempel-Tuttle', 'Leonids comet', 1, 3, 33.20, true);
INSERT INTO public.comet VALUES (5, 'Swift-Tuttle', 'Perseids comet', 1, 26, 133.00, true);
INSERT INTO public.comet VALUES (6, 'Borrelly', 'Periodic comet', 1, 8, 6.90, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 100000, 8, 105700.50, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 1000000, 10, 220000.00, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy', 40000, 5, 61000.00, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting galaxy', 160000, 7, 76000.00, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright nucleus galaxy', 800000, 6, 49000.00, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Large spiral galaxy', 1000000, 9, 170000.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth moon', 1, 384, 3474.00, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars moon', 2, 9376, 22.00, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars moon 2', 2, 23463, 12.00, false);
INSERT INTO public.moon VALUES (4, 'Europa', 'Jupiter moon', 4, 671000, 3121.00, true);
INSERT INTO public.moon VALUES (5, 'Titan', 'Saturn moon', 4, 1221870, 5150.00, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Biggest moon', 4, 1070400, 5268.00, false);
INSERT INTO public.moon VALUES (7, 'Io', 'Volcanic moon', 4, 421700, 3643.00, false);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Jupiter moon 2', 4, 1882700, 4820.00, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Saturn moon', 4, 527000, 1527.00, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Saturn moon 2', 4, 3560000, 1469.00, false);
INSERT INTO public.moon VALUES (11, 'Triton', 'Neptune moon', 8, 354760, 2706.00, false);
INSERT INTO public.moon VALUES (12, 'Charon', 'Pluto moon', 11, 19570, 1212.00, false);
INSERT INTO public.moon VALUES (13, 'Ariel', 'Uranus moon', 10, 191000, 1178.00, false);
INSERT INTO public.moon VALUES (14, 'Umbriel', 'Uranus moon 2', 10, 266000, 1169.00, false);
INSERT INTO public.moon VALUES (15, 'Mimas', 'Small moon', 9, 185000, 396.00, false);
INSERT INTO public.moon VALUES (16, 'Enceladus', 'Icy moon', 9, 237000, 504.00, true);
INSERT INTO public.moon VALUES (17, 'Tethys', 'Saturn moon 3', 9, 294000, 1062.00, false);
INSERT INTO public.moon VALUES (18, 'Dione', 'Saturn moon 4', 9, 377000, 1123.00, false);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Uranus moon 3', 10, 583000, 1522.00, false);
INSERT INTO public.moon VALUES (20, 'Titania', 'Uranus moon 4', 10, 435000, 1577.00, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our planet', 1, 4500, 0.00, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet', 1, 4600, 225.00, false, true);
INSERT INTO public.planet VALUES (3, 'Venus', 'Hot planet', 1, 4500, 41.00, false, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Biggest planet', 1, 4600, 588.00, false, true);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'Exoplanet', 2, 4800, 4.24, false, true);
INSERT INTO public.planet VALUES (6, 'Sirius b', 'Planet near Sirius', 3, 4400, 8.60, false, true);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Smallest planet', 1, 4500, 77.00, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Blue planet', 1, 4500, 4300.00, false, true);
INSERT INTO public.planet VALUES (9, 'Saturn', 'Ring planet', 1, 4500, 1200.00, false, true);
INSERT INTO public.planet VALUES (10, 'Uranus', 'Ice giant', 1, 4500, 2600.00, false, true);
INSERT INTO public.planet VALUES (11, 'Pluto', 'Dwarf planet', 1, 4500, 5200.00, false, true);
INSERT INTO public.planet VALUES (12, 'Kepler-16b', 'Binary planet', 2, 4800, 245.00, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star', 1, 0, 5778.00, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star', 1, 4, 3042.00, true);
INSERT INTO public.star VALUES (3, 'Sirius', 'Brightest star', 1, 8, 9940.00, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant', 1, 642, 3500.00, true);
INSERT INTO public.star VALUES (5, 'Andromeda Star 1', 'Star in Andromeda', 2, 2500000, 6000.00, true);
INSERT INTO public.star VALUES (6, 'Triangulum Star 1', 'Star in Triangulum', 3, 2730000, 5500.00, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

