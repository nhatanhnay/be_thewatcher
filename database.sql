--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Ubuntu 17.0-1.pgdg22.04+1)
-- Dumped by pg_dump version 17.0 (Ubuntu 17.0-1.pgdg22.04+1)

-- Started on 2024-10-11 19:15:15 +07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 16478)
-- Name: orders_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_info (
    id_order integer NOT NULL,
    order_day timestamp without time zone NOT NULL,
    status character varying(50) DEFAULT 'pending'::character varying,
    phone character varying(15),
    email character varying(100),
    address character varying(255),
    name character varying(100)
);


ALTER TABLE public.orders_info OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16477)
-- Name: orders_info_id_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_info_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_info_id_order_seq OWNER TO postgres;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 217
-- Name: orders_info_id_order_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_info_id_order_seq OWNED BY public.orders_info.id_order;


--
-- TOC entry 222 (class 1259 OID 16526)
-- Name: orders_watch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_watch (
    id integer NOT NULL,
    id_order integer,
    id_watch integer,
    quantity integer NOT NULL
);


ALTER TABLE public.orders_watch OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16525)
-- Name: ordersss_watch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordersss_watch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordersss_watch_id_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 221
-- Name: ordersss_watch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordersss_watch_id_seq OWNED BY public.orders_watch.id;


--
-- TOC entry 220 (class 1259 OID 16490)
-- Name: watch_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.watch_details (
    id_watch integer NOT NULL,
    linkhref character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    rating numeric(2,1),
    urlimage character varying(255),
    numberrating integer DEFAULT 0,
    CONSTRAINT watch_details_rating_check CHECK (((rating >= (0)::numeric) AND (rating <= (5)::numeric)))
);


ALTER TABLE public.watch_details OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16489)
-- Name: watch_details_id_watch_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.watch_details_id_watch_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.watch_details_id_watch_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 219
-- Name: watch_details_id_watch_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.watch_details_id_watch_seq OWNED BY public.watch_details.id_watch;


