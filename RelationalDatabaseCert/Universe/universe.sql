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
-- Name: fiction_references; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.fiction_references (
    media_types character varying(50) NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    fiction_references_id integer NOT NULL
);


ALTER TABLE public.fiction_references OWNER TO freecodecamp;

--
-- Name: fiction_references_fiction_references_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.fiction_references_fiction_references_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fiction_references_fiction_references_id_seq OWNER TO freecodecamp;

--
-- Name: fiction_references_fiction_references_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.fiction_references_fiction_references_id_seq OWNED BY public.fiction_references.fiction_references_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    fictional boolean,
    type character varying(50) NOT NULL,
    catalog_references character varying(10)
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
    fictional boolean,
    description text,
    planet_id integer,
    approx_km_to_planet integer
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
    fictional boolean,
    type character varying(25),
    moons_total integer,
    star_id integer,
    approx_au_to_star numeric(4,1)
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
    fictional boolean,
    type character varying(50),
    galaxy_id integer,
    approx_lightyears_to_earth numeric(6,2)
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
-- Name: fiction_references fiction_references_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fiction_references ALTER COLUMN fiction_references_id SET DEFAULT nextval('public.fiction_references_fiction_references_id_seq'::regclass);


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
-- Data for Name: fiction_references; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.fiction_references VALUES ('book,movie', 'Dune', NULL, NULL, 13, NULL, 1);
INSERT INTO public.fiction_references VALUES ('television,book', 'Gallifrey', NULL, NULL, 12, NULL, 3);
INSERT INTO public.fiction_references VALUES ('comic book,movie,television', 'Krypton', NULL, NULL, 11, NULL, 2);
INSERT INTO public.fiction_references VALUES ('television', 'Stargate Atlantis', 4, NULL, NULL, NULL, 5);
INSERT INTO public.fiction_references VALUES ('movie,television', 'Stargate SG-1', 1, NULL, 1, NULL, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', false, 'spiral', NULL);
INSERT INTO public.galaxy VALUES (4, 'Pegasus Dwarf Irregular', false, 'Irregular', NULL);
INSERT INTO public.galaxy VALUES (5, 'Kaliem', true, 'unk', NULL);
INSERT INTO public.galaxy VALUES (6, 'Ida', true, 'unk', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 'spiral', 'M31');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', false, 'spiral', 'M33');
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', false, 'spiral', 'M51');
INSERT INTO public.galaxy VALUES (8, 'Spindle', false, 'unk', 'M102');
INSERT INTO public.galaxy VALUES (9, 'New Eden', true, 'unk', NULL);
INSERT INTO public.galaxy VALUES (10, 'Ford', true, 'unk', NULL);
INSERT INTO public.galaxy VALUES (11, 'Solana', true, 'unk', NULL);
INSERT INTO public.galaxy VALUES (12, 'Bogon', true, 'unk', NULL);
INSERT INTO public.galaxy VALUES (13, 'Polaris', true, 'unk', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', false, 'Spherical and rocky with minimal atmosphere. For more detail see https://www.britannica.com/place/Moon', 1, 384400);
INSERT INTO public.moon VALUES (3, 'Europa', false, 'Icy Surface potentially hiding a salt-water ocean and rocky mantle', 5, 671000);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, 'Icy with a magnetic field that causes auroras, and possibly a tenuous oxygen atmosphere', 5, 1070000);
INSERT INTO public.moon VALUES (2, 'Callisto', false, 'Heavily cratered', 5, 1883000);
INSERT INTO public.moon VALUES (5, 'Io', false, 'Volcanically active with lakes of molten silicate lava and a thin sulfur dioxide atmosphere', 5, 262878);
INSERT INTO public.moon VALUES (6, 'Dione', false, 'heavily cratered icy surface and possibly a silicate rock core', 6, 234500);
INSERT INTO public.moon VALUES (7, 'Enceladus', false, 'surprisingly has a fairly smooth icy surface and experiences tidal heating from orbital resonance with Dione', 6, NULL);
INSERT INTO public.moon VALUES (8, 'Iapetus', false, 'most notable is the dark and light sides likely most caused by slow rotation allowing the dark side to absorb heat and sublimate volatiles and secondarily the Voyager Mountains on the equator', 6, NULL);
INSERT INTO public.moon VALUES (9, 'Titan', false, 'icy and obscured by hazy mostly nitrogen with a dash of methane atmosphere', 6, 1200000);
INSERT INTO public.moon VALUES (10, 'Ajan Kloss', true, 'jungle moon from Star Wars Battlefront II', NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Endor', true, 'forest moon from Star Wars Return of the Jedi', NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Rugosa', true, 'mostly giant coral reefs from Star Wars The Clone Wars', NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Yavin 4', true, 'forest moon from Star Wars', NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Phobos', false, 'possibly c-type rock', 4, NULL);
INSERT INTO public.moon VALUES (15, 'Deimos', false, 'possibly c-type rock', 4, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', false, NULL, 7, NULL);
INSERT INTO public.moon VALUES (17, 'Oberon', false, NULL, 7, NULL);
INSERT INTO public.moon VALUES (18, 'Puck', false, NULL, 7, NULL);
INSERT INTO public.moon VALUES (19, 'Rosalind', false, NULL, 7, NULL);
INSERT INTO public.moon VALUES (20, 'Titania', false, NULL, 7, NULL);
INSERT INTO public.moon VALUES (21, 'Umbriel', false, NULL, 7, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', false, 'terrestrial', 0, 1, 0.4);
INSERT INTO public.planet VALUES (1, 'Earth', false, 'terrestrial', 1, 1, 1.0);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'terrestrial', 0, 1, 0.7);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'terrestrial', 2, 1, 1.5);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'gas giant', 80, 1, 5.1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'gas giant', 83, 1, 9.5);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'ice giant', 27, 1, 19.8);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'ice giant', 14, 1, 30.0);
INSERT INTO public.planet VALUES (9, 'Vulcan', true, 'terrestrial', 0, 6, NULL);
INSERT INTO public.planet VALUES (10, 'Erid', true, 'terrestrial', NULL, 6, NULL);
INSERT INTO public.planet VALUES (11, 'Krypton', true, 'terrestrial', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Gallifrey', true, 'terrestrial', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Arrakis', true, 'terrestrial', NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', false, 'red dwarf', 1, 4.24);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', false, 'yellow dwarf', 1, 4.37);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', false, 'orange dwarf', 1, 4.37);
INSERT INTO public.star VALUES (1, 'Sol System', false, 'Yellow Dwarf', 1, NULL);
INSERT INTO public.star VALUES (6, '40 Eridani A', false, 'yellow dwarf', 1, NULL);
INSERT INTO public.star VALUES (7, '40 Eridani B', false, 'white dwarf', 1, 16.40);
INSERT INTO public.star VALUES (8, '40 Eridani C', false, 'red dwarf', 1, NULL);


--
-- Name: fiction_references_fiction_references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.fiction_references_fiction_references_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: fiction_references fiction_references_media_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fiction_references
    ADD CONSTRAINT fiction_references_media_types_key UNIQUE (media_types);


--
-- Name: fiction_references fiction_references_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fiction_references
    ADD CONSTRAINT fiction_references_name_key UNIQUE (name);


--
-- Name: fiction_references fiction_references_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fiction_references
    ADD CONSTRAINT fiction_references_pkey PRIMARY KEY (fiction_references_id);


--
-- Name: galaxy galaxy_messier_catalog_ref_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_messier_catalog_ref_key UNIQUE (catalog_references);


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
-- Name: planet name_planetid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_planetid UNIQUE (name, planet_id);


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

