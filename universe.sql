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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(30),
    size_kly integer,
    distance_kpc integer,
    name character varying(30) NOT NULL
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
    planet_id integer,
    size_km integer,
    is_spherical boolean
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
    star_id integer,
    size_mm numeric(4,1),
    distance_au numeric(4,2),
    is_goldilocked boolean
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
    galaxy_id integer,
    star_type text,
    age_myr integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planets (
    star_id integer NOT NULL,
    star_planets_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.star_planets OWNER TO freecodecamp;

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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral Galaxy', 52, NULL, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Spiral Galaxy', 152, 46, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Spiral Galaxy', 30, 827, 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'Lenticular', 48, 4139, 'Centaurus A');
INSERT INTO public.galaxy VALUES (5, 'Ring/Peculiar Galaxy', 60, 187885, 'Hoags Object');
INSERT INTO public.galaxy VALUES (6, 'Irregular Galaxy', 18, 4000, 'Cigar Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2574, true);
INSERT INTO public.moon VALUES (10, 'Prometheus', 6, 42, false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561, true);
INSERT INTO public.moon VALUES (12, 'Epimetheus', 6, 117, false);
INSERT INTO public.moon VALUES (13, 'Titania', 7, 788, true);
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 761, true);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 578, true);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 584, true);
INSERT INTO public.moon VALUES (17, 'Margaret', 7, 10, false);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 1353, true);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 174, false);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 209, false);
INSERT INTO public.moon VALUES (21, 'Thalassa', 8, 41, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2.3, 0.38, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6.0, 0.72, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6.3, 1.00, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3.3, 1.52, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69.9, 5.20, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58.2, 9.50, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25.4, 19.10, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 34.6, 30.07, false);
INSERT INTO public.planet VALUES (9, 'Kepler B', 8, 8.3, 0.07, false);
INSERT INTO public.planet VALUES (10, 'Kepler C', 8, 9.2, 0.09, false);
INSERT INTO public.planet VALUES (11, 'Kepler I', 8, 8.4, 0.10, false);
INSERT INTO public.planet VALUES (12, 'Kepler D', 8, 18.3, 0.32, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'G2V', 4500, 'Sun');
INSERT INTO public.star VALUES (2, 1, 'G2V', 7500, 'Rigil Kentaurus');
INSERT INTO public.star VALUES (3, 1, 'K1V', 7500, 'Toliman');
INSERT INTO public.star VALUES (5, 1, 'DA2', 242, 'Sirius A');
INSERT INTO public.star VALUES (6, 1, 'DA2', 228, 'Sirius B');
INSERT INTO public.star VALUES (7, 1, 'M1', 14, 'Betelgeuse');
INSERT INTO public.star VALUES (8, 1, 'F9 IV/V', 5800, 'Kepler-30');


--
-- Data for Name: star_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planets VALUES (1, 3, 'Earth');
INSERT INTO public.star_planets VALUES (1, 4, 'Mars');
INSERT INTO public.star_planets VALUES (1, 1, 'Mercury');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: star_planets star_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_pkey PRIMARY KEY (star_planets_id);


--
-- Name: star_planets star_planets_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_planet_name_key UNIQUE (name);


--
-- Name: star_planets star_planets_star_planets_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_star_planets_id_key UNIQUE (star_planets_id);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_planets star_planets_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_planet_name_fkey FOREIGN KEY (name) REFERENCES public.planet(name);


--
-- Name: star_planets star_planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

