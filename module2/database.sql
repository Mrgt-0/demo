--
-- PostgreSQL database dump
--

\restrict sFhrxZBhgXncB44C5Qu7yveIgsbgUrJFOi2z6L3xpxzWrXJLsfgRdBcpzTpdYH5

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.0

-- Started on 2026-06-14 23:15:43

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
-- TOC entry 220 (class 1259 OID 35894)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    inn character varying(20),
    address character varying(50) NOT NULL,
    phone character varying(15) NOT NULL,
    is_salesman boolean NOT NULL,
    is_buyer boolean NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 35893)
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
-- TOC entry 226 (class 1259 OID 35939)
-- Name: customer_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_order (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    order_date date NOT NULL,
    customer_id integer NOT NULL,
    executor_company character varying(50) NOT NULL
);


ALTER TABLE public.customer_order OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 35938)
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
-- Dependencies: 225
-- Name: customer_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_order_id_seq OWNED BY public.customer_order.id;


--
-- TOC entry 232 (class 1259 OID 35998)
-- Name: material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    unit character varying(10) NOT NULL
);


ALTER TABLE public.material OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 35997)
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
-- Dependencies: 231
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_id_seq OWNED BY public.material.id;


--
-- TOC entry 234 (class 1259 OID 36008)
-- Name: material_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_price (
    id integer NOT NULL,
    material_id integer NOT NULL,
    price numeric NOT NULL,
    effective_date date NOT NULL
);


ALTER TABLE public.material_price OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 36007)
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
-- Dependencies: 233
-- Name: material_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_price_id_seq OWNED BY public.material_price.id;


--
-- TOC entry 228 (class 1259 OID 35956)
-- Name: order_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_product (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric NOT NULL,
    line_total integer NOT NULL
);


ALTER TABLE public.order_product OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 35955)
-- Name: order_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_product_id_seq OWNER TO postgres;

--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_product_id_seq OWNED BY public.order_product.id;


--
-- TOC entry 222 (class 1259 OID 35908)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    unit character varying(10) NOT NULL,
    base_price numeric NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 35921)
-- Name: product_cost_calculation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cost_calculation (
    id integer NOT NULL,
    product_id integer NOT NULL,
    calculationdate date NOT NULL,
    totalcost numeric NOT NULL
);


ALTER TABLE public.product_cost_calculation OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 35920)
-- Name: product_cost_calculation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cost_calculation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_cost_calculation_id_seq OWNER TO postgres;

--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_cost_calculation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cost_calculation_id_seq OWNED BY public.product_cost_calculation.id;


--
-- TOC entry 221 (class 1259 OID 35907)
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
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 238 (class 1259 OID 36047)
-- Name: product_specification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_specification (
    id integer NOT NULL,
    production_id integer NOT NULL,
    material_id integer NOT NULL,
    quantity_unit integer NOT NULL
);


ALTER TABLE public.product_specification OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 36046)
-- Name: product_specification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_specification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_specification_id_seq OWNER TO postgres;

--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 237
-- Name: product_specification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_specification_id_seq OWNED BY public.product_specification.id;


--
-- TOC entry 230 (class 1259 OID 35981)
-- Name: production; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production (
    id integer NOT NULL,
    production_code character varying(20) NOT NULL,
    production_date date NOT NULL,
    product_id integer NOT NULL,
    quantiry_produced integer NOT NULL
);


ALTER TABLE public.production OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 35980)
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
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 229
-- Name: production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_id_seq OWNED BY public.production.id;


--
-- TOC entry 236 (class 1259 OID 36026)
-- Name: production_material_usage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_material_usage (
    id integer NOT NULL,
    production_id integer NOT NULL,
    material_id integer NOT NULL,
    quantity_usage integer NOT NULL
);


ALTER TABLE public.production_material_usage OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 36025)
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
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 235
-- Name: production_material_usage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_material_usage_id_seq OWNED BY public.production_material_usage.id;


--
-- TOC entry 4855 (class 2604 OID 35897)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 4858 (class 2604 OID 35942)
-- Name: customer_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order ALTER COLUMN id SET DEFAULT nextval('public.customer_order_id_seq'::regclass);


--
-- TOC entry 4861 (class 2604 OID 36001)
-- Name: material id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material ALTER COLUMN id SET DEFAULT nextval('public.material_id_seq'::regclass);


--
-- TOC entry 4862 (class 2604 OID 36011)
-- Name: material_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_price ALTER COLUMN id SET DEFAULT nextval('public.material_price_id_seq'::regclass);


--
-- TOC entry 4859 (class 2604 OID 35959)
-- Name: order_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product ALTER COLUMN id SET DEFAULT nextval('public.order_product_id_seq'::regclass);


--
-- TOC entry 4856 (class 2604 OID 35911)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4857 (class 2604 OID 35924)
-- Name: product_cost_calculation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cost_calculation ALTER COLUMN id SET DEFAULT nextval('public.product_cost_calculation_id_seq'::regclass);


