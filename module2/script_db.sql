--
-- PostgreSQL database dump
--

\restrict 0xId9BJBbCJFn3xmNmruoqQptXwqnAfC0PRLfNEatPERfNL7mYFZRYjKR6ZIxWe

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.0

-- Started on 2026-06-15 21:40:40

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 36255)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    inn character varying(20),
    address character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    is_salesman boolean NOT NULL,
    is_buyer boolean NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 36254)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 219
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 234 (class 1259 OID 36371)
-- Name: customer_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_order (
    id integer NOT NULL,
    order_date date NOT NULL,
    customer_id integer NOT NULL,
    executor_name character varying(50) NOT NULL
);


ALTER TABLE public.customer_order OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 36370)
-- Name: customer_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_order_id_seq OWNER TO postgres;

--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 233
-- Name: customer_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_order_id_seq OWNED BY public.customer_order.id;


--
-- TOC entry 224 (class 1259 OID 36279)
-- Name: material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    unit character varying(5) NOT NULL
);


ALTER TABLE public.material OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 36278)
-- Name: material_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.material_id_seq OWNER TO postgres;

--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 223
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_id_seq OWNED BY public.material.id;


--
-- TOC entry 230 (class 1259 OID 36333)
-- Name: material_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_price (
    id integer NOT NULL,
    material_id integer NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.material_price OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 36332)
-- Name: material_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.material_price_id_seq OWNER TO postgres;

--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 229
-- Name: material_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_price_id_seq OWNED BY public.material_price.id;


--
-- TOC entry 236 (class 1259 OID 36387)
-- Name: order_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_line (
    id integer NOT NULL,
    custoner_order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.order_line OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 36386)
-- Name: order_line_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_line_id_seq OWNER TO postgres;

--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 235
-- Name: order_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_line_id_seq OWNED BY public.order_line.id;


--
-- TOC entry 222 (class 1259 OID 36269)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    unit character varying(5) NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 36268)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 226 (class 1259 OID 36289)
-- Name: production; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production (
    id integer NOT NULL,
    production_number character varying(20) NOT NULL,
    product_id integer NOT NULL,
    material_id integer NOT NULL,
    quantity integer NOT NULL,
    production_date date NOT NULL
);


ALTER TABLE public.production OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 36288)
-- Name: production_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.production_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.production_id_seq OWNER TO postgres;

--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 225
-- Name: production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_id_seq OWNED BY public.production.id;


--
-- TOC entry 232 (class 1259 OID 36350)
-- Name: production_material_usage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_material_usage (
    id integer NOT NULL,
    product_id integer NOT NULL,
    material_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.production_material_usage OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 36349)
-- Name: production_material_usage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.production_material_usage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.production_material_usage_id_seq OWNER TO postgres;

--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 231
-- Name: production_material_usage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_material_usage_id_seq OWNED BY public.production_material_usage.id;


--
-- TOC entry 228 (class 1259 OID 36312)
-- Name: specification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specification (
    id integer NOT NULL,
    product_id integer NOT NULL,
    material_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.specification OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 36311)
-- Name: specification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specification_id_seq OWNER TO postgres;

--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 227
-- Name: specification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specification_id_seq OWNED BY public.specification.id;


--
-- TOC entry 238 (class 1259 OID 36412)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(30) NOT NULL,
    password character varying(30) NOT NULL,
    role character varying(15) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 36411)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 237
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4855 (class 2604 OID 36258)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 4862 (class 2604 OID 36374)
-- Name: customer_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order ALTER COLUMN id SET DEFAULT nextval('public.customer_order_id_seq'::regclass);


--
-- TOC entry 4857 (class 2604 OID 36282)
-- Name: material id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material ALTER COLUMN id SET DEFAULT nextval('public.material_id_seq'::regclass);


--
-- TOC entry 4860 (class 2604 OID 36336)
-- Name: material_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_price ALTER COLUMN id SET DEFAULT nextval('public.material_price_id_seq'::regclass);


--
-- TOC entry 4863 (class 2604 OID 36390)
-- Name: order_line id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line ALTER COLUMN id SET DEFAULT nextval('public.order_line_id_seq'::regclass);


--
-- TOC entry 4856 (class 2604 OID 36272)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4858 (class 2604 OID 36292)
-- Name: production id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production ALTER COLUMN id SET DEFAULT nextval('public.production_id_seq'::regclass);


--
-- TOC entry 4861 (class 2604 OID 36353)
-- Name: production_material_usage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material_usage ALTER COLUMN id SET DEFAULT nextval('public.production_material_usage_id_seq'::regclass);


--
-- TOC entry 4859 (class 2604 OID 36315)
-- Name: specification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specification ALTER COLUMN id SET DEFAULT nextval('public.specification_id_seq'::regclass);


