--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: api_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_comments (
    id bigint NOT NULL,
    "commentId" character varying(20) NOT NULL,
    comment character varying(3000) NOT NULL,
    created_by character varying(90) NOT NULL,
    at timestamp with time zone NOT NULL,
    "isThisCommentSolution" boolean NOT NULL,
    "theIssue_id" bigint NOT NULL
);


ALTER TABLE public.api_comments OWNER TO postgres;

--
-- Name: api_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_comments_id_seq OWNER TO postgres;

--
-- Name: api_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_comments_id_seq OWNED BY public.api_comments.id;


--
-- Name: api_issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_issues (
    id bigint NOT NULL,
    theid character varying(15) NOT NULL,
    issue_name character varying(300) NOT NULL,
    created_by character varying(90) NOT NULL,
    at timestamp with time zone NOT NULL,
    text character varying(3000) NOT NULL,
    priority character varying(120) NOT NULL,
    assignto character varying(300) NOT NULL,
    "isIssueSolved" boolean NOT NULL,
    project_it_belongs_to_id bigint NOT NULL
);


ALTER TABLE public.api_issues OWNER TO postgres;

--
-- Name: api_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_issues_id_seq OWNER TO postgres;

--
-- Name: api_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_issues_id_seq OWNED BY public.api_issues.id;


--
-- Name: api_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_notifications (
    id bigint NOT NULL,
    "notificationID" character varying(20) NOT NULL,
    "toUser" character varying(90) NOT NULL,
    thetext character varying(3000) NOT NULL,
    "theLink" character varying(3000) NOT NULL,
    "isSeen" boolean NOT NULL,
    "IssueReference_id" bigint NOT NULL
);


ALTER TABLE public.api_notifications OWNER TO postgres;

--
-- Name: api_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_notifications_id_seq OWNER TO postgres;

--
-- Name: api_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_notifications_id_seq OWNED BY public.api_notifications.id;


--
-- Name: api_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_profile (
    id bigint NOT NULL,
    "isModerator" boolean NOT NULL,
    "theUser_id" integer NOT NULL
);


ALTER TABLE public.api_profile OWNER TO postgres;

--
-- Name: api_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_profile_id_seq OWNER TO postgres;

--
-- Name: api_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_profile_id_seq OWNED BY public.api_profile.id;


