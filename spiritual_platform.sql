--
-- PostgreSQL database dump
--

\restrict lIr6IrhOphPPtRq99EduGDtHLK3Fq8NN4iXuK5VDHrfMxMYddkx3c453lTdmcaR

-- Dumped from database version 16.14 (Homebrew)
-- Dumped by pg_dump version 16.14 (Homebrew)

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
-- Name: course_enrollments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_enrollments (
    id integer NOT NULL,
    user_id integer,
    course_id integer,
    purchased_at timestamp without time zone DEFAULT now()
);


--
-- Name: course_enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_enrollments_id_seq OWNED BY public.course_enrollments.id;


--
-- Name: course_lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_lessons (
    id integer NOT NULL,
    course_id integer,
    title character varying(200) NOT NULL,
    content_type character varying(10) NOT NULL,
    content_url text NOT NULL,
    "position" integer NOT NULL,
    duration_seconds integer,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT course_lessons_content_type_check CHECK (((content_type)::text = ANY ((ARRAY['video'::character varying, 'pdf'::character varying])::text[])))
);


--
-- Name: course_lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_lessons_id_seq OWNED BY public.course_lessons.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    price numeric(10,2) DEFAULT 0,
    thumbnail_url text,
    mentor_id integer,
    created_by integer,
    status character varying(20) DEFAULT 'draft'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT courses_status_check CHECK (((status)::text = ANY ((ARRAY['draft'::character varying, 'published'::character varying])::text[])))
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: lesson_progress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lesson_progress (
    id integer NOT NULL,
    user_id integer,
    lesson_id integer,
    completed boolean DEFAULT false,
    completed_at timestamp without time zone
);


--
-- Name: lesson_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lesson_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lesson_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lesson_progress_id_seq OWNED BY public.lesson_progress.id;