--
-- TOC entry 4864 (class 2604 OID 36415)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5043 (class 0 OID 36255)
-- Dependencies: 220
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer (id, name, inn, address, phone, is_salesman, is_buyer) VALUES (1, 'ООО Поставка', NULL, 'г.Пятигорск', '79198634592', true, true);
INSERT INTO public.customer (id, name, inn, address, phone, is_salesman, is_buyer) VALUES (2, 'ООО Кинотеатр Квант', '26320045123', 'г. Железноводск, ул. Мира, 123', '79884581555', true, false);
INSERT INTO public.customer (id, name, inn, address, phone, is_salesman, is_buyer) VALUES (8, 'ООО Новый JDTO', '26320045111', 'г. Железноводсу', '79884581555', true, false);
INSERT INTO public.customer (id, name, inn, address, phone, is_salesman, is_buyer) VALUES (3, 'ООО Ромашка', '4140784214', 'г. Омск, ул. Строителей, 294', '79882584546', false, true);
INSERT INTO public.customer (id, name, inn, address, phone, is_salesman, is_buyer) VALUES (9, 'ООО Ипподром', '5874045632', 'г. Уфа, ул. Набережная,  37', '79627486389', true, true);
INSERT INTO public.customer (id, name, inn, address, phone, is_salesman, is_buyer) VALUES (10, 'ООО Ассоль', '2629011278', 'г. Калуга, ул. Пушкина, 94', '79184572398', false, true);


--
-- TOC entry 5057 (class 0 OID 36371)
-- Dependencies: 234
-- Data for Name: customer_order; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5047 (class 0 OID 36279)
-- Dependencies: 224
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5053 (class 0 OID 36333)
-- Dependencies: 230
-- Data for Name: material_price; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5059 (class 0 OID 36387)
-- Dependencies: 236
-- Data for Name: order_line; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5045 (class 0 OID 36269)
-- Dependencies: 222
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5049 (class 0 OID 36289)
-- Dependencies: 226
-- Data for Name: production; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5055 (class 0 OID 36350)
-- Dependencies: 232
-- Data for Name: production_material_usage; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5051 (class 0 OID 36312)
-- Dependencies: 228
-- Data for Name: specification; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5061 (class 0 OID 36412)
-- Dependencies: 238
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, login, password, role, is_active) VALUES (1, 'admin', '123', 'admin', true);
INSERT INTO public.users (id, login, password, role, is_active) VALUES (2, 'user', '123', 'user', true);


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 219
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 233
-- Name: customer_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_order_id_seq', 1, false);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 223
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_id_seq', 1, false);


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 229
-- Name: material_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_price_id_seq', 1, false);


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 235
-- Name: order_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_line_id_seq', 1, false);


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 225
-- Name: production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_id_seq', 1, false);


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 231
-- Name: production_material_usage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_material_usage_id_seq', 1, false);


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 227
-- Name: specification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specification_id_seq', 1, false);


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 237
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4880 (class 2606 OID 36380)
-- Name: customer_order customer_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT customer_order_pkey PRIMARY KEY (id);


--
-- TOC entry 4866 (class 2606 OID 36267)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 4870 (class 2606 OID 36287)
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- TOC entry 4876 (class 2606 OID 36343)
-- Name: material_price material_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_price
    ADD CONSTRAINT material_price_pkey PRIMARY KEY (id);


--
-- TOC entry 4882 (class 2606 OID 36399)
-- Name: order_line order_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_line_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 36277)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4878 (class 2606 OID 36359)
-- Name: production_material_usage production_material_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material_usage
    ADD CONSTRAINT production_material_usage_pkey PRIMARY KEY (id);


--
-- TOC entry 4872 (class 2606 OID 36300)
-- Name: production production_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_pkey PRIMARY KEY (id);


--
-- TOC entry 4874 (class 2606 OID 36321)
-- Name: specification specification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specification
    ADD CONSTRAINT specification_pkey PRIMARY KEY (id);


--
-- TOC entry 4884 (class 2606 OID 36422)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4892 (class 2606 OID 36381)
-- Name: customer_order customer_order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT customer_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 4889 (class 2606 OID 36344)
-- Name: material_price material_price_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_price
    ADD CONSTRAINT material_price_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- TOC entry 4893 (class 2606 OID 36400)
-- Name: order_line order_line_custoner_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_line_custoner_order_id_fkey FOREIGN KEY (custoner_order_id) REFERENCES public.customer_order(id);


--
-- TOC entry 4894 (class 2606 OID 36405)
-- Name: order_line order_line_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_line_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 4885 (class 2606 OID 36306)
-- Name: production production_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- TOC entry 4890 (class 2606 OID 36365)
-- Name: production_material_usage production_material_usage_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material_usage
    ADD CONSTRAINT production_material_usage_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- TOC entry 4891 (class 2606 OID 36360)
-- Name: production_material_usage production_material_usage_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material_usage
    ADD CONSTRAINT production_material_usage_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 4886 (class 2606 OID 36301)
-- Name: production production_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 4887 (class 2606 OID 36327)
-- Name: specification specification_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specification
    ADD CONSTRAINT specification_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- TOC entry 4888 (class 2606 OID 36322)
-- Name: specification specification_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specification
    ADD CONSTRAINT specification_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


-- Completed on 2026-06-15 21:40:40

--
-- PostgreSQL database dump complete
--

\unrestrict 0xId9BJBbCJFn3xmNmruoqQptXwqnAfC0PRLfNEatPERfNL7mYFZRYjKR6ZIxWe

