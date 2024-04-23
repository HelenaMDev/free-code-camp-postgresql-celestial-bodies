--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_million_years numeric(10,4),
    is_explored boolean
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
    name character varying(50) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    description text,
    age_in_million_years numeric(10,4)
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    population bigint,
    countries integer,
    atmosphere_density numeric(10,2),
    description text,
    is_spheric boolean,
    is_explored boolean,
    star_id integer NOT NULL,
    animal_species integer,
    age_in_million_years numeric(10,4)
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(125) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    distance_from_earth numeric(10,2),
    age_in_million_years numeric(10,4)
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
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 2, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Centaurus A', 3, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 4, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 5, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 6, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Magellanic Clouds', 7, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 19, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('Phobos', 20, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Deimos', 21, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 22, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Callisto', 23, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', 24, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Titan', 25, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 26, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Rhea', 27, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Iapetus', 28, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Oberon', 29, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Titania', 30, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Ariel', 31, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Miranda', 32, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Triton', 33, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Nereid', 34, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Io', 35, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Mimas', 36, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Dione', 37, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Tethys', 38, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Hyperion', 39, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Phoebe', 40, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Janus', 41, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Epimetheus', 42, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Helene', 43, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Andromeda I', 44, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Andromeda II', 45, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Magellanic I', 46, 8, NULL, NULL);
INSERT INTO public.moon VALUES ('Magellanic II', 47, 8, NULL, NULL);
INSERT INTO public.moon VALUES ('Magellanic III', 48, 8, NULL, NULL);
INSERT INTO public.moon VALUES ('Magellanic IV', 49, 8, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Mars', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Jupiter', 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Saturn', 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Uranus', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Neptune', 6, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('Kepler-16b', 7, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.planet VALUES ('Kepler-186f', 8, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 9, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL);
INSERT INTO public.planet VALUES ('Messier 51 ULS1', 10, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL);
INSERT INTO public.planet VALUES ('HD 209458 b', 11, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES ('WASP-12b', 12, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL);
INSERT INTO public.planet VALUES ('Kepler-452b', 13, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL);
INSERT INTO public.planet VALUES ('Kepler-186e', 14, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.planet VALUES ('Kepler-186d', 15, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.planet VALUES ('Andromeda b', 16, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL);
INSERT INTO public.planet VALUES ('Andromeda c', 17, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL);
INSERT INTO public.planet VALUES ('Magellanic b', 18, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL);
INSERT INTO public.planet VALUES ('Magellanic c', 19, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL);
INSERT INTO public.planet VALUES ('Magellanic d', 20, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Homo Sapiens', 1);
INSERT INTO public.species VALUES (2, 'Dog', 1);
INSERT INTO public.species VALUES (3, 'Cat', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Betelgeuse', 2, 2, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Rigel', 3, 2, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Antares', 4, 3, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Arcturus', 5, 4, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Spica', 6, 4, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Regulus', 7, 5, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Vega', 8, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Sirius', 9, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Altair', 10, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Alpheratz', 11, 6, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Mirach', 12, 6, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Deneb Kaitos', 13, 7, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Achernar', 14, 7, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 49, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