--
-- Name: meditation_bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meditation_bookmarks (
    id integer NOT NULL,
    user_id integer,
    meditation_id integer,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: meditation_bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meditation_bookmarks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meditation_bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meditation_bookmarks_id_seq OWNED BY public.meditation_bookmarks.id;


--
-- Name: meditation_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meditation_categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: meditation_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meditation_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meditation_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meditation_categories_id_seq OWNED BY public.meditation_categories.id;


--
-- Name: meditation_progress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meditation_progress (
    id integer NOT NULL,
    user_id integer,
    meditation_id integer,
    progress_seconds integer DEFAULT 0,
    completed boolean DEFAULT false,
    last_played_at timestamp without time zone DEFAULT now()
);


--
-- Name: meditation_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meditation_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meditation_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meditation_progress_id_seq OWNED BY public.meditation_progress.id;


--
-- Name: meditations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meditations (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    category_id integer,
    media_type character varying(10) NOT NULL,
    media_url text NOT NULL,
    thumbnail_url text,
    duration_seconds integer NOT NULL,
    created_by integer,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT meditations_media_type_check CHECK (((media_type)::text = ANY ((ARRAY['audio'::character varying, 'video'::character varying])::text[])))
);


--
-- Name: meditations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meditations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meditations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meditations_id_seq OWNED BY public.meditations.id;


--
-- Name: otp_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.otp_codes (
    id integer NOT NULL,
    user_id integer,
    code character varying(6) NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: otp_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.otp_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: otp_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.otp_codes_id_seq OWNED BY public.otp_codes.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_tokens (
    id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.password_reset_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.password_reset_tokens_id_seq OWNED BY public.password_reset_tokens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    role character varying(20) DEFAULT 'user'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    is_verified boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: course_enrollments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_enrollments ALTER COLUMN id SET DEFAULT nextval('public.course_enrollments_id_seq'::regclass);


--
-- Name: course_lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_lessons ALTER COLUMN id SET DEFAULT nextval('public.course_lessons_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: lesson_progress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_progress ALTER COLUMN id SET DEFAULT nextval('public.lesson_progress_id_seq'::regclass);


--
-- Name: meditation_bookmarks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_bookmarks ALTER COLUMN id SET DEFAULT nextval('public.meditation_bookmarks_id_seq'::regclass);


--
-- Name: meditation_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_categories ALTER COLUMN id SET DEFAULT nextval('public.meditation_categories_id_seq'::regclass);


--
-- Name: meditation_progress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_progress ALTER COLUMN id SET DEFAULT nextval('public.meditation_progress_id_seq'::regclass);


--
-- Name: meditations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditations ALTER COLUMN id SET DEFAULT nextval('public.meditations_id_seq'::regclass);


--
-- Name: otp_codes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.otp_codes ALTER COLUMN id SET DEFAULT nextval('public.otp_codes_id_seq'::regclass);


--
-- Name: password_reset_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens ALTER COLUMN id SET DEFAULT nextval('public.password_reset_tokens_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: course_enrollments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_enrollments (id, user_id, course_id, purchased_at) FROM stdin;
\.


--
-- Data for Name: course_lessons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_lessons (id, course_id, title, content_type, content_url, "position", duration_seconds, created_at) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses (id, title, description, price, thumbnail_url, mentor_id, created_by, status, created_at) FROM stdin;
\.


--
-- Data for Name: lesson_progress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lesson_progress (id, user_id, lesson_id, completed, completed_at) FROM stdin;
\.


--
-- Data for Name: meditation_bookmarks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meditation_bookmarks (id, user_id, meditation_id, created_at) FROM stdin;
\.


--
-- Data for Name: meditation_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meditation_categories (id, name, slug, description, created_at) FROM stdin;
\.


--
-- Data for Name: meditation_progress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meditation_progress (id, user_id, meditation_id, progress_seconds, completed, last_played_at) FROM stdin;
1	9	1	10	f	2026-09-05 11:10:16.436463
\.


--
-- Data for Name: meditations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meditations (id, title, description, category_id, media_type, media_url, thumbnail_url, duration_seconds, created_by, created_at) FROM stdin;
1	meditation audio 	soft sound for mediatation 	\N	audio	http://localhost:5001/uploads/1788581571000-audio.mp3	\N	13	6	2026-09-05 09:42:51.024318
\.


--
-- Data for Name: otp_codes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.otp_codes (id, user_id, code, expires_at, created_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.password_reset_tokens (id, user_id, token, expires_at, created_at) FROM stdin;
2	5	bbf5fa0e50c0b4b3418fc44ddd7d6bc8768cb56dba1a9c54ac1896b128a1d550	2026-08-14 15:21:47.411	2026-08-14 14:51:47.41217
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password_hash, role, created_at, is_verified) FROM stdin;
1	Test User	testuser@example.com	$2b$10$19ut9zUFasrODq8mSOn7KO86U1b6oMIvKVTMJZbFgW5vDE0N9Evmy	user	2026-08-12 11:25:51.765238	f
4	dajh	ashdk@gmail.com	$2b$10$yAAem2Nffcj3g6nIktDJtuobLy9.xs9N.tgIufPqa2y6O.x8mQ47a	user	2026-08-13 10:03:24.951881	f
3	harsha	harsha@gmail.com	$2b$10$g4pxjrUBRMo0hALm94wecukMUNeGE8e8xY/4ljcgbVdnnzGRqcj/i	mentor	2026-08-12 23:49:05.341523	f
5	Test User	harshatakotalwar05@gmail.com	$2b$10$KIDTK/riX0i2lAtqJ.ggYO2W2i.OHV.gqSKmup.oybJeUsOyoReu6	user	2026-08-13 14:28:58.926607	t
7	harshata 	harshatakotalwar04@gmail.com	$2b$10$B53PTt6c7RVPuCR39exgGupNynO3m/l3AhfWtYkcxWf2cdDlnUlfu	user	2026-08-14 10:09:12.027322	t
2	Sanika Manoj Dusad	sanikadusad@gmail.com	$2b$10$UPVGjGmQAUfTf5eP7kbnKu5uCqVV8wwoNl0DgV3h5vQ5EVNEfjz2.	admin	2026-08-12 22:59:21.314179	t
6	Sanika 	sanikad_t23036@students.isquareit.edu.in	$2b$10$LlkEa9hiSyc8ADP.TQiDH.zGQOoL3HKYpo/I6eZJHql991CCj03/S	mentor	2026-08-13 14:38:11.869129	t
8	Harsha	harshatak_t23095@students.isquareit.edu.in	$2b$10$19PFoW/7F3bCybekUy6hmuNvMo/ZHnnyACx2XWWhC/WrYC0FCdJ/q	user	2026-08-23 01:55:48.40771	t
9	Rudraksh C	rudrakshchoudhary05@gmail.com	$2b$10$4t7G.DayHTwm.f6VOceHGOR91M0wgfiJ3mqV.2Z8UDEU73VaToYlC	user	2026-09-05 10:12:36.459077	t
\.


--
-- Name: course_enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_enrollments_id_seq', 1, false);


--
-- Name: course_lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_lessons_id_seq', 1, false);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, false);


--
-- Name: lesson_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lesson_progress_id_seq', 1, false);


--
-- Name: meditation_bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meditation_bookmarks_id_seq', 1, false);


--
-- Name: meditation_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meditation_categories_id_seq', 1, false);


--
-- Name: meditation_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meditation_progress_id_seq', 18, true);


--
-- Name: meditations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meditations_id_seq', 1, true);


--
-- Name: otp_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.otp_codes_id_seq', 6, true);


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.password_reset_tokens_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: course_enrollments course_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_enrollments
    ADD CONSTRAINT course_enrollments_pkey PRIMARY KEY (id);


--
-- Name: course_enrollments course_enrollments_user_id_course_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_enrollments
    ADD CONSTRAINT course_enrollments_user_id_course_id_key UNIQUE (user_id, course_id);


--
-- Name: course_lessons course_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_lessons
    ADD CONSTRAINT course_lessons_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: lesson_progress lesson_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT lesson_progress_pkey PRIMARY KEY (id);


--
-- Name: lesson_progress lesson_progress_user_id_lesson_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT lesson_progress_user_id_lesson_id_key UNIQUE (user_id, lesson_id);


--
-- Name: meditation_bookmarks meditation_bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_bookmarks
    ADD CONSTRAINT meditation_bookmarks_pkey PRIMARY KEY (id);


--
-- Name: meditation_bookmarks meditation_bookmarks_user_id_meditation_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_bookmarks
    ADD CONSTRAINT meditation_bookmarks_user_id_meditation_id_key UNIQUE (user_id, meditation_id);


--
-- Name: meditation_categories meditation_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_categories
    ADD CONSTRAINT meditation_categories_pkey PRIMARY KEY (id);


--
-- Name: meditation_categories meditation_categories_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_categories
    ADD CONSTRAINT meditation_categories_slug_key UNIQUE (slug);


--
-- Name: meditation_progress meditation_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_progress
    ADD CONSTRAINT meditation_progress_pkey PRIMARY KEY (id);


--
-- Name: meditation_progress meditation_progress_user_id_meditation_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_progress
    ADD CONSTRAINT meditation_progress_user_id_meditation_id_key UNIQUE (user_id, meditation_id);


--
-- Name: meditations meditations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditations
    ADD CONSTRAINT meditations_pkey PRIMARY KEY (id);


--
-- Name: otp_codes otp_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.otp_codes
    ADD CONSTRAINT otp_codes_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_token_key UNIQUE (token);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: course_enrollments course_enrollments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_enrollments
    ADD CONSTRAINT course_enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: course_enrollments course_enrollments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_enrollments
    ADD CONSTRAINT course_enrollments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: course_lessons course_lessons_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_lessons
    ADD CONSTRAINT course_lessons_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: courses courses_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: courses courses_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: lesson_progress lesson_progress_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT lesson_progress_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.course_lessons(id) ON DELETE CASCADE;


--
-- Name: lesson_progress lesson_progress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_progress
    ADD CONSTRAINT lesson_progress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: meditation_bookmarks meditation_bookmarks_meditation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_bookmarks
    ADD CONSTRAINT meditation_bookmarks_meditation_id_fkey FOREIGN KEY (meditation_id) REFERENCES public.meditations(id) ON DELETE CASCADE;


--
-- Name: meditation_bookmarks meditation_bookmarks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_bookmarks
    ADD CONSTRAINT meditation_bookmarks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: meditation_progress meditation_progress_meditation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_progress
    ADD CONSTRAINT meditation_progress_meditation_id_fkey FOREIGN KEY (meditation_id) REFERENCES public.meditations(id) ON DELETE CASCADE;


--
-- Name: meditation_progress meditation_progress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_progress
    ADD CONSTRAINT meditation_progress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: meditations meditations_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditations
    ADD CONSTRAINT meditations_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.meditation_categories(id) ON DELETE SET NULL;


--
-- Name: meditations meditations_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditations
    ADD CONSTRAINT meditations_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: otp_codes otp_codes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.otp_codes
    ADD CONSTRAINT otp_codes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: password_reset_tokens password_reset_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict lIr6IrhOphPPtRq99EduGDtHLK3Fq8NN4iXuK5VDHrfMxMYddkx3c453lTdmcaR

