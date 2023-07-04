--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    guess_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guesses_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guesses_guess_id_seq OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guesses_guess_id_seq OWNED BY public.guesses.guess_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: guesses guess_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses ALTER COLUMN guess_id SET DEFAULT nextval('public.guesses_guess_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES (231, 112, 7);
INSERT INTO public.guesses VALUES (232, 113, 473);
INSERT INTO public.guesses VALUES (233, 113, 163);
INSERT INTO public.guesses VALUES (234, 114, 324);
INSERT INTO public.guesses VALUES (235, 114, 166);
INSERT INTO public.guesses VALUES (236, 113, 79);
INSERT INTO public.guesses VALUES (237, 113, 733);
INSERT INTO public.guesses VALUES (238, 113, 762);
INSERT INTO public.guesses VALUES (239, 115, 270);
INSERT INTO public.guesses VALUES (240, 116, 960);
INSERT INTO public.guesses VALUES (241, 116, 692);
INSERT INTO public.guesses VALUES (242, 115, 479);
INSERT INTO public.guesses VALUES (243, 115, 914);
INSERT INTO public.guesses VALUES (244, 115, 738);
INSERT INTO public.guesses VALUES (245, 117, 971);
INSERT INTO public.guesses VALUES (246, 118, 511);
INSERT INTO public.guesses VALUES (247, 118, 47);
INSERT INTO public.guesses VALUES (248, 117, 516);
INSERT INTO public.guesses VALUES (249, 117, 405);
INSERT INTO public.guesses VALUES (250, 120, 104);
INSERT INTO public.guesses VALUES (251, 120, 750);
INSERT INTO public.guesses VALUES (252, 120, 126);
INSERT INTO public.guesses VALUES (253, 120, 458);
INSERT INTO public.guesses VALUES (254, 120, 440);
INSERT INTO public.guesses VALUES (255, 122, 273);
INSERT INTO public.guesses VALUES (256, 122, 727);
INSERT INTO public.guesses VALUES (257, 123, 975);
INSERT INTO public.guesses VALUES (258, 123, 390);
INSERT INTO public.guesses VALUES (259, 122, 204);
INSERT INTO public.guesses VALUES (260, 122, 15);
INSERT INTO public.guesses VALUES (261, 122, 367);
INSERT INTO public.guesses VALUES (262, 124, 93);
INSERT INTO public.guesses VALUES (263, 124, 948);
INSERT INTO public.guesses VALUES (264, 125, 119);
INSERT INTO public.guesses VALUES (265, 125, 617);
INSERT INTO public.guesses VALUES (266, 124, 465);
INSERT INTO public.guesses VALUES (267, 124, 743);
INSERT INTO public.guesses VALUES (268, 124, 430);
INSERT INTO public.guesses VALUES (269, 126, 431);
INSERT INTO public.guesses VALUES (270, 126, 214);
INSERT INTO public.guesses VALUES (271, 127, 683);
INSERT INTO public.guesses VALUES (272, 127, 500);
INSERT INTO public.guesses VALUES (273, 126, 709);
INSERT INTO public.guesses VALUES (274, 126, 678);
INSERT INTO public.guesses VALUES (275, 126, 980);
INSERT INTO public.guesses VALUES (276, 128, 499);
INSERT INTO public.guesses VALUES (277, 129, 608);
INSERT INTO public.guesses VALUES (278, 128, 766);
INSERT INTO public.guesses VALUES (279, 128, 647);
INSERT INTO public.guesses VALUES (280, 128, 430);
INSERT INTO public.guesses VALUES (281, 130, 860);
INSERT INTO public.guesses VALUES (282, 131, 748);
INSERT INTO public.guesses VALUES (283, 130, 5);
INSERT INTO public.guesses VALUES (284, 130, 474);
INSERT INTO public.guesses VALUES (285, 130, 818);
INSERT INTO public.guesses VALUES (286, 132, 372);
INSERT INTO public.guesses VALUES (287, 133, 549);
INSERT INTO public.guesses VALUES (288, 132, 804);
INSERT INTO public.guesses VALUES (289, 132, 771);
INSERT INTO public.guesses VALUES (290, 132, 144);
INSERT INTO public.guesses VALUES (291, 134, 252);
INSERT INTO public.guesses VALUES (292, 135, 408);
INSERT INTO public.guesses VALUES (293, 135, 490);
INSERT INTO public.guesses VALUES (294, 134, 800);
INSERT INTO public.guesses VALUES (295, 134, 397);
INSERT INTO public.guesses VALUES (296, 134, 414);
INSERT INTO public.guesses VALUES (297, 136, 163);
INSERT INTO public.guesses VALUES (298, 136, 843);
INSERT INTO public.guesses VALUES (299, 137, 146);
INSERT INTO public.guesses VALUES (300, 137, 658);
INSERT INTO public.guesses VALUES (301, 136, 575);
INSERT INTO public.guesses VALUES (302, 136, 426);
INSERT INTO public.guesses VALUES (303, 136, 905);
INSERT INTO public.guesses VALUES (304, 143, 196);
INSERT INTO public.guesses VALUES (305, 143, 623);
INSERT INTO public.guesses VALUES (306, 144, 639);
INSERT INTO public.guesses VALUES (307, 144, 449);
INSERT INTO public.guesses VALUES (308, 143, 362);
INSERT INTO public.guesses VALUES (309, 143, 896);
INSERT INTO public.guesses VALUES (310, 143, 312);
INSERT INTO public.guesses VALUES (311, 145, 623);
INSERT INTO public.guesses VALUES (312, 145, 760);
INSERT INTO public.guesses VALUES (313, 146, 611);
INSERT INTO public.guesses VALUES (314, 146, 753);
INSERT INTO public.guesses VALUES (315, 145, 543);
INSERT INTO public.guesses VALUES (316, 145, 933);
INSERT INTO public.guesses VALUES (317, 145, 630);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (112, 'Peter');
INSERT INTO public.users VALUES (113, 'user_1688075779699');
INSERT INTO public.users VALUES (114, 'user_1688075779698');
INSERT INTO public.users VALUES (115, 'user_1688075823879');
INSERT INTO public.users VALUES (116, 'user_1688075823878');
INSERT INTO public.users VALUES (117, 'user_1688075843977');
INSERT INTO public.users VALUES (118, 'user_1688075843976');
INSERT INTO public.users VALUES (119, 'Bart');
INSERT INTO public.users VALUES (120, 'user_1688075882706');
INSERT INTO public.users VALUES (121, 'user_1688075882705');
INSERT INTO public.users VALUES (122, 'user_1688076005085');
INSERT INTO public.users VALUES (123, 'user_1688076005084');
INSERT INTO public.users VALUES (124, 'user_1688076043800');
INSERT INTO public.users VALUES (125, 'user_1688076043799');
INSERT INTO public.users VALUES (126, 'user_1688076095587');
INSERT INTO public.users VALUES (127, 'user_1688076095586');
INSERT INTO public.users VALUES (128, 'user_1688076227104');
INSERT INTO public.users VALUES (129, 'user_1688076227103');
INSERT INTO public.users VALUES (130, 'user_1688076327746');
INSERT INTO public.users VALUES (131, 'user_1688076327745');
INSERT INTO public.users VALUES (132, 'user_1688076347677');
INSERT INTO public.users VALUES (133, 'user_1688076347676');
INSERT INTO public.users VALUES (134, 'user_1688076413317');
INSERT INTO public.users VALUES (135, 'user_1688076413316');
INSERT INTO public.users VALUES (136, 'user_1688077144632');
INSERT INTO public.users VALUES (137, 'user_1688077144631');
INSERT INTO public.users VALUES (138, 'user_1688077511425');
INSERT INTO public.users VALUES (139, 'user_1688077511424');
INSERT INTO public.users VALUES (140, 'user_1688077581344');
INSERT INTO public.users VALUES (141, 'user_1688077581343');
INSERT INTO public.users VALUES (142, 'Pedro');
INSERT INTO public.users VALUES (143, 'user_1688077730299');
INSERT INTO public.users VALUES (144, 'user_1688077730298');
INSERT INTO public.users VALUES (145, 'user_1688077854825');
INSERT INTO public.users VALUES (146, 'user_1688077854824');


--
-- Name: guesses_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guesses_guess_id_seq', 317, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 146, true);


--
-- Name: guesses guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_pkey PRIMARY KEY (guess_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: guesses guesses_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_users_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