--
-- TOC entry 3237 (class 2604 OID 16481)
-- Name: orders_info id_order; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_info ALTER COLUMN id_order SET DEFAULT nextval('public.orders_info_id_order_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16529)
-- Name: orders_watch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_watch ALTER COLUMN id SET DEFAULT nextval('public.ordersss_watch_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16493)
-- Name: watch_details id_watch; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watch_details ALTER COLUMN id_watch SET DEFAULT nextval('public.watch_details_id_watch_seq'::regclass);


--
-- TOC entry 3397 (class 0 OID 16478)
-- Dependencies: 218
-- Data for Name: orders_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_info (id_order, order_day, status, phone, email, address, name) FROM stdin;
2	2024-10-11 15:50:04.207378	pending	0868248919	lecongnhatanh@gmail.com	Xã Thạch Hoà, Huyện Thạch Thất, Thành phố Hà Nội, abc	Lê Công Nhật Anh
\.


--
-- TOC entry 3401 (class 0 OID 16526)
-- Dependencies: 222
-- Data for Name: orders_watch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_watch (id, id_order, id_watch, quantity) FROM stdin;
28	2	1	1
29	2	2	1
30	2	3	1
\.


--
-- TOC entry 3399 (class 0 OID 16490)
-- Dependencies: 220
-- Data for Name: watch_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.watch_details (id_watch, linkhref, name, price, rating, urlimage, numberrating) FROM stdin;
1	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Hull California Automatic	169.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5071-01-Q_c1aa0d6c-08bb-4da7-98e4-97432ec65da7_1220x_crop_center.png?v=1718168501	41
2	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Bradner Automatic	285.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5062-03-Q_1220x_crop_center.png?v=1717475571 	55
3	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-exuberant-orange-sp-5055-0f?_pos=16&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Fleuss Automatic	189.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5055-0F-Q_1220x_crop_center.png?v=1722311040 1220w	2
4	https://spinnaker-watches.com/collections/view-all/products/hull-cobalt-blue-sp-5071-02?_pos=15&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Hull California Automatic	169.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5071-02-Q_1220x_crop_center.png?v=1717476327 1220w	64
5	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-ash-grey-sp-5055-0h?_pos=11&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Fleuss Automatic	189.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5055-0H-Q_1220x_crop_center.png?v=1722310968 	0
6	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Hull California Automatic	169.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5071-01-Q_c1aa0d6c-08bb-4da7-98e4-97432ec65da7_1220x_crop_center.png?v=1718168501	41
7	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Bradner GMT Automatic	490.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5121-11-Q_1220x_crop_center.png?v=1709103207 	54
8	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-exuberant-orange-sp-5055-0f?_pos=16&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Croft Mid-Size Automatic	280.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5100-02-Q_1220x_crop_center.png?v=1684739231	41
9	https://spinnaker-watches.com/collections/view-all/products/hull-cobalt-blue-sp-5071-02?_pos=15&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Croft Mid-Size Automatic	179.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5100-01-Q_1220x_crop_center.png?v=1684739209 	57
10	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-ash-grey-sp-5055-0h?_pos=11&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Bradner Automatic	285.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5062-05-Q_1220x_crop_center.png?v=1717475637 	48
11	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-horizon-blue-sp-5055-0e?_pos=10&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Bradner Automatic	285.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5062-03-Q.png?v=1717475571	48
12	https://spinnaker-watches.com/collections/view-all/products/croft-mid-size-anchor-black-sp-5100-01?_pos=8&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Dumas GMT Automatic	550.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5119-55-Q_1220x_crop_center.png?v=1722485626	58
13	https://spinnaker-watches.com/collections/view-all/products/hull-pine-green-sp-5068-02?_pos=7&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Dumas GMT Automatic	550.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5119-66-Q_1220x_crop_center.png?v=1722485609 	58
14	https://spinnaker-watches.com/collections/view-all/products/wreck-oxidized-blue-sp-5089-02?_pos=5&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Dumas Automatic	400.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5081-AA-Q_1220x_crop_center.png?v=1684736920 	55
15	https://spinnaker-watches.com/collections/view-all/products/wreck-rust-brown-sp-5089-22?_pos=3&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Dumas GMT Automatic	550.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5119-66-Q_1220x_crop_center.png?v=1722485609 	59
16	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Dumas GMT Automatic	299.00	5.0	https://spinnaker-watches.com/cdn/shop/products/SP-5119-33-Q_1220x_crop_center.png?v=1681264110 	60
17	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Fleuss Automatic	189.00	4.5	https://spinnaker-watches.com/cdn/shop/files/SP-5055-0E-Q_1220x_crop_center.png?v=1722311095	48
18	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-exuberant-orange-sp-5055-0f?_pos=16&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Fleuss Automatic	189.00	4.5	https://spinnaker-watches.com/cdn/shop/files/SP-5055-0F-Q_1220x_crop_center.png?v=1722311040 	49
19	https://spinnaker-watches.com/collections/view-all/products/hull-cobalt-blue-sp-5071-02?_pos=15&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Fleuss Automatic	305.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5055-0D-Q_1220x_crop_center.png?v=1717481356 	55
20	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-ash-grey-sp-5055-0h?_pos=11&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Fleuss 40 Automatic - 145th Limited Edition	450.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5133-66-Q_1220x_crop_center.png?v=1725260650 	57
21	https://spinnaker-watches.com/collections/view-all/products/croft-pioneer-automatic-deep-blue-sp-5136-33?_pos=1&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Fleuss 40 Automatic - 145th Limited Edition	450.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5133-88-Q_1220x_crop_center.png?v=1725260614 	59
22	https://www.spinnaker-watches.com/products/fleuss-automatic-horizon-blue-sp-5055-0e?sca_ref=7058804.38lXpcVPEe	Fleuss Automatic	305.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5055-0B-Q_1220x_crop_center.png?v=1717481291	58
23	https://www.spinnaker-watches.com/products/croft-pioneer-automatic-jade-green-sp-5136-22?sca_ref=7058804.38lXpcVPEe	Hull Chronograph	149.00	4.5	https://spinnaker-watches.com/cdn/shop/files/SP-5068-02-Q_b0ec9a88-8b85-4bc2-af7b-ae6018a43f3b_1220x_crop_center.png?v=1717476045	48
24	https://www.spinnaker-watches.com/products/hull-pearl-diver-automatic-limited-edition-twilight-pearl-sp-5106-44?sca_ref=7058804.38lXpcVPEe	Hull Chronograph	235.00	4.5	https://spinnaker-watches.com/cdn/shop/files/SP-5068-01-Q_1220x_crop_center.png?v=1719388243 	55
25	https://www.spinnaker-watches.com/products/croft-automatic-sp-5058-0b?sca_ref=7058804.38lXpcVPEe	Hull Chronograph	235.00	4.5	https://spinnaker-watches.com/cdn/shop/files/SP-5068-07-Q_1220x_crop_center.png?v=1700539650	54
26	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Hull Chronograph	255.00	4.8	https://spinnaker-watches.com/cdn/shop/files/SP-5068-0A-Q_1220x_crop_center.png?v=1700539667 	55
27	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Hull Diver Automatic	375.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5088-03-Q_1220x_crop_center.png?v=1717482178 	58
28	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-exuberant-orange-sp-5055-0f?_pos=16&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Hull Diver Automatic	375.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5088-02-Q_1220x_crop_center.png?v=1717476802 	58
29	https://spinnaker-watches.com/collections/view-all/products/hull-cobalt-blue-sp-5071-02?_pos=15&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Hull Diver Automatic\n	445.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5088-33-Q_1220x_crop_center.png?v=1704249270 	59
30	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-ash-grey-sp-5055-0h?_pos=11&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Hull Diver Automatic	445.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5088-22-Q_1220x_crop_center.png?v=1684738030	59
31	https://www.spinnaker-watches.com/products/hull-cognac-brown-sp-5088-04?sca_ref=7058804.38lXpcVPEe	Croft Mid-Size Automatic	280.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5100-01-Q_1220x_crop_center.png?v=1684739209 	48
32	https://www.spinnaker-watches.com/products/hull-ombre-red-sp-5088-33?sca_ref=7058804.38lXpcVPEe	Croft Mid-Size Automatic	350.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5100-11-Q_1220x_crop_center.png?v=1684739223 	52
33	https://spinnaker-watches.com/products/croft-mid-size-anchor-black-sp-5100-01?sca_ref=7058804.38lXpcVPEe	Croft Mid-Size Automatic	350.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5100-22-Q_1220x_crop_center.png?v=1684739241 	58
34	https://www.spinnaker-watches.com/products/fleuss-oxblood-sp-5055-07?sca_ref=7058804.38lXpcVPEe	Cahill Mid-Size Automatic	350.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5075-22-Q-newlogo_dbaca837-f602-47b2-b232-1e089bccee5f_1220x_crop_center.png?v=1684736649	58
35	https://www.spinnaker-watches.com/products/bradner-emerald-green-sp-5062-33?sca_ref=7058804.38lXpcVPEe	Cahill Mid-Size Automatic	400.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5075-33-Q-newlogo_1220x_crop_center.png?v=1684736683	58
36	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Piccard Automatic	550.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5098-11-Q-KC_1220x_crop_center.png?v=1701684603 	58
37	https://spinnaker-watches.com/collections/view-all/products/hull-granite-black-sp-5071-01?_pos=14&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe&sca_ref=7058804.38lXpcVPEe	Piccard Automatic	550.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5098-99-Q_1220x_crop_center.png?v=1722486105	55
38	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-exuberant-orange-sp-5055-0f?_pos=16&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Piccard Automatic	550.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5098-55-Q_1220x_crop_center.png?v=1722486376 	55
39	https://spinnaker-watches.com/collections/view-all/products/hull-cobalt-blue-sp-5071-02?_pos=15&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe        	Piccard Skeleton Automatic	550.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5135-22-Q_1220x_crop_center.png?v=1716432476 	58
40	https://spinnaker-watches.com/collections/view-all/products/fleuss-automatic-ash-grey-sp-5055-0h?_pos=11&_fid=8df14cf4b&_ss=c&sca_ref=7058804.38lXpcVPEe	Piccard Skeleton Automatic	550.00	5.0	https://spinnaker-watches.com/cdn/shop/files/SP-5135-11-Q_1220x_crop_center.png?v=1716432283 	59
\.


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 217
-- Name: orders_info_id_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_info_id_order_seq', 2, true);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 221
-- Name: ordersss_watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordersss_watch_id_seq', 30, true);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 219
-- Name: watch_details_id_watch_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.watch_details_id_watch_seq', 40, true);


--
-- TOC entry 3244 (class 2606 OID 16483)
-- Name: orders_info orders_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_info
    ADD CONSTRAINT orders_info_pkey PRIMARY KEY (id_order);


--
-- TOC entry 3248 (class 2606 OID 16531)
-- Name: orders_watch ordersss_watch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_watch
    ADD CONSTRAINT ordersss_watch_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 16499)
-- Name: watch_details watch_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watch_details
    ADD CONSTRAINT watch_details_pkey PRIMARY KEY (id_watch);


--
-- TOC entry 3249 (class 2606 OID 16532)
-- Name: orders_watch ordersss_watch_id_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_watch
    ADD CONSTRAINT ordersss_watch_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders_info(id_order) ON DELETE CASCADE;


--
-- TOC entry 3250 (class 2606 OID 16537)
-- Name: orders_watch ordersss_watch_id_watch_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_watch
    ADD CONSTRAINT ordersss_watch_id_watch_fkey FOREIGN KEY (id_watch) REFERENCES public.watch_details(id_watch) ON DELETE CASCADE;


-- Completed on 2024-10-11 19:15:15 +07

--
-- PostgreSQL database dump complete
--