--
-- TOC entry 4864 (class 2604 OID 36050)
-- Name: product_specification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specification ALTER COLUMN id SET DEFAULT nextval('public.product_specification_id_seq'::regclass);


--
-- TOC entry 4860 (class 2604 OID 35984)
-- Name: production id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production ALTER COLUMN id SET DEFAULT nextval('public.production_id_seq'::regclass);


--
-- TOC entry 4863 (class 2604 OID 36029)
-- Name: production_material_usage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material_usage ALTER COLUMN id SET DEFAULT nextval('public.production_material_usage_id_seq'::regclass);


--
-- TOC entry 5043 (class 0 OID 35894)
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
-- TOC entry 5049 (class 0 OID 35939)
-- Dependencies: 226
-- Data for Name: customer_order; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5055 (class 0 OID 35998)
-- Dependencies: 232
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5057 (class 0 OID 36008)
-- Dependencies: 234
-- Data for Name: material_price; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5051 (class 0 OID 35956)
-- Dependencies: 228
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5045 (class 0 OID 35908)
-- Dependencies: 222
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5047 (class 0 OID 35921)
-- Dependencies: 224
-- Data for Name: product_cost_calculation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5061 (class 0 OID 36047)
-- Dependencies: 238
-- Data for Name: product_specification; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5053 (class 0 OID 35981)
-- Dependencies: 230
-- Data for Name: production; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5059 (class 0 OID 36026)
-- Dependencies: 236
-- Data for Name: production_material_usage; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 219
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 225
-- Name: customer_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_order_id_seq', 1, false);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 231
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_id_seq', 1, false);


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 233
-- Name: material_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_price_id_seq', 1, false);


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_product_id_seq', 1, false);


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_cost_calculation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cost_calculation_id_seq', 1, false);


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 237
-- Name: product_specification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_specification_id_seq', 1, false);


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 229
-- Name: production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_id_seq', 1, false);


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 235
-- Name: production_material_usage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_material_usage_id_seq', 1, false);


--
-- TOC entry 4872 (class 2606 OID 35949)
-- Name: customer_order customer_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT customer_order_pkey PRIMARY KEY (id);


--
-- TOC entry 4866 (class 2606 OID 35906)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 4878 (class 2606 OID 36006)
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- TOC entry 4880 (class 2606 OID 36019)
-- Name: material_price material_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_price
    ADD CONSTRAINT material_price_pkey PRIMARY KEY (id);


--
-- TOC entry 4874 (class 2606 OID 35969)
-- Name: order_product order_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (id);


--
-- TOC entry 4870 (class 2606 OID 35932)
-- Name: product_cost_calculation product_cost_calculation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cost_calculation
    ADD CONSTRAINT product_cost_calculation_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 35919)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4884 (class 2606 OID 36056)
-- Name: product_specification product_specification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specification
    ADD CONSTRAINT product_specification_pkey PRIMARY KEY (id);


--
-- TOC entry 4882 (class 2606 OID 36035)
-- Name: production_material_usage production_material_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material_usage
    ADD CONSTRAINT production_material_usage_pkey PRIMARY KEY (id);


--
-- TOC entry 4876 (class 2606 OID 35991)
-- Name: production production_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_pkey PRIMARY KEY (id);


--
-- TOC entry 4886 (class 2606 OID 35950)
-- Name: customer_order customer_order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order
    ADD CONSTRAINT customer_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 4890 (class 2606 OID 36020)
-- Name: material_price material_price_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_price
    ADD CONSTRAINT material_price_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- TOC entry 4887 (class 2606 OID 35970)
-- Name: order_product order_product_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.customer_order(id);


--
-- TOC entry 4888 (class 2606 OID 35975)
-- Name: order_product order_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 4885 (class 2606 OID 35933)
-- Name: product_cost_calculation product_cost_calculation_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cost_calculation
    ADD CONSTRAINT product_cost_calculation_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 4893 (class 2606 OID 36062)
-- Name: product_specification product_specification_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specification
    ADD CONSTRAINT product_specification_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- TOC entry 4894 (class 2606 OID 36057)
-- Name: product_specification product_specification_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_specification
    ADD CONSTRAINT product_specification_production_id_fkey FOREIGN KEY (production_id) REFERENCES public.production(id);


--
-- TOC entry 4891 (class 2606 OID 36041)
-- Name: production_material_usage production_material_usage_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material_usage
    ADD CONSTRAINT production_material_usage_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- TOC entry 4892 (class 2606 OID 36036)
-- Name: production_material_usage production_material_usage_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material_usage
    ADD CONSTRAINT production_material_usage_production_id_fkey FOREIGN KEY (production_id) REFERENCES public.production(id);


--
-- TOC entry 4889 (class 2606 OID 35992)
-- Name: production production_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


-- Completed on 2026-06-14 23:15:43

--
-- PostgreSQL database dump complete
--

\unrestrict sFhrxZBhgXncB44C5Qu7yveIgsbgUrJFOi2z6L3xpxzWrXJLsfgRdBcpzTpdYH5

