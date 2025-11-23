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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username character varying(22),
    number_of_guesses integer,
    number_of_games integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('Kien', 0, 2);
INSERT INTO public.games VALUES ('Kid', 10000000, 1);
INSERT INTO public.games VALUES ('user_1763917275358', 648, 3);
INSERT INTO public.games VALUES ('user_1763917275359', 100, 6);
INSERT INTO public.games VALUES ('user_1763917290316', 245, 3);
INSERT INTO public.games VALUES ('user_1763918122525', 655, 3);
INSERT INTO public.games VALUES ('user_1763917290317', 204, 6);
INSERT INTO public.games VALUES ('user_1763918122526', 417, 6);
INSERT INTO public.games VALUES ('Kie', 8, 3);
INSERT INTO public.games VALUES ('user_1763917363658', 35, 3);
INSERT INTO public.games VALUES ('user_1763917363659', 164, 6);
INSERT INTO public.games VALUES ('user_1763917493759', 293, 3);
INSERT INTO public.games VALUES ('user_1763918204243', 566, 3);
INSERT INTO public.games VALUES ('user_1763917493760', 204, 6);
INSERT INTO public.games VALUES ('user_1763918204244', 284, 6);
INSERT INTO public.games VALUES ('user_1763917502868', 238, 3);
INSERT INTO public.games VALUES ('user_1763917502869', 323, 6);
INSERT INTO public.games VALUES ('user_1763918476276', 713, 2);
INSERT INTO public.games VALUES ('user_1763917898087', 95, 3);
INSERT INTO public.games VALUES ('user_1763917898088', 78, 6);
INSERT INTO public.games VALUES ('user_1763918476277', 32, 5);
INSERT INTO public.games VALUES ('user_1763917903251', 512, 3);
INSERT INTO public.games VALUES ('user_1763917903252', 659, 6);
INSERT INTO public.games VALUES ('user_1763918494417', 488, 2);
INSERT INTO public.games VALUES ('user_1763917938362', 789, 3);
INSERT INTO public.games VALUES ('user_1763918494418', 132, 5);
INSERT INTO public.games VALUES ('user_1763917938363', 38, 6);
INSERT INTO public.games VALUES ('user_1763917941664', 589, 3);
INSERT INTO public.games VALUES ('user_1763917941665', 227, 6);
INSERT INTO public.games VALUES ('user_1763918515021', 224, 2);
INSERT INTO public.games VALUES ('user_1763918515022', 222, 5);
INSERT INTO public.games VALUES ('user_1763918524734', 92, 2);
INSERT INTO public.games VALUES ('user_1763918524735', 176, 5);
INSERT INTO public.games VALUES ('user_1763918549615', 187, 2);
INSERT INTO public.games VALUES ('user_1763918549616', 186, 5);
INSERT INTO public.games VALUES ('user_1763918555006', 908, 2);
INSERT INTO public.games VALUES ('user_1763918555007', 99, 5);


--
-- Name: games games_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