--
-- Name: api_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_projects (
    id bigint NOT NULL,
    theid character varying(15) NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.api_projects OWNER TO postgres;

--
-- Name: api_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_projects_id_seq OWNER TO postgres;

--
-- Name: api_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_projects_id_seq OWNED BY public.api_projects.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: polls_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls_comments (
    id integer NOT NULL,
    "commentId" character varying(20) NOT NULL,
    comment character varying(3000) NOT NULL,
    created_by character varying(90) NOT NULL,
    at timestamp with time zone NOT NULL,
    "isThisCommentSolution" boolean NOT NULL,
    "theIssue_id" integer NOT NULL
);


ALTER TABLE public.polls_comments OWNER TO postgres;

--
-- Name: polls_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_comments_id_seq OWNER TO postgres;

--
-- Name: polls_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_comments_id_seq OWNED BY public.polls_comments.id;


--
-- Name: polls_issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls_issues (
    id integer NOT NULL,
    theid character varying(15) NOT NULL,
    issue_name character varying(300) NOT NULL,
    created_by character varying(90) NOT NULL,
    at timestamp with time zone NOT NULL,
    text character varying(3000) NOT NULL,
    priority character varying(120) NOT NULL,
    assignto character varying(300) NOT NULL,
    "isIssueSolved" boolean NOT NULL,
    project_it_belongs_to_id integer NOT NULL
);


ALTER TABLE public.polls_issues OWNER TO postgres;

--
-- Name: polls_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_issues_id_seq OWNER TO postgres;

--
-- Name: polls_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_issues_id_seq OWNED BY public.polls_issues.id;


--
-- Name: polls_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls_notifications (
    id integer NOT NULL,
    "notificationID" character varying(20) NOT NULL,
    "toUser" character varying(90) NOT NULL,
    thetext character varying(3000) NOT NULL,
    "theLink" character varying(3000) NOT NULL,
    "isSeen" boolean NOT NULL,
    "IssueReference_id" integer NOT NULL
);


ALTER TABLE public.polls_notifications OWNER TO postgres;

--
-- Name: polls_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_notifications_id_seq OWNER TO postgres;

--
-- Name: polls_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_notifications_id_seq OWNED BY public.polls_notifications.id;


--
-- Name: polls_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls_profile (
    id integer NOT NULL,
    "isModerator" boolean NOT NULL,
    "theUser_id" integer NOT NULL
);


ALTER TABLE public.polls_profile OWNER TO postgres;

--
-- Name: polls_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_profile_id_seq OWNER TO postgres;

--
-- Name: polls_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_profile_id_seq OWNED BY public.polls_profile.id;


--
-- Name: polls_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls_projects (
    id integer NOT NULL,
    theid character varying(15) NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.polls_projects OWNER TO postgres;

--
-- Name: polls_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_projects_id_seq OWNER TO postgres;

--
-- Name: polls_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_projects_id_seq OWNED BY public.polls_projects.id;


--
-- Name: polls_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polls_question (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE public.polls_question OWNER TO postgres;

--
-- Name: polls_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.polls_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polls_question_id_seq OWNER TO postgres;

--
-- Name: polls_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.polls_question_id_seq OWNED BY public.polls_question.id;


--
-- Name: registration_myuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_myuser (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    theid character varying(15) NOT NULL,
    username character varying(60) NOT NULL
);


ALTER TABLE public.registration_myuser OWNER TO postgres;

--
-- Name: registration_myuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_myuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_myuser_id_seq OWNER TO postgres;

--
-- Name: registration_myuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_myuser_id_seq OWNED BY public.registration_myuser.id;


--
-- Name: api_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_comments ALTER COLUMN id SET DEFAULT nextval('public.api_comments_id_seq'::regclass);


--
-- Name: api_issues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_issues ALTER COLUMN id SET DEFAULT nextval('public.api_issues_id_seq'::regclass);


--
-- Name: api_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_notifications ALTER COLUMN id SET DEFAULT nextval('public.api_notifications_id_seq'::regclass);


--
-- Name: api_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_profile ALTER COLUMN id SET DEFAULT nextval('public.api_profile_id_seq'::regclass);


--
-- Name: api_projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_projects ALTER COLUMN id SET DEFAULT nextval('public.api_projects_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: polls_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_comments ALTER COLUMN id SET DEFAULT nextval('public.polls_comments_id_seq'::regclass);


--
-- Name: polls_issues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_issues ALTER COLUMN id SET DEFAULT nextval('public.polls_issues_id_seq'::regclass);


--
-- Name: polls_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_notifications ALTER COLUMN id SET DEFAULT nextval('public.polls_notifications_id_seq'::regclass);


--
-- Name: polls_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_profile ALTER COLUMN id SET DEFAULT nextval('public.polls_profile_id_seq'::regclass);


--
-- Name: polls_projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_projects ALTER COLUMN id SET DEFAULT nextval('public.polls_projects_id_seq'::regclass);


--
-- Name: polls_question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_question ALTER COLUMN id SET DEFAULT nextval('public.polls_question_id_seq'::regclass);


--
-- Name: registration_myuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_myuser ALTER COLUMN id SET DEFAULT nextval('public.registration_myuser_id_seq'::regclass);


--
-- Data for Name: api_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_comments (id, "commentId", comment, created_by, at, "isThisCommentSolution", "theIssue_id") FROM stdin;
1	18560500865109472105	i can help you with that	admin	2021-09-08 23:06:56.681511+01	f	1
\.


--
-- Data for Name: api_issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_issues (id, theid, issue_name, created_by, at, text, priority, assignto, "isIssueSolved", project_it_belongs_to_id) FROM stdin;
1	780335687829304	ddddddd	admin	2021-09-08 22:56:30.025436+01	dwwwwwww	high	BBBBBBBBB	f	1
2	785291703018263	i'm facing an issue	admin	2021-09-08 22:57:46.399634+01	this is how to reproduce it	medium	reda	f	1
3	668999267230444	i'm still facing the issue	admin	2021-09-08 22:58:15.161786+01	help	low	reda	f	1
4	968845372731383	this is urgent	admin	2021-09-08 22:58:45.438631+01	please help	critical	reda	f	1
\.


--
-- Data for Name: api_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_notifications (id, "notificationID", "toUser", thetext, "theLink", "isSeen", "IssueReference_id") FROM stdin;
\.


--
-- Data for Name: api_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_profile (id, "isModerator", "theUser_id") FROM stdin;
1	f	25
2	t	1
3	f	2
\.


--
-- Data for Name: api_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_projects (id, theid, name) FROM stdin;
1	180236296816932	BugTracker
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add question	7	add_question
26	Can change question	7	change_question
27	Can delete question	7	delete_question
28	Can view question	7	view_question
29	Can add choice	8	add_choice
30	Can change choice	8	change_choice
31	Can delete choice	8	delete_choice
32	Can view choice	8	view_choice
33	Can add issues	9	add_issues
34	Can change issues	9	change_issues
35	Can delete issues	9	delete_issues
36	Can view issues	9	view_issues
37	Can add comments	10	add_comments
38	Can change comments	10	change_comments
39	Can delete comments	10	delete_comments
40	Can view comments	10	view_comments
41	Can add my user	11	add_myuser
42	Can change my user	11	change_myuser
43	Can delete my user	11	delete_myuser
44	Can view my user	11	view_myuser
45	Can add profile	12	add_profile
46	Can change profile	12	change_profile
47	Can delete profile	12	delete_profile
48	Can view profile	12	view_profile
49	Can add notifications	13	add_notifications
50	Can change notifications	13	change_notifications
51	Can delete notifications	13	delete_notifications
52	Can view notifications	13	view_notifications
53	Can add Token	14	add_token
54	Can change Token	14	change_token
55	Can delete Token	14	delete_token
56	Can view Token	14	view_token
57	Can add token	15	add_tokenproxy
58	Can change token	15	change_tokenproxy
59	Can delete token	15	delete_tokenproxy
60	Can view token	15	view_tokenproxy
61	Can add projects	16	add_projects
62	Can change projects	16	change_projects
63	Can delete projects	16	delete_projects
64	Can view projects	16	view_projects
65	Can add profile	17	add_profile
66	Can change profile	17	change_profile
67	Can delete profile	17	delete_profile
68	Can view profile	17	view_profile
69	Can add question	18	add_question
70	Can change question	18	change_question
71	Can delete question	18	delete_question
72	Can view question	18	view_question
73	Can add profile	19	add_profile
74	Can change profile	19	change_profile
75	Can delete profile	19	delete_profile
76	Can view profile	19	view_profile
77	Can add comments	20	add_comments
78	Can change comments	20	change_comments
79	Can delete comments	20	delete_comments
80	Can view comments	20	view_comments
81	Can add notifications	21	add_notifications
82	Can change notifications	21	change_notifications
83	Can delete notifications	21	delete_notifications
84	Can view notifications	21	view_notifications
85	Can add issues	22	add_issues
86	Can change issues	22	change_issues
87	Can delete issues	22	delete_issues
88	Can view issues	22	view_issues
89	Can add projects	23	add_projects
90	Can change projects	23	change_projects
91	Can delete projects	23	delete_projects
92	Can view projects	23	view_projects
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$eNYAYLvueXBfV0pphleApE$6AKevz8RQtlfxAZ7Y+rK/UcmCs8Ak5Gp1u7yrBd17ZM=	2021-05-24 05:40:13.09+01	f	reda			eowjknf@gmail.com	f	t	2021-04-26 04:16:35.926+00
3	pbkdf2_sha256$260000$dcMPtHMlLlQRXsE558ub5K$cELep4ak6s5EKJp3ee78J47Add+rWRA6KmordhfLRx4=	2021-04-27 02:32:50.427+00	f	HHHHHHHHHH			rweojrn@gmail.com	f	t	2021-04-27 02:32:49.695+00
4	pbkdf2_sha256$260000$mEo2OCx5OONdI1uwyqF1jF$wb/UsBFoSLMo71V0ejSJnqtHjhhQLqHVodEr+NPz3nY=	2021-04-27 02:33:13.694+00	f	BBBBBBBBB			KJWNEFI@gmail.com	f	t	2021-04-27 02:33:12.957+00
5	pbkdf2_sha256$260000$CuIvyPsovBzWmaJGlShFcz$EBMF+Wm4y5+cjqk+3t+CS8uu3u8UmW0ZPlpJVY9tOw4=	2021-04-27 02:36:17.065+00	f	AAAAAAAA			jergb@gmail.com	f	t	2021-04-27 02:36:16.276+00
6	pbkdf2_sha256$260000$MWP8U3D54sGtXR4kZba6oh$ESkPT0XsAYHJOhq5l72ebiLQOgw2BstXR9bTBlhocOA=	2021-04-27 02:37:11.685+00	f	ZZZZZZ			rwewei@gmail.com	f	t	2021-04-27 02:37:10.782+00
7	pbkdf2_sha256$260000$5qPg8iet2MgxvLEIX70Kvv$T9aFm/wDmE842Y0D3F8tRHv3QvVnBj15omxW547jj/c=	2021-04-27 03:00:38.159+00	f	cccccc			knmer@gmail.com	f	t	2021-04-27 03:00:37.393+00
8	pbkdf2_sha256$260000$2HHxoqyudNDbieY0okDuKP$5nxgWi1GudVHWwgg4zqIAwklpgVEzuLAekJJppaXYEM=	2021-04-27 03:01:25.143+00	f	cdcccccc			kimw@gmail.com	f	t	2021-04-27 03:01:24.389+00
12	pbkdf2_sha256$260000$an5jUEfhKjxOpyo98boIyO$6afTIitcxL5WgHB8ItEhaSeN4YzMZNgPNP50VQgB024=	\N	f	mynameisREDA				f	t	2021-06-30 19:58:52.036+01
13	pbkdf2_sha256$260000$jQEJzdW8h87eGoDTwkaH6X$tIILJL7ic6gNNvJ8xaLWiwlmAZdBEKYZ8mdZbUrvanU=	\N	f	owoowowowooww				f	t	2021-06-30 20:01:35.118+01
14	pbkdf2_sha256$260000$4umsZuMiugHQ4RaQP4Bacx$Af8Kc+TKb23hxVICZtgKSjRCPX3Q0uE05FHkyn861ZE=	\N	f	theplayer1				f	t	2021-06-30 22:23:39.472+01
15	pbkdf2_sha256$260000$6My4OW8UkbbFR9wSaX1FLF$8J9aIUVaXOllplL5FmMeeONFJbvs0dV5jab9em3Tz8I=	\N	f	theplayer2				f	t	2021-06-30 22:24:39.939+01
16	pbkdf2_sha256$260000$GbA5pbdG47U8kf7fQMA8z1$TcLcdP1RT5iFKeF5tCiNOpo4EVGHBBU7rmBOSCOFNi4=	\N	f	theplayer3				f	t	2021-06-30 22:26:03.083+01
17	pbkdf2_sha256$260000$OVBMjzQDEA7ViEOCerBsK0$60P7TL0CTvjgP/Z2WsvFaACHjS3PhZfN2SDDLyJZZHc=	\N	f	theplayer4				f	t	2021-06-30 22:26:51.324+01
18	pbkdf2_sha256$260000$0rNv94mAY5jJt7B4QBnO52$KrKHwuhVmjZX11tG4u/TQDprz5zUr6B0yIUOgFSGKQM=	\N	f	theplayer5				f	t	2021-06-30 22:27:22.226+01
19	pbkdf2_sha256$260000$gAgu64MnJfHoAi7eey9AG2$aP4nMocb6rsCSYaoZLCbUTeldQgOcCTT58jOj7JOoDU=	\N	f	testing123				f	t	2021-08-31 15:17:34.682548+01
20	pbkdf2_sha256$260000$xIz7DyR9DtwEXTpsjyTrXp$Mm/PDX4o9trscUvJVTVQZMyL8KHvO4TgTzd8zG3lkKo=	\N	f	testingemoji				f	t	2021-08-31 15:50:37.62535+01
21	pbkdf2_sha256$260000$ObftELwyUI150uIBzGBwnk$6i4xSB0d0cJzc0b2uia6TMf0u9I0SZpHI6oRag3SwUo=	\N	f	testingemoji123				f	t	2021-08-31 15:51:59.831789+01
22	pbkdf2_sha256$260000$Rhr4NxvjIyrWHkPdjU8ZbC$tkaQpQSqQK1LnSEMB24U5tvuvgCGonEgJYHS6EBW1uY=	\N	f	yooo				f	t	2021-08-31 15:52:18.755692+01
23	pbkdf2_sha256$260000$qTM7Pu4D8xzZkf8hUqQisQ$Nx7PhnWEt5JuZ+kW6S2aY3H97o0UvsUTf7qPzq5C+LE=	\N	f	weqweqw				f	t	2021-08-31 17:02:02.26343+01
24	pbkdf2_sha256$260000$NtEboxZ2JSSBW19wLnnI2t$HkR12m9wSMf2QHP934dnFJOl2ulYzxq1Z/gN91WvYYg=	\N	f	mynameisreda				f	t	2021-09-06 23:06:22.90079+01
25	pbkdf2_sha256$260000$5zwgarFHQ39zyhnegoQaoR$/sfzjqIMiE5JqQB63thms5HKQPJKnbaBsUGkRfBgHTA=	\N	t	lenovos30				t	t	2021-09-08 21:32:48.821824+01
1	pbkdf2_sha256$260000$8dgTBDp879V0QOkETFsYbZ$tdloytgurxVDHe5UxbNhh5dJ1ToITgV32GX8Q5/0WLg=	2021-09-08 21:33:19.209683+01	t	admin			riewnr@gmail.com	t	t	2021-04-26 02:47:26.407+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
a5d09461bd884809b2a8385f3767fdd9290d9070	2021-05-24 05:55:22.272+01	1
fed6617b64574f7b3eb0ba94dd7c92680660786d	2021-05-24 05:53:48.155+01	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-04-28 10:00:21.401+00	19	New Comment from admin !	3		13	1
2	2021-04-28 10:00:21.528+00	18	New Comment from admin !	3		13	1
3	2021-04-28 10:00:21.645+00	17	New Comment from admin !	3		13	1
4	2021-04-28 10:00:21.753+00	16	New Comment from admin !	3		13	1
5	2021-04-28 10:00:21.878+00	15	New Comment from admin !	3		13	1
6	2021-04-28 10:00:22.011+00	14	New Comment from admin !	3		13	1
7	2021-04-28 10:00:22.136+00	13	New Comment from admin !	3		13	1
8	2021-04-28 10:00:22.252+00	12	You have a new assignement from admin !	3		13	1
9	2021-04-28 10:00:22.402+00	11	You have a new assignement from cdcccccc !	3		13	1
10	2021-04-28 10:00:22.569+00	10	New Comment from admin !	3		13	1
11	2021-04-28 10:00:22.685+00	9	New Comment from admin !	3		13	1
12	2021-04-28 10:00:22.902+00	8	You have a new assignement from reda !	3		13	1
13	2021-04-28 10:00:23.085+00	7	You have a new assignement from reda !	3		13	1
14	2021-04-28 10:00:23.268+00	6	You have a new assignement from admin !	3		13	1
15	2021-04-28 10:00:23.443+00	5	You have a new assignement from admin !	3		13	1
16	2021-04-28 10:00:23.609+00	4	You have a new assignement from admin !	3		13	1
17	2021-04-28 10:00:23.801+00	3	You have a new assignement from reda !	3		13	1
18	2021-04-28 10:00:23.984+00	2	You have a new assignement from reda !	3		13	1
19	2021-04-28 10:00:24.159+00	1	You have a new assignement from reda !	3		13	1
20	2021-04-28 13:53:20.96+00	25	You have a new assignement from admin !	3		13	1
21	2021-04-28 13:53:21.084+00	24	You have a new assignement from admin !	3		13	1
22	2021-04-28 13:53:21.192+00	23	You have a new assignement from admin !	3		13	1
23	2021-04-28 13:53:21.31+00	22	You have a new assignement from admin !	3		13	1
24	2021-04-28 13:53:21.425+00	21	New Comment from reda !	3		13	1
25	2021-04-28 13:53:21.559+00	20	You have a new assignement from admin !	3		13	1
26	2021-05-29 15:49:33.285+01	1	BROwwww	1	[{"added": {}}]	16	1
27	2021-06-13 04:33:14.512+01	1	BROwwww	2	[{"changed": {"fields": ["Theid"]}}]	16	1
28	2021-06-13 04:33:14.729+01	1	BROwwww	2	[]	16	1
29	2021-06-30 19:51:06.65+01	9	mynameisREDA	3		4	1
30	2021-06-30 19:57:18.326+01	10	mynameisREDA	3		4	1
31	2021-06-30 19:58:36.051+01	11	mynameisREDA	3		4	1
32	2021-09-01 16:07:07.837045+01	1	reda Profile	2	[{"changed": {"fields": ["IsModerator"]}}]	12	1
33	2021-09-06 18:29:47.272459+01	2	admin Profile	1	[{"added": {}}]	17	1
34	2021-09-06 18:29:52.598763+01	2	admin Profile	3		17	1
35	2021-09-06 18:29:57.394038+01	3	admin Profile	1	[{"added": {}}]	17	1
36	2021-09-06 18:40:34.648438+01	4	reda Profile	1	[{"added": {}}]	17	1
37	2021-09-08 21:47:27.680425+01	2	admin Profile	1	[{"added": {}}]	19	1
38	2021-09-08 23:33:25.286238+01	3	reda Profile	1	[{"added": {}}]	19	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	polls	question
8	polls	choice
9	polls	issues
10	polls	comments
11	registration	myuser
12	registration	profile
13	polls	notifications
14	authtoken	token
15	authtoken	tokenproxy
16	polls	projects
17	polls	profile
18	api	question
19	api	profile
20	api	comments
21	api	notifications
22	api	issues
23	api	projects
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-28 12:25:19.137031+01
2	auth	0001_initial	2021-08-28 12:25:19.981138+01
3	admin	0001_initial	2021-08-28 12:25:20.139158+01
4	admin	0002_logentry_remove_auto_add	2021-08-28 12:25:20.15466+01
5	admin	0003_logentry_add_action_flag_choices	2021-08-28 12:25:20.170662+01
6	contenttypes	0002_remove_content_type_name	2021-08-28 12:25:20.196666+01
7	auth	0002_alter_permission_name_max_length	2021-08-28 12:25:20.212168+01
8	auth	0003_alter_user_email_max_length	2021-08-28 12:25:20.22867+01
9	auth	0004_alter_user_username_opts	2021-08-28 12:25:20.246172+01
10	auth	0005_alter_user_last_login_null	2021-08-28 12:25:20.261674+01
11	auth	0006_require_contenttypes_0002	2021-08-28 12:25:20.272175+01
12	auth	0007_alter_validators_add_error_messages	2021-08-28 12:25:20.287677+01
13	auth	0008_alter_user_username_max_length	2021-08-28 12:25:20.347185+01
14	auth	0009_alter_user_last_name_max_length	2021-08-28 12:25:20.370188+01
15	auth	0010_alter_group_name_max_length	2021-08-28 12:25:20.38769+01
16	auth	0011_update_proxy_permissions	2021-08-28 12:25:20.403192+01
17	auth	0012_alter_user_first_name_max_length	2021-08-28 12:25:20.420194+01
18	authtoken	0001_initial	2021-08-28 12:25:20.538709+01
19	authtoken	0002_auto_20160226_1747	2021-08-28 12:25:20.572213+01
20	authtoken	0003_tokenproxy	2021-08-28 12:25:20.581214+01
21	polls	0001_initial	2021-08-28 12:25:20.965263+01
22	registration	0001_initial	2021-08-28 12:25:21.012269+01
23	registration	0002_myuser_theid	2021-08-28 12:25:21.034272+01
24	registration	0003_myuser_username	2021-08-28 12:25:21.042273+01
25	registration	0004_profile	2021-08-28 12:25:21.139785+01
26	registration	0005_alter_profile_theuser	2021-08-28 12:25:21.164289+01
27	registration	0006_alter_profile_theuser	2021-08-28 12:25:21.183291+01
28	registration	0007_alter_profile_gender	2021-08-28 12:25:21.364314+01
29	sessions	0001_initial	2021-08-28 12:25:21.530835+01
30	registration	0008_alter_profile_theuser	2021-08-31 17:01:26.164346+01
31	registration	0009_profile_ismoderator	2021-08-31 17:05:19.657996+01
32	polls	0002_profile	2021-09-06 18:27:16.554664+01
33	registration	0010_delete_profile	2021-09-06 18:27:16.576666+01
34	polls	0003_alter_profile_theuser	2021-09-06 18:28:29.455983+01
35	polls	0004_auto_20210906_1729	2021-09-06 18:29:36.497529+01
36	api	0001_initial	2021-09-08 21:21:21.549051+01
37	api	0002_delete_question	2021-09-08 21:37:07.01561+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
c7vbu4a6ok350l164p8i4xt5lf16yyzx	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1ltNFa:IvwPjHcuTnFbL79Ypbv-wi6JOrRJ3P5tCRHV4zYuaXs	2021-06-30 05:34:02.041+01
cu02tgsudq16o15c0545tjsit1c3u3o3	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1ln0DO:7wiR9itH5jiBTwPsIY-bRIgGFjEvuUOzR3Y4X1AtQqU	2021-06-12 15:45:26.508+01
hgj4s505nkwomljytgp4uift8gthxpbe	.eJxVjEEOwiAQRe_C2pApFAou3fcMzcwwSNW0SWlXxrsbki50-997_60mPPYyHVW2aU7qqoy6_G6E_JSlgfTA5b5qXpd9m0k3RZ-06nFN8rqd7t9BwVpa7UwYoLdWIJMDwdiRCeRzx1k6z5YYEot3FuLAGACjQQ7URwIkZvX5AurwOKc:1ll2Nx:gUTqpglT3dZ7S6wCSxHnPaBS1TNWy1kIy00E0Vv8Zhs	2021-06-07 05:40:13.183+01
mes47lnq81q6ilycn1uc6sh8oiafopqr	.eJxVjEEOwiAQRe_C2pApFAou3fcMzcwwSNW0SWlXxrsbki50-997_60mPPYyHVW2aU7qqoy6_G6E_JSlgfTA5b5qXpd9m0k3RZ-06nFN8rqd7t9BwVpa7UwYoLdWIJMDwdiRCeRzx1k6z5YYEot3FuLAGACjQQ7URwIkZvX5AurwOKc:1lawI9:xdQcyvVdKPiUof5Bq_v5mPzL1Doqc02J0jq-uOYDI-Y	2021-05-10 08:08:29.618+00
nxoj02c2vr34k07c9fkt48jn1kzlkxs8	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1lyfBp:0nxf3CA2JGVqrof69QnACDux3ktV-eJEWztNlZcvXbg	2021-07-14 19:44:01.923+01
oe5ijga2d2l17mjl7d629d239yavbqi7	.eJxVjEEOwiAQRe_C2pApFAou3fcMzcwwSNW0SWlXxrsbki50-997_60mPPYyHVW2aU7qqoy6_G6E_JSlgfTA5b5qXpd9m0k3RZ-06nFN8rqd7t9BwVpa7UwYoLdWIJMDwdiRCeRzx1k6z5YYEot3FuLAGACjQQ7URwIkZvX5AurwOKc:1lfOpV:wOAQICmT5cYY3DpU-AKKWp8-1KX83n7npYUr6UFgZpI	2021-05-22 16:25:21.697+01
ohbsmcbpvcbn3amur71t0zglv8tjczq1	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1lbjXI:3suVpFFaRqsL7Nk3j7PxhHk7A17AGURk52Fu3F5zxmM	2021-05-12 12:43:24.379+00
taoz2e1yq5evnxq5x23hj9jnwwxalh8f	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1lz5D7:EX7zNZXn-3dq5MXpnvC7SpBzxhCUjCcv6Vp-sP5RgpQ	2021-07-15 23:31:05.701+01
tyrhz35uhxlnezcmwdphdfbgecy2x85b	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1lkFkO:x1ydloiSunme_ZttzCYdXrwZm_TA2su4tamY0xYsV1Y	2021-06-05 01:44:08.388+01
ugablcte9ao3dwkydrrq293efahs1nxk	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1ll2OU:IjFmyrfGf-bndSkCbJBxPxUJzJlwMESFdpEqzbEEf2M	2021-06-07 05:40:46.107+01
x4arhxnu33pegzvdkwsiias6m4pcvv23	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1lxKPb:5uTDedu3W-uwkZN9rVBWdD1T9AODOWxLL25wlZcwvnI	2021-07-11 03:20:43.142+01
s88deznfd8wh7pkc7k78l0etf25hlmbs	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1mL4UE:uz3Bdw3J3vYtEPtvjkB1okW5Eg4T1eE1zF8qU2Kr6j8	2021-09-14 15:11:38.179778+01
gn2fe8ckh01tgs2ccfsn721fl0e824rs	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1mLRpI:uKpjsvd9ZkwDxzfhrU0Nq5UbkpVtkXPYmUAU2fZtXYI	2021-09-15 16:06:56.408094+01
iocelmyro26z4wwgp0k7hkv1oilyhdvd	.eJxVjMsOwiAQRf-FtSEOUx516b7fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxIXAeL0uwWKD647SHeqtyZjq-syB7kr8qBdTi3x83q4fweFevnWI7N2kFQKPIwWjcnOKBcpEhjWNGBGpZNGdc5oGQGCA8hMbMjGaKx4fwDmkDgH:1mNHUn:wcLCiW0X4hfUxwW6LmqsN1r5Ue7n_zUIseYqOWhzI8s	2021-09-20 17:29:21.076803+01
dpfr3619ajtn966ynjdwhkez7382v0b4	.eJxVjDEOAiEQRe9CbQjMAoqlvWcgAzPIqoFk2a2Md1eSLbT9773_EgG3tYSt8xJmEmehxeF3i5geXAegO9Zbk6nVdZmjHIrcaZfXRvy87O7fQcFeRs1EHrTOKbI6RUuOgKKaJsDsvdaUMhzRWJUT5a-mnHdskMGAMtZp8f4ADho4Sg:1mO4Fz:1WyoASdkElAdd1Dx-4_Pi-fMvvTgcptXVHHGaeiJloE	2021-09-22 21:33:19.218184+01
\.


--
-- Data for Name: polls_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls_comments (id, "commentId", comment, created_by, at, "isThisCommentSolution", "theIssue_id") FROM stdin;
4	12156053896809685289	 qwdqw	admin	2021-04-26 10:08:09.168+00	f	10
5	29758063097720634104	 qdwdqwd	admin	2021-04-26 10:08:37.28+00	f	10
8	43780409231597951505	 dwqdqwdq	admin	2021-04-26 10:11:12.024+00	t	9
9	85258883837072263353	 sure heres the help	admin	2021-04-28 08:05:46.654+00	t	12
17	43671029969616246944	 qwdqwdq	admin	2021-04-28 13:42:49.363+00	t	18
19	92967357522458306731	MYCOMENT	meiguess	2021-07-02 00:18:24.313+01	f	1
20	13223225013088952562	MYCOMENT	meiguess	2021-07-02 00:30:26.195+01	f	7
21	17652300634618801719	MYCOMENT	meiguess	2021-07-02 00:31:43.674+01	t	7
23	62352199439416708146	wwwwwwwwwwwwww	reda	2021-07-02 00:46:51.792+01	t	2
28	74545764699795848517	dhththththththththth	reda	2021-07-02 05:26:02.112+01	t	2
40	98388466933165355060	ferfrfrfrfffrfr	admin	2021-07-04 01:11:03.444+01	f	10
42	91815122193146110147	dwqdwdw	admin	2021-07-04 01:20:10.164+01	f	7
43	81407895781780904673	bro some issue is here	admin	2021-07-04 02:54:30.746+01	f	30
44	69005169889511774119	aaaaaaaaaaaaaaaaaaaaaa	admin	2021-07-18 22:55:58.561+01	f	10
45	85924925271244638193	yoo	admin	2021-07-20 23:16:49.945+01	f	10
46	79395738786641551786	yo	admin	2021-08-09 15:00:50.838+01	f	17
47	53055336653982383413	www	admin	2021-08-31 15:41:00.770098+01	f	10
6	97393344710328405374	 qwdwqd	admin	2021-04-26 10:09:23.042+00	t	10
48	35382017872495503314	yo	admin	2021-09-01 17:17:02.648719+01	f	29
\.


--
-- Data for Name: polls_issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls_issues (id, theid, issue_name, created_by, at, text, priority, assignto, "isIssueSolved", project_it_belongs_to_id) FROM stdin;
1	609223099803979	dwqd	admin	2021-04-26 03:20:07.532+00	qwdwqqqqq	low	admin	t	1
2	184761484773303	qwdqwdwqd	reda	2021-04-26 05:34:38.816+00	qwdqwdqwdqw	low	admin	t	1
4	122433924586837	hghhhhhhhhhhhhhhhhhhhhhh	reda	2021-04-26 05:34:55.032+00	hhhhhhhhhhhhhhhhhhhh	low	reda	t	1
7	536520826491658	qwdwqd	admin	2021-04-26 07:48:22.5+00	qwdqw	low	admin	t	1
8	849521565402800	qwdqwdwqdqw	admin	2021-04-26 07:49:20.23+00	qwdwqdwqd	low	admin	t	1
9	204263408922711	TESDT ISSUE BRO	reda	2021-04-26 08:08:48.6+00	qwdqwdqwd	low	admin	t	1
12	683102944040018	i have a problem	admin	2021-04-28 08:04:04.754+00	i dont know why but this things keeps happening pls elp	critical	reda	t	1
17	202660670128930	bvnghnghngh	admin	2021-04-28 13:41:02.023+00	nghnghnghn	low	admin	f	1
18	442185189225151	l,klil	admin	2021-04-28 13:41:34.683+00	iolioli	low	AAAAAAAA	t	1
19	807050383832726	uykyukyuk	admin	2021-04-28 14:04:35.629+00	yukuykyuk	low	admin	f	1
20	385608460525149	TESTINGAPI	ME	2021-04-28 14:27:47.266+00	YOOOOOOO	low	admin	t	1
21	361222457580961	YOOOOOOOOOOOO	admin	2021-05-24 05:41:09.519+01	BROOOOOOOOOOOO	high	reda	f	1
22	715108653160575	HHHHHHHHHHHHHHH	admin	2021-05-29 19:53:51.985+01	HHHHHHHHHHHHHHHHHHH	low	BBBBBBBBB	f	3
26	590970113367232	issueSHELL2222222222222	ME	2021-06-13 04:28:53.788+01	THIS IS A TEXT	Low	ME	f	1
27	677539120174755	aaaaadwdwdwdwdd	ME	2021-06-16 04:59:25.989+01	YOOOOOOO	Low	ME	f	3
29	508047338277355	THIS IS AN ISSUE MAAAAAAN	reda	2021-07-04 02:48:23.713+01	HEEEEEEEEEEEEEEELP MEEEEEEE	low	admin	f	4
30	410543360609373	WAAAAAAAAAAA SAAAAAAAAAAT HEEEEEEEEEELP	admin	2021-07-04 02:53:49.129+01	idk man just testing	medium	reda	f	4
31	455753291963901	dddddddddddd	admin	2021-08-28 13:49:29.274817+01	ddddddddddddd	low	owoowowowooww	f	4
10	503376941121916	TEST2222222q	reda	2021-04-26 08:09:14.243+00	qwdqwdqwdqwdq	low	admin	t	1
11	801797999520368	qdqdq	cdcccccc	2021-04-27 03:01:59.662+00	qdqdqq	low	AAAAAAAA	t	1
33	359693562412099	testing123	admin	2021-09-01 18:24:55.716933+01	wefkwejfw	low	ZZZZZZ	f	1
28	901058047253838	QQQQQQQQQQQQ	ME	2021-06-16 05:00:13.867+01	YOOOOOOO	low	ME	t	3
\.


--
-- Data for Name: polls_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls_notifications (id, "notificationID", "toUser", thetext, "theLink", "isSeen", "IssueReference_id") FROM stdin;
27	56408184547879762649	admin	You have a new assignement from reda !	/issue/385608460525149	t	20
28	28069767829763703159	reda	You have a new assignement from admin !	/issue/361222457580961	t	21
29	51180520363234106913	BBBBBBBBB	You have a new assignement from admin !	/issue/715108653160575	f	22
\.


--
-- Data for Name: polls_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls_profile (id, "isModerator", "theUser_id") FROM stdin;
3	t	1
4	f	2
5	f	24
\.


--
-- Data for Name: polls_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls_projects (id, theid, name) FROM stdin;
1	3333333	BROwwww
2	296173016117222	BRO
3	767371501558253	IWNJDUQWND
4	815889239347217	BugTracker
333		testing123456
5	272472651689070	whatisthis
6	334874553921413	YOO
7	823814870104752	wwwwwww
8	155519086696767	dddddddd
9	961555164685740	wwwwwwww
\.


--
-- Data for Name: polls_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polls_question (id, question_text, pub_date) FROM stdin;
\.


--
-- Data for Name: registration_myuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registration_myuser (id, name, lastname, theid, username) FROM stdin;
\.


--
-- Name: api_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_comments_id_seq', 1, true);


--
-- Name: api_issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_issues_id_seq', 4, true);


--
-- Name: api_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_notifications_id_seq', 1, false);


--
-- Name: api_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_profile_id_seq', 3, true);


--
-- Name: api_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_projects_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 25, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 38, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);


--
-- Name: polls_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_comments_id_seq', 48, true);


--
-- Name: polls_issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_issues_id_seq', 33, true);


--
-- Name: polls_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_notifications_id_seq', 29, true);


--
-- Name: polls_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_profile_id_seq', 5, true);


--
-- Name: polls_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_projects_id_seq', 9, true);


--
-- Name: polls_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polls_question_id_seq', 1, false);


--
-- Name: registration_myuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registration_myuser_id_seq', 1, false);


--
-- Name: api_comments api_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_comments
    ADD CONSTRAINT api_comments_pkey PRIMARY KEY (id);


--
-- Name: api_issues api_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_issues
    ADD CONSTRAINT api_issues_pkey PRIMARY KEY (id);


--
-- Name: api_notifications api_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_notifications
    ADD CONSTRAINT api_notifications_pkey PRIMARY KEY (id);


--
-- Name: api_profile api_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_profile
    ADD CONSTRAINT api_profile_pkey PRIMARY KEY (id);


--
-- Name: api_profile api_profile_theUser_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_profile
    ADD CONSTRAINT "api_profile_theUser_id_key" UNIQUE ("theUser_id");


--
-- Name: api_projects api_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_projects
    ADD CONSTRAINT api_projects_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: polls_comments polls_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_comments
    ADD CONSTRAINT polls_comments_pkey PRIMARY KEY (id);


--
-- Name: polls_issues polls_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_issues
    ADD CONSTRAINT polls_issues_pkey PRIMARY KEY (id);


--
-- Name: polls_notifications polls_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_notifications
    ADD CONSTRAINT polls_notifications_pkey PRIMARY KEY (id);


--
-- Name: polls_profile polls_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_profile
    ADD CONSTRAINT polls_profile_pkey PRIMARY KEY (id);


--
-- Name: polls_profile polls_profile_theUser_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_profile
    ADD CONSTRAINT "polls_profile_theUser_id_key" UNIQUE ("theUser_id");


--
-- Name: polls_projects polls_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_projects
    ADD CONSTRAINT polls_projects_pkey PRIMARY KEY (id);


--
-- Name: polls_question polls_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_question
    ADD CONSTRAINT polls_question_pkey PRIMARY KEY (id);


--
-- Name: registration_myuser registration_myuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_myuser
    ADD CONSTRAINT registration_myuser_pkey PRIMARY KEY (id);


--
-- Name: api_comments_theIssue_id_9c2b41b1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "api_comments_theIssue_id_9c2b41b1" ON public.api_comments USING btree ("theIssue_id");


--
-- Name: api_issues_project_it_belongs_to_id_5ded91c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_issues_project_it_belongs_to_id_5ded91c4 ON public.api_issues USING btree (project_it_belongs_to_id);


--
-- Name: api_notifications_IssueReference_id_ed937447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "api_notifications_IssueReference_id_ed937447" ON public.api_notifications USING btree ("IssueReference_id");


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: polls_comments_theIssue_id_3fa0ab7e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "polls_comments_theIssue_id_3fa0ab7e" ON public.polls_comments USING btree ("theIssue_id");


--
-- Name: polls_issues_project_it_belongs_to_id_89e9fe2a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX polls_issues_project_it_belongs_to_id_89e9fe2a ON public.polls_issues USING btree (project_it_belongs_to_id);


--
-- Name: polls_notifications_IssueReference_id_69f76597; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "polls_notifications_IssueReference_id_69f76597" ON public.polls_notifications USING btree ("IssueReference_id");


--
-- Name: api_comments api_comments_theIssue_id_9c2b41b1_fk_api_issues_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_comments
    ADD CONSTRAINT "api_comments_theIssue_id_9c2b41b1_fk_api_issues_id" FOREIGN KEY ("theIssue_id") REFERENCES public.api_issues(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_issues api_issues_project_it_belongs_to_id_5ded91c4_fk_api_projects_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_issues
    ADD CONSTRAINT api_issues_project_it_belongs_to_id_5ded91c4_fk_api_projects_id FOREIGN KEY (project_it_belongs_to_id) REFERENCES public.api_projects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_notifications api_notifications_IssueReference_id_ed937447_fk_api_issues_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_notifications
    ADD CONSTRAINT "api_notifications_IssueReference_id_ed937447_fk_api_issues_id" FOREIGN KEY ("IssueReference_id") REFERENCES public.api_issues(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_profile api_profile_theUser_id_7ec9b7ac_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_profile
    ADD CONSTRAINT "api_profile_theUser_id_7ec9b7ac_fk_auth_user_id" FOREIGN KEY ("theUser_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_comments polls_comments_theIssue_id_3fa0ab7e_fk_polls_issues_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_comments
    ADD CONSTRAINT "polls_comments_theIssue_id_3fa0ab7e_fk_polls_issues_id" FOREIGN KEY ("theIssue_id") REFERENCES public.polls_issues(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_issues polls_issues_project_it_belongs_t_89e9fe2a_fk_polls_pro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_issues
    ADD CONSTRAINT polls_issues_project_it_belongs_t_89e9fe2a_fk_polls_pro FOREIGN KEY (project_it_belongs_to_id) REFERENCES public.polls_projects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_notifications polls_notifications_IssueReference_id_69f76597_fk_polls_iss; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_notifications
    ADD CONSTRAINT "polls_notifications_IssueReference_id_69f76597_fk_polls_iss" FOREIGN KEY ("IssueReference_id") REFERENCES public.polls_issues(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_profile polls_profile_theUser_id_dd79625a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polls_profile
    ADD CONSTRAINT "polls_profile_theUser_id_dd79625a_fk_auth_user_id" FOREIGN KEY ("theUser_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

