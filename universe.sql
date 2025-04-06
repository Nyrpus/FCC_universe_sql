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
-- Name: anomaly; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.anomaly (
    anomaly_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    description text,
    hostile boolean
);


ALTER TABLE public.anomaly OWNER TO freecodecamp;

--
-- Name: anomaly_anomaly_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.anomaly_anomaly_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anomaly_anomaly_id_seq OWNER TO freecodecamp;

--
-- Name: anomaly_anomaly_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.anomaly_anomaly_id_seq OWNED BY public.anomaly.anomaly_id;


--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    description text,
    size numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer NOT NULL,
    distance integer,
    age numeric
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    atmosphere boolean,
    description text,
    gravity numeric
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    habitable boolean,
    description text,
    solid boolean,
    gravity numeric
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
    name character varying(50) NOT NULL,
    size numeric,
    distance integer,
    age numeric,
    supernova boolean,
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
-- Name: anomaly anomaly_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly ALTER COLUMN anomaly_id SET DEFAULT nextval('public.anomaly_anomaly_id_seq'::regclass);


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: anomaly; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.anomaly VALUES (1, 'Rama', 2, 'giant cylindrical habitat', false);
INSERT INTO public.anomaly VALUES (2, 'Local wormhole', 6, 'anomalous wormhole that recently materialized', false);
INSERT INTO public.anomaly VALUES (3, 'Cube', 4, 'a geometrically perfect cube photographed by a rover on the surface of Mars', false);
INSERT INTO public.anomaly VALUES (4, 'Droplet', 8, 'a fast moving reflective craft quickly approaching the center of the solar system', true);
INSERT INTO public.anomaly VALUES (5, 'Robert', 3, 'a man who feel from the orbit into the middle Times Sqare, has not been see since, the government declines to comment', false);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 'Dwarf planet in the asteroid belt', 940);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 'Bright basaltic large rocky body', 525);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, 'On a tilted orbit and heavily cratered', 512);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 1, 'Possible dwarf planet, very dark', 430);
INSERT INTO public.asteroid VALUES (5, 'Eros', 1, 'First asteroid orbited by spacecraft', 17);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0, 13.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 260000, 2500000, 7);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 3200000, 8);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 32000, 163000, 10.5);
INSERT INTO public.galaxy VALUES (5, 'M32', 30000, 2490000, 8.2);
INSERT INTO public.galaxy VALUES (6, 'M33', 245000, 33500000, 4.2);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 14000, 71000, 9.1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, false, 'largest moon in the system', 0.165);
INSERT INTO public.moon VALUES (2, 'Europa', 5, true, 'icy shell with subsurface ocean', 0.134);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5, false, 'largest moon by volume', 1.146);
INSERT INTO public.moon VALUES (4, 'Titan', 6, true, 'thick atmosphere with liquid methan lakes', 0.138);
INSERT INTO public.moon VALUES (5, 'Enceladus', 6, false, 'ice gaysers with potential ocean below', 0.011);
INSERT INTO public.moon VALUES (6, 'Io', 5, true, 'most volcanic body in the system', 0.183);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 'ancient surface, possible ocean', 0.126);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 'irregular, red-tinted inner moon', 0.020);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, false, 'largest of Jupiter’s outer moons', 0.006);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, true, 'icy surface, cratered heavily', 0.027);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, true, 'two-tone color, equatorial ridge', 0.023);
INSERT INTO public.moon VALUES (12, 'Dione', 6, true, 'icy cliffs and bright streaks', 0.023);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, false, 'giant canyon, mostly ice', 0.015);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, false, '"death star" lookalike, cratered', 0.006);
INSERT INTO public.moon VALUES (15, 'Hyperion', 6, false, 'sponge-like, tumbling irregular moon', 0.002);
INSERT INTO public.moon VALUES (16, 'Phoebe', 6, false, 'retrograde orbit, likely captured', 0.004);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, false, 'frankenstein-like patchy surface', 0.008);
INSERT INTO public.moon VALUES (18, 'Titania', 7, false, 'largest Uranian moon, icy terrain', 0.038);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, false, 'icy, old, large impact features', 0.035);
INSERT INTO public.moon VALUES (20, 'Charon', 9, true, 'half Pluto’s size, icy canyoned', 0.030);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 'little sizzled baren rock', true, 0.38);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 'toxic crushing sauna', true, 0.9);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 'home', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 'cold red desert', true, 0.38);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 'gas giant', false, 2.53);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 'ringed gas giant', false, 1.06);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 'tilted', false, 0.89);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 'cold blue and far away', false, 1.14);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, true, 'promising new home', true, 1.1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 2, false, 'mini Neptune', false, 2.5);
INSERT INTO public.planet VALUES (11, 'Sirius b2', 7, true, 'shows signs of organic life and liquid oceans', true, 1.4);
INSERT INTO public.planet VALUES (12, 'Sirius b3', 7, false, 'gas giant of awesome size', false, 5.2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, 4.6, false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.12, 4, 4.85, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1.1, 4, 5.3, false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 0.91, 4, 5.3, false, 1);
INSERT INTO public.star VALUES (5, 'Bernards Star', 0.16, 5, 10, false, 1);
INSERT INTO public.star VALUES (6, 'Wolf 359', 0.1, 8, 1, false, 1);
INSERT INTO public.star VALUES (7, 'Sirius A', 2.06, 8, 0.2, true, 1);
INSERT INTO public.star VALUES (8, 'Sirius B', 1.1, 8, 0.1, false, 1);


--
-- Name: anomaly_anomaly_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.anomaly_anomaly_id_seq', 5, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: anomaly anomaly_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT anomaly_name_key UNIQUE (name);


--
-- Name: anomaly anomaly_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT anomaly_pkey PRIMARY KEY (anomaly_id);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: anomaly anomaly_parent_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT anomaly_parent_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: asteroid asteroid_parent_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_parent_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_parent_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_parent_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_parent_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_parent_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_parent_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_parent_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

