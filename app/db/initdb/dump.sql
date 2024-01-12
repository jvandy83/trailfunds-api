--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg110+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg110+1)

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

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: FavoriteTrails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FavoriteTrails" (
    id text NOT NULL,
    user_id text NOT NULL
);


ALTER TABLE public."FavoriteTrails" OWNER TO postgres;

--
-- Name: Notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Notification" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    trail_id text NOT NULL
);


ALTER TABLE public."Notification" OWNER TO postgres;

--
-- Name: RecentTrails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RecentTrails" (
    id text NOT NULL,
    user_id text NOT NULL
);


ALTER TABLE public."RecentTrails" OWNER TO postgres;

--
-- Name: Trail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Trail" (
    id text NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    name text NOT NULL,
    recent_trail_id text,
    favorite_trail_id text,
    trail_org_id text NOT NULL
);


ALTER TABLE public."Trail" OWNER TO postgres;

--
-- Name: TrailOrg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TrailOrg" (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."TrailOrg" OWNER TO postgres;

--
-- Name: Trailbucks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Trailbucks" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    user_id text NOT NULL
);


ALTER TABLE public."Trailbucks" OWNER TO postgres;

--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transactions" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    amount integer NOT NULL,
    trail_id text NOT NULL,
    user_id text NOT NULL,
    trail_org_id text NOT NULL,
    confirmation_number text NOT NULL
);


ALTER TABLE public."Transactions" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    is_new boolean DEFAULT true NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Data for Name: FavoriteTrails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FavoriteTrails" (id, user_id) FROM stdin;
\.


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Notification" (id, created_at, updated_at, trail_id) FROM stdin;
\.


--
-- Data for Name: RecentTrails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RecentTrails" (id, user_id) FROM stdin;
\.


--
-- Data for Name: Trail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Trail" (id, latitude, longitude, name, recent_trail_id, favorite_trail_id, trail_org_id) FROM stdin;
clra170os0003qh0o9j7d4uo1	39.081311	-108.55511	Escalante Hall	\N	\N	clra170o60000qh0o4eufy4wk
clra170p20005qh0oras35bd4	39.77254061900148	-105.6836636555616	Bill Moore Lake/Empire Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170p60007qh0o1v5ktsbv	39.69431572808335	-105.7322963051044	Argentine Central Grade Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170p90009qh0oymrfikus	39.68276290914723	-105.7019484866507	Waldorf Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pc000bqh0o4hvpfq0j	39.7369853814434	-105.683919082555	Silver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pe000dqh0os5k54qdw	38.6784615838257	-108.9840624845919	Gateway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pi000fqh0o6sopn0t6	39.74310766117691	-105.4068068637245	Oxbow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pk000hqh0olkuropxk	39.1477048016563	-107.4357624230313	Clear Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pm000jqh0o4zgtrxop	38.97833606259678	-107.2766589611794	Raggeds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pp000lqh0ok2rud8dr	39.56694008536825	-105.0413373692384	Mary Carter Greenway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pr000nqh0ok1inag9j	39.61350151923438	-105.0258709197366	Mary Carter Greenway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pt000pqh0ouu50pyav	39.58725813545636	-104.9223924661118	Willow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pv000rqh0o96j55jh1	39.62127131444773	-104.9966064450342	Big Dry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170px000tqh0ovk6x6yuj	39.62379299401235	-105.0172526811506	Mary Carter Greenway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170pz000vqh0ofhchqovw	39.61615194026093	-104.9812284792531	Big Dry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170q1000xqh0onustya5m	39.59730159258433	-105.0219398525023	Lee Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170q3000zqh0o9bqb1ojo	39.9064328005329	-106.1047212495836	Williams Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170q50011qh0ovn6nm1t4	39.87393920888626	-106.0208507570588	Keyser Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170q70013qh0oyxoc0xb9	39.8538829044771	-106.0166514166605	Kinney Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170q90015qh0oa7eh6pdg	39.89355599704069	-105.9564506377812	Lake Evelyn Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qb0017qh0oxdi8w7ue	39.88853968899166	-105.9253174390785	Byers Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qe0019qh0of5s16kd3	38.61985809896257	-104.8883638267238	Aiken Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qg001bqh0o07lec82h	39.54561868239885	-107.3342153904774	Red Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qh001dqh0o6xm4w1h0	37.76200255196959	-107.4666337229632	Pole Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qj001fqh0oaeuzw1l1	39.55531063080257	-104.7879282027626	Cottonwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ql001hqh0oqw626hnb	39.51587470152513	-104.775193283991	Bar CCC Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qo001jqh0ovbma7eiv	39.47892332080166	-104.7710799740455	Stroh Ranch Soccer Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qq001lqh0oz4z450dl	39.50099249127597	-104.763203259879	McCabe Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qs001nqh0o3ictacyx	39.56307052453158	-104.7840513111155	Norton Farms Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qu001pqh0oogdqybyv	39.54047141360306	-104.774148041047	Baldwin Gulch? Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qw001rqh0opgrdchwp	39.5245295101497	-104.7776319626515	Railbender Skate Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170qy001tqh0oq4pmmccw	39.51686589017423	-104.7530049247495	Town Hall Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170r0001vqh0o0q1pftp7	39.49172947009057	-104.7339636162279	Tallman Meadow Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170r2001xqh0otryxt9lg	40.02903107800252	-105.0466311194063	Coal Creek Trailhead at Lawsc	\N	\N	clra170o60000qh0o4eufy4wk
clra170r4001zqh0o6orwonda	39.5515273697813	-107.3403070370002	Glenwood Springs Community Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170r50021qh0o287c68v8	39.47296179352794	-107.270484758657	CMC Park & Ride Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170r70023qh0o6g9xn7hk	38.47498550288521	-107.8851686659325	West Main Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170r90025qh0opxhrmxnn	39.40246386298671	-107.2121162471056	Carbondale Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170rb0027qh0o221y530d	39.92605875438278	-105.8589034693936	St. Louis Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170re0029qh0o3xkqgpbq	37.59129617291437	-108.026412052373	Salt Creek Trailhead Upper	\N	\N	clra170o60000qh0o4eufy4wk
clra170rg002bqh0oqen4mu2v	39.9336882817277	-105.8491502829792	Lower Creekside Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ri002dqh0oh5imv6x8	37.90709340198553	-105.6490498765763	Liberty Gate Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170rk002fqh0omnqftiym	40.29300036217407	-108.9676500258957	Plug Hat Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra170rm002hqh0om1io7yz8	39.39946406358698	-107.1553074412163	Catherine Bridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ro002jqh0o13c2khcn	39.37315746371483	-107.0857870991648	Hooks Lane Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170rq002lqh0o2e883gkw	39.91892504062992	-105.8331315095816	Elk Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170rt002nqh0ode82kaeb	39.25058600316166	-106.8823155433921	Intercept Lot Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ru002pqh0o04wae9ff	39.85615823800639	-105.65810422966	James Peak Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170rx002rqh0oe2n17zdg	37.80508277400404	-108.063240313824	Navajo Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170rz002tqh0obosy9du5	37.5074888264525	-108.8816652980794	Mockingbird Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170s0002vqh0o72jreia7	37.34737955190263	-108.9324421149594	Cannonball Mesa OHV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170s2002xqh0odvl3vfsl	39.95157449964702	-105.5949357906636	Hessie Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170s4002zqh0o5rl02qw8	40.00971966619483	-105.5688053066898	Rainbow Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170s60031qh0o1r1icqbl	39.19164047771046	-106.8172027906483	Rio Grande Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170s90033qh0o8llpveww	38.50868871047719	-106.1891947657529	Greens Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sb0035qh0oiscu438s	39.02031972160506	-106.7560135570231	Taylor Pass/Express Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sd0037qh0oim4aarrv	39.1986188038189	-107.3028706765291	Coal Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sf0039qh0olboxvfyn	38.4482262388813	-105.2467530084045	Floral Avenue Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sh003bqh0oke62ot7g	38.46184242115913	-105.2515676247735	Dakota Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sj003dqh0o99w15v0z	38.53805819711527	-105.9900512741022	Salida Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sl003fqh0o4umyo35y	38.46921863424536	-105.249575714412	Washington Street Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sn003hqh0oahcg5c2u	38.43367689999718	-105.2649326012158	Tunnel Drive Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sp003jqh0okc9wo38o	38.43798484071448	-105.2397743940239	River Front Recreation Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170su003lqh0o35ygn7x9	38.46529160154711	-105.3090991478821	Canyon Rim Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sw003nqh0oaiqazhcd	38.40984627047647	-105.3133527395238	The Temple Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170sy003pqh0onb7uapey	38.43869877024284	-105.2251557778929	Sell Avenue Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170t0003rqh0oou8uciw3	38.43765354048843	-105.2054328249314	Raynolds/Ash Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170t2003tqh0oz4ppao2a	38.41917744240039	-105.1785520160336	Mackenzie Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170t4003vqh0obfuj06xp	38.41869074431999	-105.2603873892811	Ecology Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170t6003xqh0odfdhmsmw	40.08075110204319	-105.5351584747781	Red Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170t9003zqh0ow18yq138	40.10552664532182	-105.4881069616751	South Saint Vrain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170tb0041qh0olq8f3rt2	40.13014488692259	-105.5764681462772	Coney Flats Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170td0043qh0o9370hr4r	40.12118661715478	-105.5239568669512	Beaver Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170tf0045qh0o5fk5qkn9	40.17424178158531	-105.5333617103355	Saint Vrain Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170th0047qh0okpq0rptt	40.20483700287694	-105.4766358474288	Bright Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170tj0049qh0ohotr8331	40.23486580953036	-105.4477478715609	Bright Extension Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170tl004bqh0ohitiw12y	40.2500487467314	-105.4106686428118	Coulson Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170to004dqh0oheosydeo	37.77001495199998	-103.512839173442	Vogel Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170tq004fqh0oia8242nq	40.18760902742002	-105.4136779821028	Dry Saint Vrain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ts004hqh0ozi3ahuvf	40.10646283366979	-105.322399054373	Lefthand OHV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170tu004jqh0o4m07es8o	40.95808873933951	-105.1636757888575	Red Mountain Open Space Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170tw004lqh0oc0a6ztwm	40.43115768381294	-106.0069113819642	Teller City Interpretive Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra170ty004nqh0o87xgioc4	39.96078038882993	-105.396200954713	Forsythe Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170u0004pqh0ohr4zixce	39.95727961963195	-105.447297153632	Front Range Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170u3004rqh0onbyfm19u	39.94683428371982	-105.5176711167476	West Magnolia Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170u5004tqh0ojomajzq1	39.32763740745536	-106.1296276902796	Kite Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170u7004vqh0o9r9hxl7v	39.57390978341127	-107.4345915969603	Storm King Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170u9004xqh0ooktnh6lt	39.5858835728983	-107.5383147411718	Colorow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ub004zqh0oix98n85f	39.81718318414548	-105.213335560916	 	\N	\N	clra170o60000qh0o4eufy4wk
clra170ue0051qh0o8ydd33i4	39.83801392260775	-105.0618123910411	 	\N	\N	clra170o60000qh0o4eufy4wk
clra170ug0053qh0o60dl7lua	39.89649078627584	-104.9418486402035	Grange Hall Creek Trailhead at Carpenter Park	\N	\N	clra170o60000qh0o4eufy4wk
clra170ui0055qh0oqzgqnx36	39.54139734901919	-107.3217552915783	Doc Holliday Grave	\N	\N	clra170o60000qh0o4eufy4wk
clra170uk0057qh0o4bcka6su	39.63633108056331	-104.8712657594505	West Shades Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170un0059qh0ozxqsqyw0	39.63519027122491	-104.8599049675328	Lake Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170up005bqh0omvd3hbhc	39.63435986363518	-104.8634797088827	Mountain Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ur005dqh0otnl8hid4	39.52779995152299	-107.2571029222452	Lookout Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ut005fqh0oqtmuja9y	38.65797854460062	-105.8133229188241	Badger Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170uv005hqh0oao4ckkui	38.54096237554723	-105.0298153754736	Beaver Creek Lower Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ux005jqh0o5bbgzst2	38.5706987582105	-105.012119251574	Beaver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170v0005lqh0oismjb5t4	38.57142429691991	-105.0866903142481	Holbert Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170v2005nqh0ozpoylj36	39.36139450990733	-107.1889563219152	Bull Pen Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170v4005pqh0o3lintm16	40.58174096180004	-107.3774189358989	Greenwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170v6005rqh0odzw7jbpn	40.57631622608424	-107.3650654717965	North Access Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170v8005tqh0ozs6arqgb	39.33955223278906	-107.1583078944039	BLM Crown Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170va005vqh0om3rmi7q3	39.32068173535386	-107.1348487434812	Prince Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170vc005xqh0ojq7ovfh5	38.57040042161714	-107.3323078521963	Commissary Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ve005zqh0ostwc4cka	39.97828077833432	-107.6199140405568	Oyster Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170vh0061qh0og6oq3n18	39.33242304609315	-107.1515848227015	Skill Saw/Creek Side Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170vj0063qh0of5u2uut3	39.40420496089853	-107.2109546305196	 	\N	\N	clra170o60000qh0o4eufy4wk
clra170vl0065qh0oa2ghpoh3	40.07143146594709	-105.229463169401	Boulder Reservoir Parking	\N	\N	clra170o60000qh0o4eufy4wk
clra170vn0067qh0oseb1hba7	39.30385637557028	-105.0878534157317	Rim Road / Jackson Creek Trailhead #681	\N	\N	clra170o60000qh0o4eufy4wk
clra170vp0069qh0oc6i45bxi	38.56763562194468	-105.9837100262245	North Backbone Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170vr006bqh0owjv7au0k	38.92694182690004	-104.7545551629209	Cottonwood Creek Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170vt006dqh0o9qtpf4g4	38.31305452279755	-106.1433886032671	Rawley 12 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170vv006fqh0o9dj7r7vs	37.12399831207172	-106.3692528050602	Elk Creek Trailhead, Trail 731	\N	\N	clra170o60000qh0o4eufy4wk
clra170vy006hqh0orfq6vi53	37.27844978489318	-106.4795604165481	Upper South Fork Trailhead #720	\N	\N	clra170o60000qh0o4eufy4wk
clra170w0006jqh0o07rptp0b	37.9589756470622	-106.4312576055782	Storm King Picnic Site Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170w3006lqh0oeivqac7y	39.41622272120529	-107.2207175200511	Red Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170w5006nqh0oegdnvzlu	37.81154373432279	-106.3774566978349	Natural Arch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170w7006pqh0ovkscob81	39.80474936729083	-105.7124627061037	Bill Moore Lake/Empire Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170w9006rqh0oq7d404k2	40.08734671056244	-105.2263202279863	Boulder Reservoir (55th St) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wb006tqh0o9ert6e95	38.95095132376066	-104.7763180310308	Rampart Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wd006vqh0ojyo29efi	40.02786063722306	-105.5249063563051	Sourdough Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wg006xqh0o5v9lt5wa	39.0112091100664	-104.8060087032067	Mary Kyer Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wi006zqh0ogzythj19	39.77087013817096	-105.8537052750757	Jones Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wk0071qh0onjla2suj	39.47846454251999	-107.1616164777469	Fisher Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wn0073qh0omx74kez2	37.84508485781542	-104.5770349477396	Cuchara Canyon - Wilson Crossing Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wp0075qh0or8plbcp0	40.4504085133472	-108.3832538621991	Twelve Mile Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wr0077qh0o3shdw5my	40.47388045661954	-108.0577240250512	West Juniper Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wt0079qh0obmm5qnxw	38.03191645438702	-108.0461992176754	Leopard Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ww007bqh0ozlxvq8t4	37.80583643864708	-104.5908339955643	Cuchara Canyon - Sheep Crossing Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170wy007dqh0oi8eaaf7l	40.4961350771484	-108.2624653956927	South Cross Mountain East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170x1007fqh0ol1z8888t	38.32086425684066	-105.3466253757707	Bear Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170x3007hqh0odxu4sqx4	40.50624348499484	-108.1189736899928	Thornburg Draw Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170x5007jqh0ocp6k0l46	38.53225576293907	-105.4900772960535	Little Crampton Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170x7007lqh0ortgkx76b	38.60104361536706	-105.6810659328255	Waugh Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170x9007nqh0oac0kz75j	39.67787260125325	-105.6600849360091	Hells Hole Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xc007pqh0oejobl24t	38.7761060890132	-107.8851858189296	Lawhead Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xe007rqh0o8inye3pc	39.17380019831234	-109.0180574560743	Jouflas Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xg007tqh0ov0bah43n	38.61547330184115	-107.8854179340514	Eagle-Wave Trailheads Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xi007vqh0ojpmhr6mt	39.72751331757289	-108.2882462438351	Willow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xk007xqh0og8096ywu	40.46257280388409	-108.3503287169163	South Cross Mountain West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xm007zqh0o769u6ovg	39.20481499137199	-106.9715180406238	Upper Divide Lot	\N	\N	clra170o60000qh0o4eufy4wk
clra170xo0081qh0osdkn9vqs	39.20851597552225	-106.9573422904237	South Rim Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xr0083qh0ov8q8qnfi	38.70411363020911	-107.6032020454605	Young's Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xt0085qh0of4ohzkw9	38.73764119392111	-105.609643926512	31 Mile Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xv0087qh0o2m22kshv	39.58586426294627	-106.6944830998694	Salt Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xx0089qh0oggfucv5s	38.17695165437025	-107.1649140664297	Powderhorn Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170xz008bqh0oeiy0ib63	39.20684065622203	-106.9551648889434	Lot 8 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170y1008dqh0oietpowng	40.37785270191306	-107.8242961514612	Duffy Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170y3008fqh0ov89kvi74	39.66510604829917	-105.6326247193475	South Chicago Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170y5008hqh0oi9hb0rii	39.71488537931678	-105.5546417505577	Barbour Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170y7008jqh0owj6fbeqy	39.18719953533662	-106.8525975349666	Maroon Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170y9008lqh0oglgij5iv	39.60657531970707	-105.7276240367355	Silver Dollar Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yb008nqh0os8vahztb	39.18642998269943	-106.8369011575326	Water Plant Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yd008pqh0oze71xb26	39.97633402029547	-107.6354547973596	East Beaver Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yf008rqh0objdhwl22	39.60958380227219	-105.7181495911395	Naylor Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yh008tqh0oh15ll3g0	39.59649370475434	-105.7102835190776	Bierstadt Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yj008vqh0offhbuai8	39.59721013362934	-105.7129336882757	Guanella Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yl008xqh0o5qr034qy	39.81244715233559	-105.6615415597915	Loch Lomond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yo008zqh0o97b1loyq	39.65734891977191	-105.5934273642962	Captain Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yq0091qh0ooks7p1nn	39.18905306009502	-106.824173039501	West Ajax Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170ys0093qh0oezorua9c	39.56131350991376	-107.2497460094865	Grizzly Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yu0095qh0o8vue0bh9	39.62010065192478	-105.5102462311617	Bear Creek Guard Station Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yw0097qh0oxz76np5j	40.04122594628586	-107.526691033315	Fawn Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170yy0099qh0o4oycdned	40.00736798865738	-107.5699494934071	 	\N	\N	clra170o60000qh0o4eufy4wk
clra170z0009bqh0o85r1djgl	39.61412573977963	-105.5350253864098	Camp Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170z2009dqh0olyre4nok	39.16433434622674	-106.7890228521918	JH Smith Interpretive Loop	\N	\N	clra170o60000qh0o4eufy4wk
clra170z4009fqh0ojuznyfl2	39.52178872291539	-105.5367819774768	Meridian Trailhead #604	\N	\N	clra170o60000qh0o4eufy4wk
clra170z6009hqh0op5fvexio	39.17124305298975	-106.7920917565081	North Star Beach Gate Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170z9009jqh0o3vtbb21s	39.56834424739124	-105.3834169120549	Cub Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zb009lqh0onkgov06h	39.52454955577298	-107.7868372788029	Rifle Information Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zd009nqh0of26gl4hu	39.47272684251753	-104.9157830183884	Daniels Park East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zf009pqh0or4o4y764	39.65639219157831	-105.5958827685359	Echo Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zh009rqh0o1gmdzd2c	39.47291860880505	-104.9215767825187	Daniels Park West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zj009tqh0o2g9kt475	39.59859854687414	-105.6405559290992	Summit Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zm009vqh0odmriiglz	39.49107103575457	-104.8700329939958	Glendale Farm Open Space Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zo009xqh0onzxhpb53	39.52424676146119	-104.9999476595545	Pronghorn Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zq009zqh0o7w8o86ye	39.51416804870909	-104.9202970837995	 	\N	\N	clra170o60000qh0o4eufy4wk
clra170zs00a1qh0odhzqik4g	39.52820801611875	-104.8864805653648	Bluffs Regional Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zu00a3qh0o4y1rsdwh	39.49903880477006	-104.9112870776441	Backcountry Wilderness Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zx00a5qh0oq2d5grxp	38.23710316781613	-104.7299564832027	Red Gate Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra170zz00a7qh0oscw0cowy	39.49123572460226	-104.8998180587518	Coyote Ridge Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710100a9qh0ozhdtica9	39.50395215408183	-104.9413957156052	East-West (Grigs Rd) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710300abqh0o5yp3cful	39.64283065126991	-105.5928765791701	Lower Goliath Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710500adqh0oqt2ycsem	39.54629339976135	-105.0276203318468	Redstone Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710900afqh0ofnvm14f4	39.54779962369311	-104.8873689751433	Cook Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710b00ahqh0ov5lom0ye	39.60313927799702	-104.9298760406954	Centennial Link Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710d00ajqh0oxpsy1rgl	39.63280571288482	-105.6040581606827	Upper Goliath Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710f00alqh0ou2dynr0w	40.44084613106228	-104.813210707766	Poudre River Learning Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710i00anqh0onimy64dt	40.13565748225265	-105.1904874601634	Lagerman Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710k00apqh0odjhjeu66	39.58373940850876	-105.0286778769152	South Platte Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710n00arqh0oujbkvcqp	39.59514723988357	-105.0260970242421	Reynold's Landing Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710p00atqh0onlcb47oq	39.56833526181209	-105.0452266773853	Mary Carter Greenway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710r00avqh0oquwqk11g	38.25323279279028	-104.6054837199762	Moffat Street Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710t00axqh0oilsrh3ci	38.25977955217149	-104.6171625945377	Main Street Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710v00azqh0ozzjmhs79	38.26672638151078	-104.6232203644289	Pearl Street Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710x00b1qh0o9zq38fj2	39.56730294867562	-105.0568796319283	Mary Carter Greenway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1710z00b3qh0o8k72unap	38.26574365597693	-104.657659190199	City Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711200b5qh0ot72dtetv	39.98236008893337	-105.5192173167835	Caribou Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711400b7qh0o5ai1yqvz	38.26960784242046	-104.6330568253919	Dutch Clark Stadium Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711600b9qh0ozwlriel5	38.29826715438413	-104.6016545963601	Haaff Elementary Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711800bbqh0oytdt9a85	38.30563795403921	-104.6020797335263	Montebello Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711a00bdqh0o9ia5zesn	38.28450043629689	-104.6009708895376	Brickyards Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711c00bfqh0odxpzhgsh	38.2780807239196	-104.6020403157821	East 13th Street Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711e00bhqh0op6ve1hke	38.25608525266554	-104.5896615131987	Confluence Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711g00bjqh0onf2f2le9	39.60751500329296	-105.038810414239	Columbine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711j00blqh0onutw92f0	39.9792832063013	-105.5080446693929	Mud Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711l00bnqh0opbvhuvsc	39.642615880755	-105.0157772225993	Mary Carter Greenway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711n00bpqh0o7di9sn97	40.10403486074914	-106.3945121090029	Wolford Mountain South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711p00brqh0o7rqc82s3	37.7573003915054	-108.1280977714105	Geyser Spring Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711r00btqh0oxvrq95bg	38.26805798257402	-104.7084069479957	Anticline Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711u00bvqh0ok01q12mw	40.44242475661067	-104.7882553666594	Signature Bluffs Natural Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711w00bxqh0oh71jicnf	38.87277846164474	-106.8993118223734	Strand Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1711z00bzqh0oovyz9bfp	39.98296653171523	-105.1273087091008	Harney-Lastoka Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712100c1qh0oq5yorezb	39.81453208783817	-104.879893217042	Gateway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712300c3qh0oo3ji73zj	39.92881064803038	-105.166702452609	Coalton Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712500c5qh0o02a4ywiv	39.57839685382194	-104.7979749270571	Broncos Parkway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712700c7qh0o3xfh4qd9	39.67098951839242	-104.8895721612198	Wabash Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712900c9qh0o53qr1gba	40.14104388717815	-105.1741613790328	Blue Skies Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712b00cbqh0ozeuw9wjl	40.16943746014462	-105.1373571219702	Golden Ponds Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712d00cdqh0o62s5m7a7	39.64989251417763	-105.1466570876536	Pelican Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712g00cfqh0o7dgyuz01	39.65592327161099	-105.1420324255779	Bear Creek Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712i00chqh0oeh937rnz	40.06301337922164	-105.2007796873146	Twin Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712k00cjqh0o5lg75w48	39.65331523121868	-105.1486008787368	Fishermans Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712m00clqh0omi6hlxb0	37.93945839603928	-107.3150098550083	Cinnamon Pass ATV Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra1712o00cnqh0olisw91wo	39.64842512030118	-105.1544437526251	Bear Creek Lake Equestrian Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712q00cpqh0oikmhpmfg	39.64919087267286	-105.172941524979	Owl Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712s00crqh0oih0ho821	39.72036837309325	-106.4051044229213	Piney Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712v00ctqh0otdr2qv22	39.65225772999296	-105.1682367412486	Mt. Carbon North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712x00cvqh0o9x92sd7z	39.73570582895739	-105.3848442445312	Cannonball Flats Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1712z00cxqh0okfhcgdcj	40.21202440576339	-105.2894022992873	Bitterbrush Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713100czqh0ochh06mao	40.57140161072859	-107.3735468267696	East Beach Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713300d1qh0oszbiaiav	40.0801165302644	-105.5332163267903	Brainard Gateway/Red Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713500d3qh0oomithsdg	40.46407248572217	-104.9095592009362	Eastman Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713800d5qh0op7bmgzgj	40.47242567496321	-104.9439119228962	Frank State Wildlife Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713a00d7qh0ohxobnooe	40.24649561879157	-105.2238834161121	Rabbit Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713c00d9qh0obc3064oa	40.04571203284637	-105.1805185697402	Wally Toevs Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713e00dbqh0ojiymn3di	40.05090460963806	-105.1785978337263	Heatherwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713g00ddqh0o6dc72ug8	40.04410275739767	-105.1840428480499	Cottonwood Marsh Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713i00dfqh0ok2lhw8uy	38.90857389571126	-104.8265138276252	Tech Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713l00dhqh0oy3r6prc2	38.92500481624742	-104.8570070639056	Vindicator Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713n00djqh0orbdywga4	39.95557675524252	-105.3223522468606	Ethel Harrold Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713p00dlqh0omndk3kty	39.95124436680153	-105.3377029077677	Walker Ranch Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713r00dnqh0ozz819my6	40.55861670184945	-105.0231480349405	Prospect Ponds South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713t00dpqh0omj4fev8n	39.95795401296745	-105.3386257110106	Meyer's Homestead Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713w00drqh0o4gtme2gu	40.25630490456891	-105.8159054886545	Tonahutu Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1713y00dtqh0o5cojj0hr	40.56415387681941	-105.0294701496862	Prospect Ponds North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714000dvqh0oova7xypu	40.01578095302762	-105.3409971097184	Betasso Trailhead East	\N	\N	clra170o60000qh0o4eufy4wk
clra1714200dxqh0o1y4ik190	40.01575354664524	-105.3441724939654	Betasso Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714400dzqh0otsy2djwl	40.0135391281688	-105.3435051968941	Bummer's Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714600e1qh0oprwh3iyj	40.21134032861882	-105.2729591975668	Picture Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714900e3qh0owczx51nh	40.14930901244364	-105.300113529618	Wapiti Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714b00e5qh0onfmp19s2	40.14796651334353	-105.3001428427051	Lichen Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714d00e7qh0oibim0std	40.20283877162623	-105.1572550541384	Agricultural Heritage Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714f00e9qh0org6dd1s5	40.05935165639189	-105.3197743012328	Anne U White Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714h00ebqh0ojpwx74al	40.01592059046096	-105.1894276386965	Legion Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714j00edqh0oshhl1ec6	40.04767182157607	-105.3413444321345	Bald Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714l00efqh0o61tkoui8	39.98003381396565	-105.0910485656403	Public Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714p00ehqh0oz16xsx5w	39.97332766538226	-105.1150142250129	Aquarius Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714r00ejqh0ox8s57yag	39.95301390487178	-105.1662408986368	Superior Townhall Trilhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714u00elqh0o6en0g68w	40.09401185039456	-105.173348122876	Monarch Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714w00enqh0oknbn7j07	40.08920189792394	-105.168504163994	Niwot Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1714y00epqh0omq94oe5j	40.10317011825441	-105.1598446129154	Lefthand Valley Grange Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715000erqh0odwgok8ky	40.01513031221391	-105.325712131212	Boulder Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715200etqh0o264maxlh	39.69637775428638	-105.1920215556168	Rooney Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715500evqh0oacbw2vmt	40.01342097120791	-105.3099367830177	Elephant Buttress Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715700exqh0ovd4urjw6	40.22766720802221	-105.2961756018154	Antelope Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715900ezqh0ojj9ho9a8	40.18393678834255	-105.1764614159185	Pella East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715b00f1qh0obg9agxcd	40.60759100830585	-105.1137321291031	Poudre Trail - Taft Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715d00f3qh0oygc2x6gj	39.69056454627052	-105.1521731277053	Green Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715f00f5qh0otw8wq7ud	39.68700189500479	-105.1547908288822	Hayden Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715h00f7qh0oxmrve5xb	39.7455657654864	-105.2204543954214	Triceratops Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1715j00f9qh0o45f76xzd	39.77378888583053	-105.2373605865885	Tucker Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715l00fbqh0onsc1bemi	40.56337609180297	-107.3855054369405	Ski Beach Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715o00fdqh0o6xyf59pq	40.01222163175423	-105.2027423647212	Sombrero Marsh Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715q00ffqh0ob5tqvihg	39.7502592738937	-105.2291461634612	Chimney Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715s00fhqh0o9kpac338	39.93074822131449	-105.2942414854388	Eldorado Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715u00fjqh0obzwtqrhs	39.05561170753951	-108.4602976285772	Corn Lake Boat Ramp Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715w00flqh0okkphxps9	38.29997055526031	-104.8210140897917	Pueblo Reservoir SWA Northeast Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1715y00fnqh0oesi8t2kw	38.29053907681514	-104.8647880402251	Ten Trail South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716000fpqh0o8k02ar00	39.77927602291969	-105.1902438775954	Tony Grampsas/Easley Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716400frqh0omwpt9ffk	40.60338061338918	-105.1710814566077	Reservoir Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716600ftqh0oihfhfsie	39.77449996546562	-105.1273768597708	Prospect Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716800fvqh0o8cs3bh48	39.77399651765618	-105.1165205347026	Miller Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716b00fxqh0o0zho29xx	39.7754273270745	-105.1089454364873	Kipling Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716d00fzqh0op4gyjoew	39.9437498911917	-104.8530257921604	Brighton Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716f00g1qh0ol2akv7ec	39.88574356213975	-104.9074962327113	Elaine T. Valente Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716h00g3qh0ofw5j5h4q	39.77446515180774	-105.1099801587842	Kipling West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716j00g5qh0oqcjz12hd	39.92947923924836	-105.2901048657871	Fowler/Rattlesnake Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716m00g7qh0o2asnqmjb	39.77517178775087	-105.09900293396	Anderson Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716o00g9qh0oya6i4q41	39.78513297713123	-105.074387336458	Otis Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716q00gbqh0ojpzrol0d	38.98899720729089	-104.8985000270866	Stanley Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716s00gdqh0ohaslot3g	39.78364278953613	-105.0827456711467	Johnson Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716u00gfqh0o5iaxjnqh	40.32890863204632	-105.6023722486883	Park & Ride Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716w00ghqh0o9y5nlbkc	39.67227380486754	-105.2049721168009	Red Rocks North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1716z00gjqh0okkernctu	39.78557185658953	-105.0675950693605	Creekside Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717100glqh0o2it376iw	40.48615216075304	-104.9586356598634	River Bluffs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717300gnqh0ouolhkrw9	40.36731877385539	-105.2852633901012	Ramsay-Shockey Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717600gpqh0oxcs4dg5g	40.3594829310226	-105.2783594852871	Blue Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717800grqh0ok52am7j9	39.51841423882387	-104.9595561028771	Red-tail Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717a00gtqh0ofcbtsvxy	39.64490429488887	-104.0759797758702	Richmil Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717c00gvqh0o4977suzr	39.84813374305076	-105.3619198947501	Mountain Lion Trailhead at Ranch Pond	\N	\N	clra170o60000qh0o4eufy4wk
clra1717e00gxqh0oj5q6w5ba	39.81721938508601	-105.1187884934179	Oak Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717h00gzqh0o2ufqf5xl	38.82898664142701	-104.8792899785902	Bear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717j00h1qh0opvtvp5li	39.84613455325508	-105.3784555439879	Bridge Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717l00h3qh0os1mzey8h	40.6056158145057	-105.0959454784319	North Shields Ponds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717o00h5qh0oqsgzzd02	39.24149143279821	-105.2657168405167	Cheesman Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717q00h7qh0oyh4bzdlx	39.13624433686364	-105.1919595685411	Sheep Nose Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717s00h9qh0ouq909fi5	39.80415602872903	-105.0868279016264	Memorial Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717u00hbqh0ogd6445n8	37.81384791083628	-106.9151675606654	Deep Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717w00hdqh0ouz508x0a	37.54597989287861	-106.5032819152367	Burro Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1717z00hfqh0o45h56sig	39.85065413154106	-105.360378317413	Nott Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718100hhqh0opnniax2x	39.79797545150645	-105.0572093474732	Lewis Ralston Gold Site Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718300hjqh0o1sjzv58b	39.8312701597082	-105.1978523460013	Tucker Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718500hlqh0ocity8ix0	40.60401786633403	-105.0861620511122	Magpie Meander/Soft Gold Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718700hnqh0odjgyv39g	40.31038348795397	-105.6403774730467	Glacier Gorge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718900hpqh0oz2nmlx1v	39.84594343592158	-105.218100103839	 	\N	\N	clra170o60000qh0o4eufy4wk
clra1718b00hrqh0o9rtr0rdy	39.83213002982719	-105.1639944114001	Indiana Equestrian Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718e00htqh0owfwweyvw	37.19790601462881	-108.4841858232126	Farming Terrace Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1718g00hvqh0o3axmv2ue	39.85811445765115	-105.4473950824637	Coyote Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718i00hxqh0owib44gjj	39.84157534104617	-105.1022184098209	Two Ponds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718k00hzqh0ot65sap2d	39.87599365591629	-105.4492330265654	Raccoon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718m00i1qh0ogy9rozx0	40.69846084495154	-105.4415937896045	 	\N	\N	clra170o60000qh0o4eufy4wk
clra1718p00i3qh0ocag9w8oo	39.85004939446707	-105.445406625981	Mule Deer Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718r00i5qh0o89oglm3b	37.45948106917896	-107.8566332367612	Lower Hermosa Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718t00i7qh0owm92xj0w	39.82477727081792	-105.0378872816854	Little Dry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718w00i9qh0oloieuj3x	40.78305153463432	-105.2152220764413	Eagle's Nest Open Space Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1718y00ibqh0o6as2y3lz	40.6220873408922	-105.1397680887869	Lions Open Space Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719000idqh0oxfqbrstf	39.83570047624193	-105.0476181454173	Wolff Run Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719300ifqh0o32mnqvvs	39.85283288447033	-105.1302242975004	Standley Lake South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719500ihqh0ovmhgtp9g	39.86599765886698	-105.4139741520024	Snowshoe Hare Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719800ijqh0o0jn24cx0	39.57496115628861	-106.1110193123427	Tenmile Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719a00ilqh0ofrnvhnqv	39.54133077043481	-106.0423765196924	Gold Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719d00inqh0ohnyiclem	39.87430559760833	-105.0949195300924	Big Dry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719f00ipqh0o89eb3vwp	39.64377355126576	-106.3634209972768	Spraddle Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719h00irqh0ojrew1x1f	39.86396320509053	-105.0889610205787	Niver Canal South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719j00itqh0o81z6vjdw	39.87221999438871	-105.1033290107662	Big Dry Creek (Westbrook) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719m00ivqh0ormtfogm9	39.51068321621679	-105.5673684299437	Deer Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719o00ixqh0o2xqvkv64	37.22024837432202	-107.8602937332908	Animas River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719q00izqh0okvoxdu1p	39.09077951644043	-108.6900983768802	White Rocks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719t00j1qh0oq8zlnb9t	40.81346838499659	-105.709457888542	Killpecker Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719v00j3qh0o1sb816s3	39.86472293091055	-105.4031860654631	Buffalo Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719x00j5qh0oovzm5iz2	40.48354957866782	-105.0159598305094	Fossil Creek Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1719z00j7qh0o2hjaodxz	38.19141702959678	-107.4931426492956	East Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171a100j9qh0o1kg5ro5v	40.33542173289332	-105.4720550791922	Homestead Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171a300jbqh0oiaz536ml	40.33646951071529	-105.4761218772449	Limber Pine Equestrian Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171a500jdqh0oth2dz2b0	39.19622977562511	-105.344936539031	Sheep Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171a700jfqh0o0bkno1o5	39.83295891037103	-105.4086336213259	Black Bear Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171aa00jhqh0o3czxd4i6	37.49301587345695	-106.8014524636397	Lobo Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ac00jjqh0omytolexl	39.86650836736585	-105.0948554506616	Niver Canal Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ae00jlqh0o2ssd74sw	38.84435956131735	-106.4467350254658	Cottonwood Pass Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ah00jnqh0olf5xp571	39.83148381559796	-105.4100694718353	Visitor Center Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra171aj00jpqh0o86axj1rm	40.54177539877517	-106.683831040129	Powerline Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171am00jrqh0odv1z2b69	39.83600421985197	-105.4052475479721	Horseshoe Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ao00jtqh0oj3rxwfwn	37.29405744791923	-107.9397823874317	Barnroof Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ar00jvqh0odxdqc2q5	38.31203268081132	-104.8875885443028	Pueblo Reservoir SWA Northwest Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171at00jxqh0odb9vmjcl	37.32255251335666	-107.9473180813708	Perins Peak SWA North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171av00jzqh0o4zjjjatd	39.84273501248175	-105.0420866665962	U.S. 36 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ax00k1qh0o6ow3jnfp	39.83118373131676	-105.4104389336176	Beaver Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171b000k3qh0obx2cjz2w	38.96105950367229	-108.230847659509	Kannah Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171b200k5qh0okjgwlmjr	39.0757847818676	-107.9674778473056	Cottonwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171b500k7qh0olkaml0ul	39.87786297987395	-105.1216646067018	Greenway/BDC Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171b700k9qh0o43es6pii	37.65970873796157	-103.5710631654093	Withers Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171b900kbqh0optvbml3h	39.40315623872202	-106.443653438906	Holy Cross City Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bb00kdqh0o2g3spuds	39.88795473303374	-105.1294603055869	Westminster Hills Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bd00kfqh0o5a5eqhpx	40.60177912447586	-105.0861189818242	McMurray/Salyer Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bf00khqh0ochedx97n	39.89362339329884	-105.1187962813094	Westview Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bi00kjqh0oiqfpo0ad	40.01646374819278	-107.2382311149241	Skinnyfish Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bk00klqh0o73axaxsp	39.8310821005672	-105.4219799805164	Slough Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bm00knqh0oetv77tti	39.87856302430136	-105.1323896425116	Greenway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bo00kpqh0o0cmijxoe	39.76336914137399	-107.6940752705747	Three Forks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bq00krqh0o1r1r8tz1	39.32747116511055	-105.0874479482134	Flat Rocks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bt00ktqh0o0jvxho4z	39.90012735134989	-105.0457715606648	Legacy Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bw00kvqh0oxsjqs60y	40.15387631573883	-107.2237106647107	East Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171bz00kxqh0o53c0z6s1	38.9119390072666	-105.2559601182193	Shootin' Star Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171c100kzqh0o9jv85g3p	39.90291216588616	-105.644092554973	East Portal Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171c400l1qh0ozi7fbljf	39.88774838433132	-105.0633658138769	Big Dry/ Farmers' Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171c600l3qh0obbdkjzm8	38.0531227314416	-107.0648868180724	Mineral Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171c800l5qh0ov8w1qatb	39.83552248519325	-105.4297673760429	Blue Grouse Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ca00l7qh0oi8y51lwz	39.9277874848992	-105.0096633847992	Big Dry Creek Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171cc00l9qh0o63lmqwpu	39.95727005236686	-105.0111561475287	McKay Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171cf00lbqh0ofm45x2pz	39.89492606711455	-105.02435048434	Mushroom Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ch00ldqh0o3nyy24jx	37.63417552233658	-108.3331768581929	Lower Stoner Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ck00lfqh0o15bpzhhy	39.91713979629127	-105.0326609849872	Metzger Farm Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171cm00lhqh0omm6gxf2j	39.56613689057842	-106.4012993299347	West Two Elk Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171co00ljqh0o6jc5jlk2	37.30641522155148	-106.4827512591158	Lake Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171cq00llqh0o9oy81vsa	38.06075673368218	-106.9326266814194	Cebolla Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ct00lnqh0oxscaczep	39.18691284047001	-109.0190510443594	Rabbit Valley Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra171cv00lpqh0oyc6vvuq8	39.23110563910146	-107.0956211930536	Hell Roaring Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171cx00lrqh0o4d69ds2v	40.87544307017617	-106.1993077570243	Harvey's Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171cz00ltqh0o9kf5o5gp	40.86995587752913	-106.2013238673425	North Sand Hills Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171d100lvqh0ojmwxfihx	38.91356318492917	-105.2852363466376	Florissant Fossil Beds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171d400lxqh0o6pikswpl	39.94515063905256	-104.9208397195599	Springvale Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171d600lzqh0oqbg6gggs	38.73829087788396	-108.621388132213	Carson Hole Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171d700m1qh0o16f39uud	38.61540462646511	-107.8933410141816	Wave Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171d900m3qh0ofcd2gfw5	39.93082220091085	-104.9579130169755	Lee Lateral Ditch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171db00m5qh0o6eoyjr9e	38.64855557893848	-107.9188187778115	NCA Entrance-Carnation Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171dd00m7qh0owgnff0i1	39.876602691005	-104.9186768404826	S Platte Rvr Trlhd at Sprat Platte Fishing Facility Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171df00m9qh0o3nzoqxzg	38.65119237273029	-106.0513464954753	Siedel's Suckhole Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171dh00mbqh0oonlakaya	39.61413444353656	-107.1392231330594	Bair Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171dj00mdqh0omtsb7f87	39.66602566112247	-107.5257584520772	Centennial (East Elk) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171dl00mfqh0onoj0uq17	39.8811856348834	-104.9699186728231	Grange Hall Creek Trlhd at Lambertson Lakes Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171do00mhqh0oallknfi8	38.82680604234984	-108.4526714160483	Cactus Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171dq00mjqh0o0f87fcda	39.85478236211414	-104.9396159175485	S Platte River Trail at Thornton’s Trailhead Par	\N	\N	clra170o60000qh0o4eufy4wk
clra171ds00mlqh0ohk4r2gbr	39.86662556558421	-104.9971078239033	Niver Creek Trailhead at Anythink Library	\N	\N	clra170o60000qh0o4eufy4wk
clra171du00mnqh0ofoddpm0i	39.92598875618171	-105.0708786930612	The Field Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171dw00mpqh0o5xt3dhwg	39.92972408975497	-105.0346560365255	Broomfield County Commons Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171dy00mrqh0o6v5dr051	37.7014384327646	-105.3816550918407	Stanley Creek Trailheads Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171e000mtqh0odqd4ohzx	39.92078107143291	-105.1088577674462	Interlocken East Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171e200mvqh0oxierm13l	39.97950485615139	-105.0301922995585	Anthem Community Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171e400mxqh0omouipxm4	39.90841377431432	-105.8000403407693	Twin Bridges Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171e600mzqh0o36rzyakr	39.91673653343888	-105.7867061503251	Winter Park Town Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171e800n1qh0ozx468fqn	39.54608788200383	-105.2725607901887	Meyer Ranch Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171eb00n3qh0on1szgbrk	40.64414525575159	-104.3418459961702	Crow Valley Recreation Area Birdwalk Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra171ed00n5qh0o3a7dtqc4	40.6462798139567	-104.3432269235931	Mourning Dove Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ef00n7qh0ogvbk69dt	37.30282452378233	-107.8727667323355	Animas Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171eh00n9qh0ouelplu5k	40.80808551636847	-103.9893313648428	Pawnee Buttes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ej00nbqh0oa74744wq	40.13700821611275	-105.1161622861816	Left Hand Creek Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171el00ndqh0o6qgk4me7	40.14498251529891	-105.1067018567752	Kanemoto Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171en00nfqh0o7h8kfiwv	40.15374337767116	-105.0753679142497	N 119th St Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171eq00nhqh0o6913tfzb	40.15414244885765	-105.0372562919412	Sandstone Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171es00njqh0ocn6pi1a6	40.14886853080786	-105.0547514951863	County Line Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171eu00nlqh0odjq031j2	40.60450362761484	-105.0960455047722	Poudre Trail - Shields St. Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ew00nnqh0o37rcyw5j	40.15365714051912	-105.1004456335119	Dickens Park West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ey00npqh0ov12hgjak	40.15406525711407	-105.0961051911488	Dickens Park East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171f100nrqh0oq6frdd88	39.94370318638816	-105.0730386585375	Outlook Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171f300ntqh0o3tbe08yf	39.93016151811553	-105.0940066956619	Zang Spur Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171f500nvqh0oir5xzy6k	39.60245756198636	-106.0129567029751	Snake River Inlet Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171f700nxqh0o5zit3999	40.0193997934367	-105.1024278169306	Erie Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171f900nzqh0odrl6wfpx	40.03361211281052	-105.0735219404429	Thomas Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fb00o1qh0o7tykx7cc	39.53008764311623	-105.9980911158558	Horseshoe Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fe00o3qh0ortn40zyx	39.48537193813688	-105.9966956628927	Reiling Dredge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fg00o5qh0o9diey7b7	39.50912173892385	-106.1423521570722	Wheeler Flats Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fi00o7qh0oql1ckfxf	39.94695463915295	-105.1091443410167	Stearn's Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fl00o9qh0ohz8wqzo5	40.1616418967523	-105.1207205728448	Izaak Walton Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fn00obqh0opupt9g15	39.97889689932735	-105.071495736831	Rock Creek East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fp00odqh0oikpm0ceq	39.99289179409637	-105.0609206991271	Flagg Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fr00ofqh0opzqe3xjm	40.16337360907281	-105.1299232219535	Rogers Grove Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ft00ohqh0omh9z3aay	40.51167709383	-106.0106551844023	Moose Visitor Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fw00ojqh0ov4d76r1j	40.19568416832689	-105.0893107411891	Rough & Ready Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171fy00olqh0ohj66gif8	40.17808432349788	-105.087972514332	Clark Centennial Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171g100onqh0o97f58zj5	40.18240332892576	-105.0645929323558	Stephen Day Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171g300opqh0ob515gh6d	40.58276486702435	-106.0277370774774	Custer Draw Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171g500orqh0o2de026t3	37.33137452229378	-107.9028423469915	Junction Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171g700otqh0olqxlqe64	40.14870319958094	-105.1411800738368	Willow Farm Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171g900ovqh0oka0x5lgn	40.71495714419326	-106.0242833546311	Jack Dickens Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171gc00oxqh0olivesgs3	39.78185857250158	-105.2299236193907	West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ge00ozqh0ouwd6hoog	40.86958221076785	-106.1264354119731	Mendenhall Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171gg00p1qh0ok0hht0a5	40.52324192216853	-106.1304907423254	Owl Mountain SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171gi00p3qh0oa2r4l1eg	40.69097129765432	-106.4782111790993	Delaney Butte Lakes SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171gk00p5qh0otz9f2wwt	39.93723702054563	-105.1429310145612	Autrey Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171gm00p7qh0ow55cmrz1	39.49099850334164	-105.0936816983398	Waterton Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171go00p9qh0oe80udzwn	39.40050587192379	-105.1679042940925	South Platte River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171gq00pbqh0oz75skrw6	39.94280798619827	-105.1599330925148	Purple Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171gs00pdqh0o9cf9komc	39.03935836307614	-107.986312851132	Grand Mesa Discovery Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra171gu00pfqh0o8wf9omjz	39.34499131512519	-105.2573346567279	Little Scraggy Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171gw00phqh0obsic8urs	39.33823278364812	-105.401323689651	Rolling Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171gz00pjqh0of8k6jhuo	39.30611047314522	-105.5155894016757	North Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171h100plqh0olbno9qkq	39.34745022796548	-105.6191320863106	Long Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171h300pnqh0o1zbov2my	39.36255528898967	-105.6875887604424	Rock Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171h500ppqh0ojdra1z2h	39.41366168170865	-105.7547559346673	Kenosha Pass East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171h700prqh0o004ctoj8	39.93840425574638	-105.155235338288	North Pool Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171h900ptqh0omal8wiab	39.53316530559162	-106.0973961297499	Miners Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171hb00pvqh0otq4rf62c	39.28491099628536	-106.4468504411726	Timberline Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171he00pxqh0o4f3y6vgm	39.15180605087802	-106.4192724477728	Mount Massive Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171hg00pzqh0oz1qrmmr3	39.15170255741008	-106.4123077218854	Mt. Elbert Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171hi00q1qh0os1vzhyfu	39.07422854871051	-106.3106884499372	Twin Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171hk00q3qh0oc65tcvqe	38.86555212527674	-106.241226181411	North Cottonwood - Silver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171hm00q5qh0o2cdwkf5l	38.29128983292981	-104.8528836458023	Pueblo Reservoir South Access Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ho00q7qh0oouoquo21	37.51688269563601	-108.5748519490083	Sage Hen Mountain Bike Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171hr00q9qh0ofv4osfkz	38.71675613843961	-106.2001759237704	Chalk Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ht00qbqh0o6r48ha1t	38.59682754481791	-106.1970385774814	Shavano/Tabeguache Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171hv00qdqh0orxovarcr	38.52283228514491	-106.2758424880979	Fooses Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171hx00qfqh0oivp2voo8	38.49617080663123	-106.3251161634151	Monarch Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171hz00qhqh0op72iwgvi	39.93012932058687	-105.1591839400526	Rock Creek Regional West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171i100qjqh0oz6r00x5p	38.29587293023617	-106.5158600006444	Razor Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171i400qlqh0o7t2ujlfr	38.24009526207983	-106.5581526261352	Lujan Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171i600qnqh0oysnozbzv	38.02361605659055	-106.8363403362507	Eddiesville South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171i800qpqh0o6f8j8tos	37.79433482729473	-107.5462686478381	Stony Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ia00qrqh0odb7e9zmx	37.74251212842432	-107.7119218894097	Little Molas Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ic00qtqh0ob5cme6er	39.06410338836936	-106.4033896745366	Willis Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171if00qvqh0oxbyy4mtz	40.19193995862263	-105.1243151366496	Garden Acres Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ih00qxqh0ofadsxeql	38.98260555629357	-106.4429970056969	South Winfield Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ii00qzqh0opug00asg	38.9599738298083	-106.4607684973701	Clear Creek South Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ik00r1qh0or5mca633	38.87290520021725	-106.4266729319306	Texas Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171im00r3qh0otl66inxz	38.8277853533985	-106.4095189773495	Cottonwood Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171io00r5qh0o5p2akdgc	38.56412197365322	-106.3146032872558	Boss Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171iq00r7qh0o8un1isn9	38.6194680330224	-106.3551202453995	Hancock Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171it00r9qh0ou8bj4ch6	39.40823654478278	-105.3471559389081	Pine Valley Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171iv00rbqh0o616fb1r1	39.41295937331763	-105.2544487674116	Cathedral Spires Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ix00rdqh0ocy245w0x	39.81873740711195	-105.2865423619106	White Ranch West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171iz00rfqh0ohqob6xrf	39.81870457812327	-105.2924778323383	White Ranch Overflow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171j100rhqh0of9g59dw2	39.73196113714511	-105.248870435548	Colorow Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171j300rjqh0opvk3a1wl	39.74269105930748	-105.2347678461506	Chimney Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171j500rlqh0oew6y530b	39.73064093680134	-105.2484209318103	Lookout Mountain Nature Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171j700rnqh0ol96a8io6	39.73687163720056	-105.2454687368489	Windy Saddle Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171j900rpqh0ow0w2gxi0	39.71611103327649	-105.2097495717977	Apex Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jc00rrqh0o4osjgbh1	39.65430891041505	-105.3666381748868	Stagecoach Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171je00rtqh0o1azash1z	40.19202653800829	-105.1390526215166	Dawson Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jg00rvqh0ojp8rvpjy	40.19684209337014	-105.1442869240207	Flanders Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jj00rxqh0o75uf9s6x	40.18993021431788	-105.0555166811303	Jim Hamm Nature Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jl00rzqh0oymgeixz6	40.18175564163569	-105.1355260401016	Hover Acres Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jn00s1qh0o6jf6hrbz	39.73486396579431	-105.3637044885004	Big Easy Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jp00s3qh0oiapmbe97	39.74985094279108	-105.3831810173993	Centennial Cone West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jr00s5qh0o2l6dy1hx	39.77178539827976	-105.346890194576	Centennial Cone Park North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jt00s7qh0olghqv48x	39.73718538117249	-105.3716901992472	Mayhem Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jv00s9qh0oa7m1tfrz	39.7662238982525	-105.2141337166179	Golden Cliffs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jx00sbqh0o2idyn3bo	39.7794635296415	-105.2292641246879	North Table Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171jz00sdqh0ofn54qiun	39.55119133587214	-105.1391674127367	South Valley South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171k200sfqh0ovc55biph	39.5660860425533	-105.1530753194984	South Valley North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171k400shqh0oozrquwsb	39.54336154349858	-105.1517442276139	Deer Creek Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171k700sjqh0o9z6q4k9i	39.5522958829298	-105.1101198085462	Hildebrand Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171k900slqh0oits58ues	39.69454228402208	-105.2048746084218	Matthews Winters Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kb00snqh0o2qsg54gw	39.66313710476037	-105.3585228081055	Lewis Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kd00spqh0okg6lt55h	39.73710059050855	-105.1709242190929	Camp George West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kf00srqh0o1lhsyxtu	39.73044413812972	-105.1862050875257	Westblade Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kh00stqh0olxc5iajf	39.74221605214977	-105.1889445199404	South Table Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kk00svqh0obg98jem6	39.46684804624834	-105.2391976880005	Reynolds Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171km00sxqh0o0f3xjjvx	39.46058311737033	-105.2288069435626	Chickadee Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ko00szqh0oid2j122r	39.46179746198249	-105.2307764862763	Songbird Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kq00t1qh0o5k195gy2	39.72917278813161	-105.1444451887065	Welchester Tree-Grant Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kt00t3qh0onfxx3dnu	39.75494371191171	-105.1070779864562	Crown Hill Equestrian Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kv00t5qh0o1j9o2v1c	39.75507879499067	-105.1021125869395	Garland Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kx00t7qh0o9ctliln4	39.79773802949855	-105.1646458151033	Van Biber West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171kz00t9qh0of0a0qahw	39.79741860014563	-105.1399665453106	Ward Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171l100tbqh0oze2y8ekp	39.54507612933472	-105.3224653260874	Flying J Ranch Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171l400tdqh0o9ydp9b3p	39.53513030793364	-105.3127372039242	Shadow Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171l600tfqh0olxwx5o93	39.63865349644373	-105.3233622214072	Hiwan Heritage Interpretive Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra171l800thqh0odiev69pi	40.84351711146529	-106.944579343267	Hahns Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171la00tjqh0oct0zv29m	40.31563327533641	-105.2237142083413	Sundance South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171lc00tlqh0oamlgk5qp	40.31662480209846	-105.2121917550198	Fawn Hollow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171le00tnqh0o8xyexehn	40.35064733041222	-105.2231009280733	Sundance North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171lg00tpqh0o8ujgalr4	40.51835827306024	-105.1678699296008	Blue Sky Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171lj00trqh0ohesasqjb	40.34102869902864	-105.4729177715806	Kruger Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ll00ttqh0o87aerkih	39.35171310619461	-106.3679534962739	West Tennessee Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ln00tvqh0ogqskq52l	39.3693221514694	-106.3855207284281	Slide Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171lp00txqh0o50vb6ivr	39.25939567881809	-106.4590791243386	Colorado Midland Centennial Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ls00tzqh0oca500j6g	39.24839172800917	-106.4702975246698	Windsor Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171lu00u1qh0ofsvztyne	39.24723913158389	-106.4693217685772	Native Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171lw00u3qh0oplelievk	39.26122332234493	-106.3528622267804	Turquoise Lake Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra171ly00u5qh0o5v0ujgra	39.08155328756331	-106.3829233382129	Twin Lakes Historic District Interpretive Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra171m100u7qh0o9ezbwomx	39.18770318418106	-106.3973702133667	Willow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171m300u9qh0okqki1kkr	39.92997390676314	-105.1508349329346	Rock Creek Regional East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171m600ubqh0ol6zgmv3f	38.93809485854339	-106.2554003907408	Wapaca - Lienhart Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171m800udqh0orqq2f62d	39.06928701646894	-106.4337601740635	Black Cloud Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ma00ufqh0ojbud8qjc	39.11565198459833	-106.5379279388894	North Fork Lake Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171mc00uhqh0o6dn42gg6	39.10825250846526	-106.5641237328008	Independence Pass Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra171me00ujqh0ojy7pl2fn	39.08169121240429	-106.5370822794168	Graham Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171mg00ulqh0ourmx5yde	39.01902544227416	-106.5341312220667	Sayer's Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171mj00unqh0otopvr0mw	39.06788248212019	-106.504939165111	La Plata Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ml00upqh0oje3gu1g3	38.99244643345401	-106.4745310584601	North Fork Clear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171mn00urqh0oucqpd5x4	38.96483862276084	-106.4603313592936	Silver Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171mp00utqh0o3309fg8y	38.99583506964813	-106.4039477784362	Sheep Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ms00uvqh0oftyerygy	38.95449510280702	-106.4092625578382	Pear Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171mu00uxqh0oq9jya6sz	38.99808015285866	-106.3749995477637	Missouri Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171mw00uzqh0od1011ytw	38.99839960245696	-106.3758615398046	Vicksburg Mining Camp	\N	\N	clra170o60000qh0o4eufy4wk
clra171my00v1qh0o8wwg532v	38.99993297005112	-106.2306246085148	Pine Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171n100v3qh0oqo00fuha	38.87073639855883	-106.2661312415688	North Cottonwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171n300v5qh0oeg10ziis	39.0542043652891	-106.2020023471523	Hayden Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171n500v7qh0o5m5ghl1q	39.43028116452691	-106.1654405047059	Mayflower Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171n800v9qh0oi6kn6uns	39.92140016513099	-105.1554029685207	South Pool Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171na00vbqh0oi1r8g424	39.57581603262631	-106.1139067964706	North Tenmile Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171nc00vdqh0op9c9f5a8	39.65151704332093	-105.1843613205775	Mount Glennon Access	\N	\N	clra170o60000qh0o4eufy4wk
clra171nf00vfqh0o4k5m5taz	39.58877622744787	-106.106021762746	Meadow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ni00vhqh0o17qn7lt3	40.15988009458774	-105.1279555556735	Rogers Grove Park South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171nk00vjqh0ocz5to2za	37.976579044155	-105.5052813945531	South Colony Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171nm00vlqh0oxqr0eozs	39.85281037016212	-105.909650677406	St. Louis Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171np00vnqh0ow1qgmb39	40.78311276167801	-106.7229527092686	Slavonia Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171nr00vpqh0o2xo7u94b	40.67889031933959	-105.8543341139129	West Branch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171nt00vrqh0ox66d1iuk	40.74399184114566	-105.8759001135604	Rawah Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171nw00vtqh0otge834cy	40.79799485024315	-105.9287887087041	Link-McIntyre Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ny00vvqh0o7zqon1nd	40.30641435154508	-105.5370820375432	Twin Sisters Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171o100vxqh0o4zlhvjim	40.30668450783595	-105.5379482008268	Lily Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171o300vzqh0oi3zuudwy	40.7669832771763	-105.3509270731624	Lone Pine Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171o500w1qh0oxotyddy7	40.84295693745658	-105.3345765313801	Cherokee SWA Lower Unit Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171o700w3qh0o4kdp48uj	40.82801078272818	-105.3501647074607	North Rabbit Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171oa00w5qh0oz8yieyq0	40.87963308228666	-105.4023319426117	Cherokee SWA Middle Unit Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171od00w7qh0oe6d4dgh9	40.59977848164282	-106.6049228271545	Newcomb Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171of00w9qh0oon585pi2	40.43002275942897	-106.6586266757411	Basecamp Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171oi00wbqh0o01h0ve52	40.07274246426594	-107.3449762909698	Snell Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ok00wdqh0opfgrao6q	40.4053019771362	-106.0338950688486	Illinois Ditch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171om00wfqh0odecvil5t	40.37258876870096	-105.9771025347215	Illinois River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171oo00whqh0o7etyxau1	40.38660090454631	-105.9660064801961	Jack Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171or00wjqh0oyupj4kmm	40.37291482311034	-106.0913648976214	Snyder Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ot00wlqh0ou660bdci	39.82378693129277	-106.1054907102387	Ute Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ov00wnqh0o8hs6coo2	39.81221198877111	-106.0507350020774	Ute Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ox00wpqh0ojguh9aq4	37.02194484729718	-106.4491232036624	CDNST - Cumbres Pass North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171oz00wrqh0o7kwlu7mb	37.71233970909071	-107.5180392747348	Beartown Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171p100wtqh0o0ux2od8j	39.66105614389301	-105.7844097520833	Grays Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171p300wvqh0oqcs5ewsi	39.69152188579143	-105.8052038925253	Bakerville / Loveland Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171p600wxqh0o45und11e	39.702420313907	-105.8543140279051	Herman Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171p800wzqh0o10d1pmpn	39.79801043522602	-105.7768958715478	Berthoud Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171pa00x1qh0owcpxsvyv	39.93509843360584	-105.6822127938838	Rollins Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171pc00x3qh0od7ih63jf	40.11138440142444	-105.7472049562792	Monarch Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171pf00x5qh0on695jwff	40.2402583348734	-105.8256096542371	East Shore Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ph00x7qh0ob307b92c	40.25654063622307	-105.8146581865768	North Inlet Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171pj00x9qh0ojxo5hcv9	39.86999530475015	-105.1845706385025	 	\N	\N	clra170o60000qh0o4eufy4wk
clra171pl00xbqh0o5zjm52w7	40.34965252831282	-106.0899301311527	Willow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171pn00xdqh0oykg2j4wi	40.32798499612985	-106.2121758249717	Troublesome Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171pp00xfqh0omo727mqf	40.40134188097932	-106.6183512900525	Rabbit Ears Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ps00xhqh0oj0563wb2	40.75371095903441	-106.7326122706752	North Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171pu00xjqh0o7arndvd8	39.88288414567744	-106.3358562568464	Green Mountain Camp Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171pw00xlqh0olx03cvz1	39.8369796684058	-106.3108427937471	Surprise Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171py00xnqh0ofpps23m3	39.83728699632495	-106.3160539100858	Cataract Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171q000xpqh0o9rw3zqni	39.8395737437921	-106.3139004555672	Eaglesmere Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171q300xrqh0o7jush55i	39.51784094652829	-106.1467939265882	Gore Range Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171q500xtqh0oiu4zw14i	39.61931006433664	-106.1103041671818	Lily Pad Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171q700xvqh0ood0fxc1r	39.6156726254116	-106.0745700712664	Salt Lick Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171q900xxqh0o79xfnd4r	39.79720066365645	-105.0340926972248	Lowell Street Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171qc00xzqh0okjn0imnm	39.6059017399953	-106.0752443397991	Old Dillon Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171qe00y1qh0okjs2rzai	39.57553645473965	-106.071550331985	Dickey Day Use Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171qg00y3qh0osfnqfmie	39.5877731854013	-106.0935273341164	Willow Preserve Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra171qj00y5qh0ocdsmcghk	39.62019764484675	-106.1099074605912	Buffalo Cabin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ql00y7qh0ot2gibq4x	39.76875221912213	-104.8774370800033	Sand Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171qn00y9qh0ous44rm1s	39.62389320758508	-106.0819595274635	Mesa Cortina Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171qq00ybqh0ovhgjdrt4	39.71086814489833	-106.1671942078695	Rock Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171qs00ydqh0o9idtqrj5	40.59205074440035	-105.0710433876487	Gustav Swanson Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171qu00yfqh0odqg9d4pf	39.80466970828008	-106.2299603917731	Brush Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171qw00yhqh0odsgqlj83	39.82311441391102	-106.2070620429631	Doig Meadow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171qy00yjqh0oxhbm682q	39.65291262461384	-106.0728743999233	Angler Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171r000ylqh0ojs28r82k	39.757281978594	-106.1347481643988	Columbine Landing Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171r300ynqh0ob6aivdc6	39.63501314837405	-106.0536808428757	Ptarmigan Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171r600ypqh0olqa9l8o4	39.64637738779182	-106.0225879677516	Straight Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171r800yrqh0omd0rh55i	39.63609753369706	-106.0363842944649	Oro Grand North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ra00ytqh0ogvqmig6x	39.60975838579273	-105.9925920126986	Oro Grande South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171rd00yvqh0og6j1vtkl	39.59954260409432	-105.9749728532358	Keystone Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171rf00yxqh0oc30ntqjx	39.75840749373774	-104.8573531461429	Bluff Lake Loop	\N	\N	clra170o60000qh0o4eufy4wk
clra171rh00yzqh0o2nhm5mp1	39.66357753734935	-105.878849650846	Loveland Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171rk00z1qh0oa1aff7q7	39.60147440172432	-105.8471163683313	Lenawee Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171rm00z3qh0ok0l1fy9g	39.60872484666968	-105.800047087651	Argentine Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ro00z5qh0ogtqyu251	39.59210800296419	-105.8710423678056	Peru Creek Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171rr00z7qh0oatccz7nw	39.46187973963848	-106.003727105727	Laurium (Baldy) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171rt00z9qh0oomw64fy7	39.41025283050691	-105.9684488044719	Boreas Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171rv00zbqh0oyuqm9ij8	39.36182857850689	-106.0630319369168	Hoosier Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171rx00zdqh0o5eyrxd8d	39.43606355440241	-106.0887602686889	Upper Crystal Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171s100zfqh0ok64jdmm8	39.4743440454219	-106.0497729907342	Burro Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171s300zhqh0opkmvdgs4	39.40109849254601	-106.0792480856982	McCullough Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171s500zjqh0oiqci21cj	39.38675956874858	-106.1002042170237	Blue Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171s800zlqh0oi1r85r37	40.15692373796097	-105.0452742050797	Sandstone Ranch Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sa00znqh0ov8158hsy	39.48785956751627	-106.0672815044742	Peaks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sc00zpqh0of5lbo8d4	39.49433227947335	-106.068541844607	Siberian Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sf00zrqh0omt8bjxy7	39.56893622100419	-106.0996986839939	Rainbow Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sh00ztqh0ogj9hn3w6	39.58863879096396	-106.044180398738	Sapphire Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sk00zvqh0oon840emi	39.82866236103656	-106.2189445699557	Grandview Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sm00zxqh0o1fnqyi8n	39.38223527015502	-106.06306122495	Quandary Peak Lower Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171so00zzqh0o4wt1qn5c	39.41296971885307	-106.1754692831531	Clinton Reservoir South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sr0101qh0ovxs8d4uc	39.41540136105485	-106.1711325299643	Clinton Reservoir North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171st0103qh0ock1lpscx	39.79113472982986	-104.9169564348297	Wetland Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sv0105qh0oofq0jpq8	39.46832089975095	-106.0122037414915	Mount Baldy Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sx0107qh0o508d657h	39.75521138321458	-104.8431726926429	Sand Creek Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171sz0109qh0o3p0w1pio	39.75385882745174	-104.8017597248607	Morrison Nature Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171t2010bqh0ozu6xk3q7	39.60436666728035	-106.0022529771691	Bob Craig Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171t4010dqh0ogkstre2c	39.61074508098275	-106.0155691385746	Dillon Cemetery Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171t6010fqh0o5d27esos	39.73700520808861	-106.1358239906744	Boulder Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171t8010hqh0orv1tin2v	39.76171790221682	-106.1197392363395	Acorn Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ta010jqh0ohtcbypij	38.94935833122845	-106.1430784091957	Fourmile Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171tc010lqh0oauqcc9um	38.83824914408805	-106.0278563910404	Midland East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171te010nqh0oqys0sjyo	38.38081151249824	-105.847563628293	Kerr Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171tg010pqh0o4jaw6qqx	38.33005569667037	-105.8170777025629	Hayden Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171tj010rqh0os9dm7qv5	38.3172683170526	-105.7557005234565	Big Cottonwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171tl010tqh0ougykdds0	38.43746794269592	-105.9555716125534	Bear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171tn010vqh0o0etj738r	38.44493860088208	-106.1051734550405	Mears Junction Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171tp010xqh0o1hqf4534	38.4765637763808	-106.0019702648475	Methodist Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171tr010zqh0oun139zc9	38.46349868263574	-105.961508131273	Columbine Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171tt0111qh0o2g0cick3	38.48436463863356	-106.1847383060888	Pass Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171tw0113qh0okf06tkvo	38.71361738445913	-106.2327176034974	Agnes Vaille Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ty0115qh0ocvekhgeh	38.81496002173746	-106.3345182373551	Denny Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171u00117qh0oqyg5py0b	38.80353111532633	-106.3748530991033	Ptarmigan Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171u20119qh0o41eh7qui	38.76478489558436	-106.3358154911271	Green Timber Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171u4011bqh0oxviztgm5	38.70535542469603	-106.3391118002869	Grizzly Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171u6011dqh0oaolvh9k1	38.63940194494923	-106.3617640086929	Alpine Tunnel Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171u8011fqh0okdtdwm8e	38.64845493229952	-106.3396689269966	Pomeroy Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ua011hqh0osdfeo032	38.53155816962575	-106.3235651091878	Waterdog Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171uc011jqh0ou0aw0ryt	38.36365952080939	-106.1772882266128	Silver Creek (Rainbow) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171uf011lqh0ohpge3txn	38.3949403535426	-106.2474669362356	Marshall Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171uh011nqh0ogtfrsf3t	38.91108467555848	-105.9776071348216	Sevenmile Creek Access	\N	\N	clra170o60000qh0o4eufy4wk
clra171uj011pqh0o9pyo5tkt	38.67213039278855	-106.1615915419382	Browns Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ul011rqh0o0xl2texp	39.38495751456215	-106.061721737334	Quandary Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171un011tqh0oteam07rf	40.76669731279923	-107.439936898632	Sherman Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171up011vqh0ocuaa0wrv	40.76134739611093	-107.4206665573184	Taylor Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ur011xqh0o59udqr3u	40.76365456599837	-107.4235995958818	Cottonwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ut011zqh0ol5lahqla	40.76505019024665	-107.4284928194501	Aspen Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171uw0121qh0ok3lp8nj4	40.79645457185062	-107.2856112009309	Lost Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171uy0123qh0ox88u3emn	40.81029593651868	-107.2980973507605	West Prong Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171v00125qh0ovdzwgy6u	40.80479900358817	-107.2922806275657	South Fork Slater Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171v20127qh0o1kumg5s6	40.83291081979125	-107.4053892247826	Willow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171v40129qh0o939de40w	40.80648106126696	-107.2465473419867	Sawtooth Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171v6012bqh0o2xrmzfom	40.80032397217228	-107.2197053782799	Grizzly Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171v8012dqh0owa54mkcv	40.82773764146375	-107.1318679524045	Adams Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vb012fqh0oq19obtt8	40.81069692814533	-107.1319638012038	Adams Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vd012hqh0ot2zerjam	40.81743187273903	-107.4269509448423	The Gap Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vf012jqh0ote70nbuz	40.75889391470879	-107.3448862300479	Black Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vi012lqh0ok6jfohyw	40.75783771193459	-107.3336404697053	Campground Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vk012nqh0o6equwdr3	40.75004907179093	-107.3240100441031	Sawmill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vm012pqh0o69t0b3c1	40.74269795334507	-107.3650630569036	The Dike Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vo012rqh0ohdnvoj5t	40.71566577458363	-107.29074400331	North Fork Elkhead Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vq012tqh0odqx6ch61	40.76160492322087	-107.1350218640813	California Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vt012vqh0oloi0rr0i	40.76439051191365	-107.0496362775332	Sand Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vv012xqh0osn2uqfls	40.85036597177049	-106.9954658711446	Prospector Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vx012zqh0o94pa61ay	40.87697641251998	-106.9944180988719	Nipple Peak East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171vz0131qh0onavm1pag	40.84470641201094	-107.121530729573	Nipple Peak West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171w20133qh0onu3p08yl	40.8715187590385	-106.9385591771106	Elkhorn South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171w40135qh0o8n03elno	40.98903192312459	-106.9718792967065	Elkhorn North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171w60137qh0odj0l9x6g	40.9670352541909	-106.9183604927806	Pioneer Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171w90139qh0opk6z995m	40.89969910374483	-106.9406717090738	Circle Bar Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wb013bqh0ob6jalkj1	40.98534185065117	-106.9396871256547	Whiskey Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wd013dqh0ogq11h5ai	40.82930223576449	-106.9033323789544	Ellis South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wf013fqh0ovobt7eev	40.90042220074164	-106.8437803678919	Hare Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wh013hqh0ohxkwvied	40.9138265803229	-106.8561923674334	Big Red Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wj013jqh0osjb958px	40.89107311815373	-106.8733380842981	Manazanares Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wl013lqh0olq7v6us3	40.83096267150529	-106.7828145588244	Diamond Park North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wn013nqh0ooj4x9zvg	40.76784109180205	-106.815501338646	Hinman Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wq013pqh0ofnu6g0mh	40.74926098637539	-106.8444245484903	Coulton Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ws013rqh0oxngkzfuw	40.8215322376474	-106.7775644199635	Diamond Park South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wu013tqh0o2g5eijfu	40.77338149404788	-106.7669089017671	Seedhouse Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ww013vqh0o2a5s6bbo	40.77207420364427	-106.7741454032622	North Fork Elk River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171wy013xqh0ohcpyd5av	40.76240859122217	-106.7734950200124	Burn Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171x0013zqh0o8bbeqfkb	40.68016745332014	-106.8416023721812	Roaring Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171x20141qh0of0c5o9oj	40.69003626034201	-106.803765103264	Chilton Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171x40143qh0oib97px1b	40.76982323487066	-106.7631979834203	Lower Three Island Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171x70145qh0o80f14ll2	40.75041832383764	-106.8261882172424	South Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171x90147qh0o552v4bib	40.76632568804786	-106.7460975986377	Upper Three Island Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xb0149qh0o6aoa0lg2	40.58236058334054	-106.8963970545389	Red Dirt Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xe014bqh0oc474ykyd	40.55621086898266	-106.8413135602141	Bear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xg014dqh0o2rirm2ep	40.5600584276127	-106.8500558829949	Hot Springs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xi014fqh0otupgfcqp	40.56718442652644	-106.886909119203	Mad Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xk014hqh0o0usozxs8	40.56918845380287	-106.8159548716365	Summit Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xm014jqh0oazuwoxzm	40.59124446748248	-106.8191973470072	Elk Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xp014lqh0omkocoa27	40.54419685095499	-106.6850638567178	Buffalo Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xr014nqh0omth5zyub	40.48167491223263	-106.7763158521227	Fish Creek Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xt014pqh0oyhsom4dm	40.48240481741873	-106.7810408206468	Uranium Mine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xv014rqh0oxb8g8e9q	40.47168479198951	-106.621525240768	Percy Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xx014tqh0omfetp9a0	40.61042212512655	-106.6093558764888	Grizzly Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171xz014vqh0og1hx950r	40.65841773407081	-106.5803382489398	Rainbow Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171y1014xqh0oav0pidyu	40.74767072720025	-106.5885695351728	Lone Pine South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171y3014zqh0oby924yuk	40.72221070001426	-106.5788963049422	Red Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171y60151qh0o7kvtgvl4	40.67992867443067	-106.5833846174461	Pitchpine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171y80153qh0o8j3z6ade	40.7856382682623	-106.892023190461	Pearl Lake Connection Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ya0155qh0o0dhpzlag	40.99263530868978	-106.7953915910397	Tie Hack Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yb0157qh0oqz5qlmxa	40.99680684896159	-106.8156586033239	Encampment Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yd0159qh0ouz72jte8	40.94641846809212	-106.6529483206176	Beaver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yf015bqh0orm1jj2e9	40.97712031088419	-106.6907187498807	Buffalo Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yi015dqh0oaams2cak	40.93135799767994	-106.6199100195912	Seven Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yk015fqh0oxtzwwu6r	40.89490011867161	-106.5818524225178	Helena Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ym015hqh0oueu8qwli	40.74648427298683	-106.5962265298584	Lone Pine North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yo015jqh0owio15q3g	40.74979154045333	-106.6124466451319	Katherine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yq015lqh0ottl3niqq	40.95189642654483	-106.3434798938232	Routt Access Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171ys015nqh0ov4j037d5	40.97932293724148	-106.2544907487382	Pinkham Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yu015pqh0oslik5p1p	40.50221972338534	-105.8887327395941	American Lakes (Crags Campground) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yw015rqh0oqkpzcpbq	40.49010846380619	-105.9034757719039	Lake Agnes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171yz015tqh0o8xtd2lbj	40.59058221753906	-105.9467070565888	Ruby Jewel Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171z2015vqh0o5vxzf21q	40.51794763220282	-105.7708175826984	Corral Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171z4015xqh0ogmz9fehb	40.55187985249949	-106.0298017440979	Beaver Lodge Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra171z6015zqh0o3o2b317z	40.45979093510104	-105.9183080013037	Silver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171z80161qh0ol1ihyubh	40.44321508138896	-105.9796927793152	South Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171za0163qh0o6xrf9th4	40.40388255639771	-105.9327970327132	Jack Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zc0165qh0oh3rl880m	40.38535694481549	-106.3447436716253	Hyannis Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zf0167qh0oho2xffgr	40.40031319455099	-106.2592926669902	Grassy Run Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zh0169qh0o4e26l2ok	40.35584748146699	-106.2371015176201	Longs Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zk016bqh0op7iwnexa	40.34883959294849	-106.0958751539639	Parkview Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zm016dqh0olf7kv871	40.16748454752231	-106.1758347311195	Wheatley Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zo016fqh0omw9gd8xq	40.48061864587653	-105.8222372708223	La Poudre Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zq016hqh0o3grv09qj	40.63438338892461	-105.8070575627282	Big South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zt016jqh0ofl9osjhr	40.55294211846854	-105.7814009464794	Peterson Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zv016lqh0o28rr9n72	40.63450002458202	-105.5317778688594	Jacks Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zx016nqh0osq7yogba	40.57037289475642	-105.5883298654255	Stormy Peaks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra171zz016pqh0odgnvuy8m	40.57928428811192	-105.6182171676947	Beaver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17201016rqh0oyx81y9kt	40.64988363768004	-105.698282810915	Browns Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17203016tqh0o4gae3p87	40.6982374403367	-105.540864887792	Lower Dadd Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1720h016vqh0ohi77evry	40.60983312166218	-105.7571204056633	Zimmerman Crown Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1720k016xqh0ozacyzgsw	40.71425827098431	-105.7349363881769	Roaring Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1720n016zqh0ogp4cnc2k	40.74348073731553	-105.6532554276732	Swamp Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1720p0171qh0ody21kiu0	40.80854537667575	-105.6704364273083	North Lone Pine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1720r0173qh0oht09ypz5	40.77747793780491	-105.5382087724845	Lady Moon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1720t0175qh0o38mmx6yt	40.78007420832964	-105.5382695686679	Mount Margaret Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1720v0177qh0o3urwdpcr	39.72514401669601	-104.7540039037167	Coal Creek Arena Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1720x0179qh0ox3gvv6ek	39.72277951167036	-104.84702989471	Del Mar Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1720z017bqh0oscziuzxh	39.60938628440461	-104.8786804470967	Silo Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17211017dqh0oqoz5lvlr	39.60689043891678	-104.9034923886765	William McKinley Carson Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17214017fqh0oe2x2sfvo	39.56187931991352	-104.7879547608417	Cottonwood Metro District Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17216017hqh0oompfs0ib	39.234156146566	-107.0801056679196	Capitol Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17218017jqh0ou54sq3uq	40.48204373787298	-106.8354603093395	Stables Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721a017lqh0o5a91wkkv	40.48473816275504	-106.8379693460626	9th Inning Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721c017nqh0opkv6pje7	40.45394676535706	-106.9169722925837	Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721e017pqh0owzisxpkc	37.30294030161915	-107.8800559022335	Jacobs Cliff Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721g017rqh0o9kiyc59w	40.57234175946784	-105.0394648037021	Kingfisher Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721i017tqh0oizo09oyd	37.29367320922343	-107.8722101384398	Rec Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721k017vqh0omcq3c8hu	37.295095990988	-107.8697964815672	Animas River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721m017xqh0orynv539d	37.25327137302585	-107.8788616188226	Smelter Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721o017zqh0ossa2oi79	37.23559040339845	-107.8667264457673	Carbon Junction Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721q0181qh0o7reqagi2	37.26080864289786	-107.8781539315446	Animas River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721s0183qh0o2j3hbzvj	37.2880310995819	-107.8616606233276	Lion's Den Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721u0185qh0o8ij3oof0	37.28421976445964	-107.8671919293525	Chapman Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721w0187qh0oj4pvvg0n	37.26434799568449	-107.8718589882028	Horse Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1721y0189qh0omm6ifk1v	37.23045347492589	-107.8620317329973	Big Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17220018bqh0odkts108u	37.29317246220067	-107.8395104520975	Skyridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17222018dqh0oe8ua9fg7	40.56193388382666	-105.0710843616188	Mallards Nest Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17225018fqh0okcpsn2u2	37.22383316375596	-107.8563498116439	Sale Barn Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17227018hqh0ogky4o0yw	40.56779853875158	-105.0228960722727	Riverbend Ponds - South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17228018jqh0obtr6ce99	37.27585689101603	-107.8941333398779	Perins Peak (Tech Center) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722b018lqh0ownnshskc	37.27729379457453	-107.8858108730172	Perins Peak (Ella Vita) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722c018nqh0ot1qigoia	37.26906069541291	-107.9139573534585	Perins Peak (Twin Buttes) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722e018pqh0oiymm1mql	37.36837721689293	-108.5822132557548	Geer Natural Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722h018rqh0o10ufyben	37.36105477247124	-108.5886056101082	Carpenter Natural Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722j018tqh0o80q06faz	37.30228161572732	-108.6641420403296	Mud Springs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722l018vqh0ohkbg2fjr	37.33412270971316	-108.5934904596727	Hawkins Preserve Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722m018xqh0o7si9mnky	37.34100255826726	-108.5966837448702	Mesa View Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722o018zqh0olk2a9q3s	40.38218758174502	-105.0729608108948	King's Crossing Natural Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722q0191qh0owsyd7y1m	37.35254318923277	-108.5689320384759	 	\N	\N	clra170o60000qh0o4eufy4wk
clra1722s0193qh0oqdcyizhq	40.38466752062531	-105.0758832805745	Barnes Softball Complex Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722u0195qh0o0b8j3stq	40.38757125083328	-105.0793869972345	Fairgrounds Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722w0197qh0o3gsatkgw	40.39744439145284	-105.1109049693993	Service Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1722y0199qh0or6clcz71	40.41942171411326	-105.1244072317685	Mehaffey Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17230019bqh0omhiyik8k	40.45144981518255	-105.0918014111491	Sunset Vista Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17232019dqh0ohx0pfeix	40.41766186824036	-105.0469125474306	Seven Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17234019fqh0oqi6q71js	40.39304095948889	-105.0680601305623	Loveland Civic Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17236019hqh0o8i0gd6d0	40.37054908171059	-105.1413100550967	Lon Hagler Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra17238019jqh0otp737j5r	40.36912075118881	-105.1493906978608	Lon Hagler SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723a019lqh0o3y9n3xc6	40.36198985450137	-105.1480133955889	Lon Hagler SWA South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723c019nqh0oco9ay5id	40.7681275911868	-105.6060075126351	Molly Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723f019pqh0oiqfy2yc6	40.74623694034225	-105.5401682544445	Elkhorn Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723i019rqh0ojdub7daj	37.35335411082176	-108.5490955163364	 	\N	\N	clra170o60000qh0o4eufy4wk
clra1723k019tqh0o6do2r6u6	37.34301677589411	-108.2990292511667	Cottonwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723m019vqh0oys4kgp86	37.34541145352343	-108.2881083996893	Boyle Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723o019xqh0olba2x1rt	39.83562578253408	-106.8520598935931	Winter Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723q019zqh0oyn0wpouc	39.74272823257436	-106.7049485260219	Bocco Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723t01a1qh0o09z2ijb6	39.63681614264826	-107.7052286659107	Dry Rifle Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723v01a3qh0o1r53bw8c	40.45017968773021	-104.7349152125511	Poudre Ponds Recreational Fishery Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723x01a5qh0o4sw8g0e0	40.68953172181759	-105.3103559438121	Hewlett Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1723z01a7qh0ojg7c3uno	40.6947338318783	-105.2843063228881	Greyrock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724101a9qh0ohgspwpzq	40.68855219709538	-105.3480053784507	Young Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724201abqh0oao2yc8a0	40.56651461391714	-105.5551668038229	Signal Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724401adqh0ofs6vjj77	40.47561797721522	-105.4604165211091	Dunraven Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724701afqh0ohh2lbyfi	40.31510370681212	-105.4051675237938	Lion Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724901ahqh0oj93edkfi	40.31369215145049	-105.5353384301904	Lily Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724b01ajqh0og6j36eb7	40.11134128179705	-105.3064975889362	Buckingham Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724d01alqh0orwxx1oad	40.11011772389914	-105.282687612979	Interim Joder Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724g01anqh0ofkzzywsf	40.079836468784	-105.2628157316161	Boulder Valley Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724i01apqh0odh5qh65b	40.08026050532943	-105.2356393148819	Eagle Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724k01arqh0o39nujunx	40.10483145419575	-105.2657864924214	Left Hand Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724m01atqh0olizvdxoc	40.07045661684879	-105.2826093673776	Foothills Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724o01avqh0okbwherjs	40.44140464837766	-104.7031239482815	Island Grove Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724q01axqh0ov5ii1htb	40.05085295841107	-105.2825786595727	Wonderland Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724s01azqh0osb0z30wg	40.06205229120593	-105.1318486772015	East Boulder Trail at White Rocks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724u01b1qh0o64al73oo	40.0216337846382	-105.1587752775093	Teller Farm South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724w01b3qh0octsitv9x	40.03977349401953	-105.1425473017319	Teller Farm North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1724z01b5qh0odhljnuzg	40.0625965059166	-105.2888783813519	Four Mile Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725101b7qh0o8m33lh6y	40.00458496786433	-105.4055356869045	Boulder Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725301b9qh0our9lgmc7	39.93804341581768	-105.2565646950331	Doudy Draw Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725501bbqh0o6ccs3fd5	39.92431928694761	-105.2355682863642	Flatirons Vista Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725801bdqh0odblo5kn7	39.97924339879034	-105.2746926944079	NCAR Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725a01bfqh0onjz4w3tg	39.96026092160476	-105.2368215159069	South Boulder Creek West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725c01bhqh0onm6pqrio	39.99731162326638	-105.2802233760418	Enchanted Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725e01bjqh0olhypjx68	40.00499254539537	-105.3065627673034	Flagstaff Summit West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725g01blqh0o3lstutgd	40.00412936263699	-105.3033386994732	Flagstaff Summit East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725i01bnqh0o2etdtqxe	40.00177235842055	-105.2969453254078	Crown Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725k01bpqh0ohxdjzedv	39.99734635792731	-105.3090884219317	Realization Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725m01brqh0oo1wwki9j	39.99886723790564	-105.2828409642023	Chautauqua Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725o01btqh0ozmpfy4jp	39.99752416713532	-105.2926535246591	Gregory Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725q01bvqh0ox8onw9st	40.00886144093614	-105.3253327143447	Chapman Drive Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725s01bxqh0ou4mxwqvg	39.99103639743766	-105.319247224389	Lost Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725u01bzqh0oi5p5nkne	40.00650882920792	-105.2945675550402	Halfway House Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725w01c1qh0o9vq2ilxg	40.0059747203189	-105.2929004952259	Panorama Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725y01c3qh0obrffq2xo	40.01405026841074	-105.2953488187677	Settler's Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1725z01c5qh0o3b3l5u70	40.02008939175775	-105.2978591859639	Centennial Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726101c7qh0omv15xmls	40.03949548630127	-105.1852534595951	Sawhill Ponds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726301c9qh0oaklbv7jv	40.03998822124595	-105.2369916014674	Cottonwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726501cbqh0oeccbfdzt	39.9998087950777	-105.2150385806717	Bobolink Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726701cdqh0ov3k9jbrl	39.98278377876868	-105.2145758469661	Cherryvale Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726a01cfqh0oeg36rdv4	39.92890838876391	-105.2331363204033	Greenbelt Plateau Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726d01chqh0o5dpthvu2	39.95271549260303	-105.2312973286237	Marshall Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726f01cjqh0ox3rcrntl	39.9995841267929	-105.1910792066247	Dry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726h01clqh0ohdxuzm0v	39.9387260612471	-105.2581417592803	South Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726j01cnqh0ol24jwaw0	39.99509945759324	-105.6342802433483	Fourth of July Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726l01cpqh0oiw77qgeo	39.61263016176636	-107.8099447274276	Rifle Arch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726n01crqh0o7hcooj1v	40.10141011095544	-105.1916003664772	Dodd Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726q01ctqh0o7p22r4c2	40.32976248646852	-106.0199124347929	Illinois Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726s01cvqh0owhceaz6v	40.3237682125167	-105.9085158730036	Bowen Gulch Interpretive Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1726u01cxqh0o9gm7a46g	40.27817549648982	-105.8623961175303	Supply Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726w01czqh0ohb98ylwg	40.30681507238092	-105.9669079661412	Lost Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1726y01d1qh0o7kkzu776	40.30014604972262	-105.9197643925804	North Supply Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727001d3qh0oz6nrkgcp	40.28226146813468	-106.0845415937876	Trail Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727201d5qh0obvrou9ec	40.25727006892172	-106.1092658838369	Bill Miller Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727501d7qh0oi0u9m799	40.21511448105667	-106.1408388787202	Elk Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727801d9qh0omu0yg9e3	40.16334107249067	-106.1081038597518	McQueary Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727a01dbqh0ouy7v7xjf	40.20669600626098	-105.8427460353142	Shadow Mountain Dam Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727c01ddqh0omviukxyb	40.04448849955956	-105.7321677785521	Junco Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727e01dfqh0ouww49jdr	39.98653294187298	-105.7429235573594	Devils Thumb Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727g01dhqh0ox494eeoa	40.12937706744302	-105.7642038014059	Roaring Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727j01djqh0o7f9ymfcd	40.13717792259362	-105.5857633969696	Buchanan Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727l01dlqh0ock8jveee	40.12995298869222	-105.5241716935653	Middle Saint Vrain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727n01dnqh0opy5flg7h	39.8989020811627	-105.7078589657575	Rogers Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727p01dpqh0o0bxs2d3i	39.92375822742699	-105.6686242743271	Forest Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727s01drqh0o9ay872s5	40.44199116777182	-104.7576288009011	Rover Run Dog Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727u01dtqh0o4sliv8ke	39.88197597411692	-105.7547897574264	Bonfils-Stanton Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727w01dvqh0oevgix62j	39.88060037741199	-105.7417702674718	Jim Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1727y01dxqh0o47wgtu36	39.89793601307276	-105.8700216787879	Mt. Nystrom Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728001dzqh0oorrr9qy8	39.79660659521556	-106.024939822728	Darling Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728201e1qh0o5tzoge8o	39.79075210392774	-106.0245914353894	Williams Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728401e3qh0o0ub0e6x5	39.74034554876621	-106.0277411181365	South Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728601e5qh0ogulk9348	40.57502099217866	-105.0236955824638	Riverbend Ponds - Cherly Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728801e7qh0ock4xom1b	40.57790505059104	-105.0330330506215	Riverbend Ponds - Cairnes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728b01e9qh0ou5syyexx	40.56514977588612	-105.0074719348928	Colorado Welcome Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728d01ebqh0ooexejkj7	40.56622225741099	-105.0166775341739	Running Deer Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1728f01edqh0okg9ovxf4	40.76229126930931	-103.3024429676361	West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728i01efqh0omdnas8nb	40.97696029340506	-105.0939765379398	Soapstone Prairie North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728k01ehqh0oijpf41ql	40.94387743208389	-105.0841327235441	Soapstone Prairie South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728m01ejqh0ojd6ch9p1	40.55092218965569	-105.1429012936682	Dixon Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728o01elqh0oij4s5r4i	40.56525205702538	-105.1138956541818	Red Fox Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728q01enqh0oc49onjpy	40.55641004832118	-105.1002603477216	Rolland Moore Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728s01epqh0ou2l6hglo	40.53941444309308	-105.12743811344	Spring Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728u01erqh0o92lhus2o	40.7714623539898	-103.2731135793394	Overlook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728w01etqh0oro1fbpu5	40.75816791479777	-103.2682484315344	East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1728y01evqh0ofwkh634d	40.26687591785106	-103.7993067747572	Riverside Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729101exqh0on7fo2lm9	40.38685562095629	-104.0920796912652	Prairie Wetland Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1729301ezqh0odmk7meni	40.39263034580566	-104.0932619270124	North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729501f1qh0oxqyngmf3	40.39114262973643	-104.0931051462791	Pelican Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729701f3qh0o9jryn82w	40.38301850251447	-104.0922127305821	Visitors Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729901f5qh0o72m8j2pc	40.53761647282645	-105.0009697962802	Arapaho Bend - Strauss Cabin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729b01f7qh0olr875mhw	40.5319388314765	-105.0010646189885	Arapaho Bend - Big Bass Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729d01f9qh0oojecgg0e	40.52487711745395	-104.9966124459941	Arapaho Bend - Harmony Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729f01fbqh0oxgguqdbe	40.61063627552508	-105.0633728956141	Redwing Marsh Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729i01fdqh0orzru3rb4	40.60670236951379	-105.1354450736541	Reservoir Ridge - Foothills East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729k01ffqh0obefqe5vd	40.59909630930036	-105.0814790516334	Legacy Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729m01fhqh0ogoe2c9ek	40.634694858652	-105.1683767282533	Watson Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729o01fjqh0odjlxv8j1	40.64012981359395	-105.1718926364063	Watson Lake North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729q01flqh0oqx53owwl	40.48263466214891	-104.9034461235842	Windsor Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729s01fnqh0o8riqp2nf	40.35195288614874	-104.4263199548034	Centennial Valley SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729u01fpqh0oei0618ay	40.36988168713901	-104.4624664507446	Centennial Valley SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729w01frqh0o9um85g3w	40.39203932413574	-104.4933141912111	Nakagawa SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1729y01ftqh0oiwbbh0bg	40.42632399582706	-104.5977172079494	Mitani-Tokuyasu SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172a001fvqh0omfeeuv0o	40.17049627266303	-104.9853062481938	Pelican Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172a301fxqh0otwzglp2f	40.42031001629818	-105.8114936558571	Milner Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172a501fzqh0o2w8dxzxc	40.43481695688955	-105.7303403046762	Chapin Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172a701g1qh0onoyrkssq	40.41219347514427	-105.7329789431348	Tundra Communities Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172a901g3qh0o4tz52a11	40.43123975687082	-105.5010149098678	Cow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ab01g5qh0ovt5nzppf	40.39645596360086	-105.5130908421749	Lumpy Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ad01g7qh0odilwb96n	40.4106198477923	-105.637154295614	Alluvial Fan Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172ag01g9qh0o1v4owqjm	40.40719506605662	-105.6262955838644	Lawn Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ah01gbqh0oip8elvnk	40.38700736412621	-105.6099290929712	Deer Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172aj01gdqh0ohpnc48sa	40.37288454792347	-105.6140875220576	Upper Beaver Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172al01gfqh0o555i4gif	40.3584132603085	-105.5840577603569	Moraine Park Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172an01ghqh0omap0js2u	40.3561696935252	-105.6157504587515	Cub Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ap01gjqh0o7rvlky7a	40.35487391191195	-105.631132064621	Fern Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ar01glqh0oaidbg59b	40.34159440644769	-105.6054473817332	Hollowell Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172at01gnqh0ozfu7bcod	40.32052262495205	-105.6237378625826	Bierstadt Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172av01gpqh0o2hjrbz8d	40.32004359014177	-105.6200712734995	Storm Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ay01grqh0oo3c8caw1	40.32033000319456	-105.6085212531259	Sprague Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172b001gtqh0okz45jtwp	40.27214283272786	-105.5566871600007	Longs Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172b201gvqh0o2lbkn39s	40.31193940307725	-105.6457030301206	Bear Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172b401gxqh0os591si19	40.31198406634261	-105.6460609322816	Bear Lake Loop Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172b601gzqh0ou7aeupw2	40.20845064870004	-105.561105675715	Finch Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172b801h1qh0o2mbyuxke	40.20780496521594	-105.5665164574141	Wild Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bb01h3qh0ov5q2opsj	40.23943452755919	-105.799926500634	East Inlet Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bd01h5qh0omtjcqgl7	40.26592927984279	-105.8325744054586	Kawuneeche Visitor Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bf01h7qh0o7kffdbil	40.27708566232107	-105.8501065582875	Sun Valley Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bh01h9qh0oz07nah1p	40.30732702975121	-105.8412546664714	Green Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bj01hbqh0omm02bwp5	40.31609701379188	-105.8435892078623	Onahu Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bl01hdqh0on13p19ps	40.3445693042629	-105.8585232520766	Coyote Valley Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bn01hfqh0ozxn0xsg7	40.35480347157988	-105.8575438600006	Bowen / Baker Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bp01hhqh0onb9x945g	40.37257537606287	-105.8546959161819	Holzwarth Historic Site	\N	\N	clra170o60000qh0o4eufy4wk
clra172bs01hjqh0oxnvrqp9z	40.39981792039278	-105.8474437870293	Timber Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bu01hlqh0o0na9v7v0	40.40166926882564	-105.8487228179756	Colorado River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172bw01hnqh0oprdwloo5	40.39910023047728	-105.6411205584473	Beaver Ponds Boardwalk	\N	\N	clra170o60000qh0o4eufy4wk
clra172by01hpqh0o542fe6fg	40.39355803726913	-105.6555234628467	Hidden Valley Accessible Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172c001hrqh0o7o8ak0iy	40.08592238854723	-105.2071443902209	Coot Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172c201htqh0onjnhwxcm	39.47233927172673	-106.0380621509087	Illinois Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172c401hvqh0ohp9d2doq	39.57020002029864	-106.05249360766	Blue River Inlet Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172c601hxqh0olpv4s8v1	39.15378673342033	-106.4634693622537	North Halfmoon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172c901hzqh0ons3nu9ic	39.49510975135489	-106.0482245968124	Breckenridge Recreation Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cb01i1qh0o7mf8kh5d	39.76747205061213	-107.1021182205074	Sheep Creek Parking Area	\N	\N	clra170o60000qh0o4eufy4wk
clra172cd01i3qh0osiily41d	39.47847925343655	-106.0402553135865	Carter Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cf01i5qh0or44qdcde	39.50238019019798	-106.0522863982613	Iowa Hill Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172ch01i7qh0os0r1049e	39.48340218489565	-106.0097386784373	B&B Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cj01i9qh0ok5ec3zhd	39.51498642044705	-106.0264095793916	Gold Run Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cl01ibqh0oeaf41tpm	39.44365289618244	-105.9974526255947	Bakers Tank Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cn01idqh0oeqi92ctr	39.56970836590801	-106.0850205363745	Miners Creek Lower Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cq01ifqh0opsj12hfy	39.57104587928436	-106.07419929767	Summit Medical Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cs01ihqh0o0giq463n	39.54032212932432	-106.0362126980942	Swans Nest Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cu01ijqh0o29qqs4zo	39.53823614392478	-106.1411588365012	Officers Gulch South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cw01ilqh0oqotdp8lm	39.53998863047576	-106.1430220505519	Officers Gulch North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172cy01inqh0osgdr22d2	39.47448390854469	-106.01550762697	Sallie Barber (Baldy) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172d001ipqh0oinaz86jv	39.60018163863649	-106.0042283181048	Soda Ridge Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172d201irqh0om5i574l9	39.58794354005116	-106.0155029814897	Whispering Pines Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172d401itqh0ovpu0o6iy	39.60818749114993	-106.0717941089238	Fisherman Access Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172d601ivqh0oow9zulp4	39.59978173796288	-106.084463769123	Giberson Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172d901ixqh0ok5wvt56u	39.61291594139639	-106.0130003027968	Tenderfoot Track Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172db01izqh0o0gzs9q7l	39.61058486674868	-106.0218761618207	Dillon Nature Preserve Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172dd01j1qh0ovrj708om	38.96561301120857	-107.5341258280788	Hubbard Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172df01j3qh0oi7cbljse	39.05714842615696	-107.5881783637691	Terror Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172dh01j5qh0o31t94jrz	39.09269067221305	-107.6455823166059	Overland Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172dj01j7qh0ozyed70aa	38.86112649007927	-107.1637720452053	Cliff Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172dm01j9qh0o0rtdz6d7	38.86350823118509	-107.160832627095	Horse Ranch Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172do01jbqh0ocyd7molx	38.95891052373273	-107.2631313980164	Dark Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172dq01jdqh0oe0sjawgp	38.87081942434972	-107.2089481179978	Lost Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ds01jfqh0o6309884y	38.6963012850571	-107.0506664088974	Mill Creek Trailhead (North)	\N	\N	clra170o60000qh0o4eufy4wk
clra172du01jhqh0ogol0hb39	38.80804870470789	-107.2938467867237	Little Robinson Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172dw01jjqh0ovbv24jny	39.82383106926454	-107.099387623431	Hack Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172dy01jlqh0ocdjj7c77	39.62657265160992	-107.1054366052333	Glenwood Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172e101jnqh0oqlsz8rcy	38.81328883839325	-107.3123783176556	Throughline / Coal Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172e301jpqh0oyw4dysbj	38.49278316960016	-107.5610971762414	Crystal Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172e501jrqh0oheztv5z2	38.54757509228791	-107.3175915420357	Coal Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172e701jtqh0o5pe7vn1a	38.6395159058637	-107.1848458329739	Rainbow Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172e801jvqh0otyvw3wvm	38.65906731068209	-107.3096062954697	Soap Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ea01jxqh0o5bbi52py	38.80137235102566	-107.0865287021363	Swampy Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ec01jzqh0o91ri4i63	38.81186657836477	-107.0865978917274	Beaver Ponds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ee01k1qh0o0aviavrc	38.96405363106881	-106.9884383633453	Lower Copper Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172eg01k3qh0of76nbscm	39.11921880590306	-106.8560965792999	Conundrum Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172eh01k5qh0ozd4me3c0	39.90544940816405	-106.765210665736	Shorties Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ek01k7qh0ohv60zwtq	38.9992954312748	-107.0030627494993	Rustler Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172em01k9qh0o8s3z5ykw	39.00954744336229	-107.0113113666186	Bellview Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172eo01kbqh0otsl01zol	39.92321558779027	-106.7373976791683	McCoy Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172eq01kdqh0oklvww5tf	38.8563509010564	-106.9356881558073	Whetstone Vista Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172et01kfqh0ovsfq7vf5	38.9867955744992	-106.7578885274238	Mount Tilton Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ev01khqh0ohcexodpo	38.82114181221231	-106.8687364234521	Caves Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ey01kjqh0olgzmqyxg	38.85911886199343	-106.8052061643708	Deadman Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172f001klqh0oyvvebr3m	39.40203996316318	-106.0512012246629	Lower McCullough Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172f201knqh0owzd3g5pd	38.75136568182231	-106.4347554016105	Garden Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172f401kpqh0o4e4c5f7n	38.75775449780184	-106.6801042950937	Summerville Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172f601krqh0o3lv18y8d	38.65569359203398	-106.5755131659955	Gold Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172f801ktqh0o2inco2ac	38.76916099352635	-106.6195293745669	South Lottis Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fa01kvqh0o9ew2vj91	38.52147598064978	-106.4160151085544	Canyon Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fd01kxqh0o22ya5463	38.52679961057999	-106.4820714102028	Waunita Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fg01kzqh0opwtbe15r	38.43875603877905	-106.3814506523842	Agate Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fi01l1qh0oicmbie75	38.35403162033321	-106.415992996149	Long Branch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fk01l3qh0orll0bw6m	38.02466342999947	-106.8412451824748	Stewart Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fn01l5qh0ow0xge6ma	37.97871053621682	-107.1700981018917	Tumble Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fp01l7qh0ovbj0tmyj	38.05169637781	-107.0886264228711	Rough Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fr01l9qh0oho6w3r2u	38.02203801109048	-107.1880109852008	Deer Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ft01lbqh0oh6doy7bg	38.02926651334184	-107.1586228624032	Brush Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fv01ldqh0o0l5r41kx	38.17707853969785	-107.3232453883272	Little Elk Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fx01lfqh0ohwmcp6p3	38.0431489686905	-107.3106501805509	Crystal Larson Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172fz01lhqh0otenqgpwy	38.20691423463013	-107.3854554675426	Big Blue Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172g101ljqh0ojs6gub83	38.19113943941128	-107.423256819502	Fall Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172g401llqh0oi6lrytsl	38.22512955503471	-107.386636309935	Alpine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172g601lnqh0ohy9bovot	38.22066564954638	-107.4662748964578	Alpine / Little Cimarron Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172g801lpqh0oyppccg00	38.06255746501031	-107.4220317864172	Nellie Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ga01lrqh0oipgqwt51	38.03068233254477	-107.4913435307717	Matterhorn Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172gc01ltqh0ofydl813n	39.42949140706339	-105.0637265094344	Willow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ge01lvqh0o7flk6h8p	39.42911556096117	-105.0686826145314	Roxborough State Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172gg01lxqh0ouf54jwyb	39.96173834835566	-104.7606243157673	Bruderlin Stone House Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172gi01lzqh0orqtpjnno	39.9382223692339	-104.7518327790463	Neidrach Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172gk01m1qh0oyuuofkn6	39.93853686412917	-104.7517866422443	Prairie Welcome Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172gn01m3qh0o52h2dn1t	40.43502829160291	-105.04073559154	Swim Beach Access Point	\N	\N	clra170o60000qh0o4eufy4wk
clra172gp01m5qh0oin2sdoq0	40.42533970586354	-105.0442747977838	Heinricy Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172gr01m7qh0ohn3eehnt	40.4502068548828	-105.0411468833014	Willows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172gt01m9qh0o8tclbgdf	40.01750298447526	-106.798419603622	 	\N	\N	clra170o60000qh0o4eufy4wk
clra172gv01mbqh0odomenl2a	39.91805511213551	-106.8024901214172	Stiffel Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172gy01mdqh0omalqxis5	39.33021300163994	-104.737495886692	Canyon View Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172h001mfqh0oqdp1bkk9	39.33123825442474	-104.7388229981935	Juniper Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172h201mhqh0om0zy0ypo	39.34877468194343	-104.7642458539579	Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172h401mjqh0ou8qnrw5w	39.35959834334601	-104.7684123340484	Lucas Homestead Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172h601mlqh0ozdpujf67	39.35283981126874	-104.7661440438378	Westside Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172h801mnqh0o7wu2g2x3	39.333371567782	-104.7446264483225	Inner Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ha01mpqh0o1v9xaa66	39.52089595156029	-105.0774110838968	Platte River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hc01mrqh0ouzg8y0ce	39.52853702132019	-105.089764838699	Equestrian Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hf01mtqh0ok2zkez0v	39.49471560987796	-105.0917360252696	Wetlands Connector South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hh01mvqh0odmn6simu	39.5606570362857	-105.0666408956664	Dam Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hk01mxqh0oorr0uat4	39.53982395550387	-105.0503053463593	Plum Creek Access	\N	\N	clra170o60000qh0o4eufy4wk
clra172hm01mzqh0otvej1smf	39.5451307847856	-105.0858805693864	Deer Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ho01n1qh0omzppg8ly	40.03171525190663	-106.8464445416549	King Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hq01n3qh0o2b83s3q8	39.62526489025053	-104.846302133419	Cottonwood Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hr01n5qh0omln5qczu	39.61364082896887	-104.816445637454	12-Mile South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hu01n7qh0odne27pa0	39.62346127408186	-104.8307908505503	12-Mile North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hw01n9qh0o2tq5ybah	39.65084855539893	-104.8523340656143	Tower Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hx01nbqh0oo8delllt	39.64455650090149	-104.8465297848464	Smoky Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172hz01ndqh0or4lqymxq	39.63223474606465	-104.8355713740518	Shop Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172i101nfqh0o07v9tzt7	40.03148437465852	-106.7823842152654	King Mt Trailhead (Highway 131)	\N	\N	clra170o60000qh0o4eufy4wk
clra172i301nhqh0o9r49mjk2	38.73726694459289	-104.8287467109726	Campground Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172i501njqh0ojbdmi732	38.73129088599654	-104.821118593027	Limekiln Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172i701nlqh0olgp5gf7w	38.73494721275818	-104.8196142124684	Coyote Run Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172i901nnqh0omzh61qv7	38.6875510440544	-107.5968786836339	East Shore Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ic01npqh0ojyare4zo	38.67917829528041	-107.6053655410881	Indian Fire Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172ie01nrqh0o8p42mhb5	38.67879434210811	-107.6052367151581	West Shore Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ig01ntqh0oj76bu5l3	39.9305115106224	-105.3399512116409	Crescent Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ii01nvqh0oy6lt5fb8	39.93149391327695	-105.281640571816	Eldorado Springs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ik01nxqh0o3oj5fww5	39.85646791417106	-106.7996699952107	Pisgah Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172im01nzqh0oifferbv9	39.83111770513229	-106.6409175249526	Windy Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172io01o1qh0oxrsjxuxz	39.39042714054808	-107.2752761557183	Lorax Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172iq01o3qh0o0l2h9qdk	38.92792935531153	-105.4967247414605	Coyote Ridge Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172is01o5qh0ozg9f8qna	39.31965102617422	-107.2779227534485	Thompson Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172iv01o7qh0osg0j6blu	39.62260698642356	-106.9073737191322	The Maze Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ix01o9qh0opm2ibw46	39.65765736695982	-106.8148182421858	Boneyard Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172iz01obqh0oiq88wiop	39.65093905192835	-107.0651127748488	Ute Trail Trailhead (Dotsero)	\N	\N	clra170o60000qh0o4eufy4wk
clra172j101odqh0oegxtm3ob	40.15152155105294	-105.9999200579507	Hogback Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172j301ofqh0ok8xm3pae	40.10830981875986	-106.0320981576764	Jacques Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172j501ohqh0o1o8398j1	39.28078445766024	-108.8426199178566	Mack Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172j701ojqh0oay2xjden	39.27185874916103	-108.836701058783	Highline Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172j901olqh0osb6qk0ab	39.05746622387359	-108.46287537256	Corn Lake Picnic Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jb01onqh0o2afx4jrb	40.00172061336319	-105.8392462073477	The Phases Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jd01opqh0o7378q7ae	39.06025416255247	-108.4881497513188	Wildlife Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jf01orqh0ovj1dcwbk	39.07763040265944	-108.6084474090635	Tail Race Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jh01otqh0oqpbq9dyn	39.07928022346933	-108.6089822660558	Duke Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jj01ovqh0oznk3bc7q	39.08119743845391	-108.6101895381706	King Fisher Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jl01oxqh0owoqi63gq	39.08362367720603	-108.6115384408757	Osprey Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jn01ozqh0o5zwt0tbf	39.14892570548284	-108.744160499933	Fruita Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jp01p1qh0o009ieoaz	39.16723593615917	-108.3026468155453	Old Orchard Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jr01p3qh0obpekzffx	38.06773994096049	-102.9350330778324	Red Shin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jt01p5qh0oz7bg9839	38.07101281601049	-102.9285377573974	Red Shin East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jv01p7qh0oze4bqsu8	38.08309727386728	-102.96212550849	Red Shin North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jx01p9qh0opyu1we73	38.27247250431395	-104.7706237360114	Northshore Marina Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172jz01pbqh0oiphz2ltl	38.25122207589071	-104.7356973079025	Arkansas Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172k101pdqh0otjiihuw9	38.27502465352161	-104.7744806911378	Eagle View Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172k301pfqh0omun5ykn9	38.27831281248299	-104.7513247725541	Juniper Breaks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172k601phqh0orynvrkqt	38.27060671376429	-104.709073718573	Pueblo Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172k801pjqh0o0k4n8txo	38.26140848112896	-104.7023111206365	Osprey Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ka01plqh0ol4s706ho	38.27025381131326	-104.715128305695	Rock Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172kc01pnqh0oy0btyz3h	38.2945821840547	-104.8696750439048	Ten Trail North  Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ke01ppqh0of1gefkqj	38.3042286325333	-104.8569052238748	Pueblo Reservoir SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172kg01prqh0opoedgtp1	37.61589101299044	-104.8360285584747	Hogback Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172ki01ptqh0oowzmxx91	37.60284327164561	-104.8323499303098	Cuerno Verde Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172kl01pvqh0onjrh7h0j	37.6128523286061	-104.8418337958998	Wetland Walk Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172kn01pxqh0oj6gnjdrn	40.57841146613565	-105.1787054126702	Well Gulch Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172kp01pzqh0ot34ewbek	40.56436976015152	-105.1746041076925	Arthur's Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172kr01q1qh0ouebcu8lp	37.40939620096307	-108.2648597315394	Quarry Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172kt01q3qh0oax4znsi8	37.40462958472777	-108.2785333356185	Chicken Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172kv01q5qh0odtld5eri	38.89456433129031	-105.1846828484246	Black Bear Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172kx01q7qh0ocwpnteoh	38.90247682031084	-105.1833657576841	Grouse Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172kz01q9qh0omczodpow	38.87893444642294	-105.1803308074128	Wapiti Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172l101qbqh0ovnz53h65	38.87875126151183	-105.1763644419017	School Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172l301qdqh0oc7odrwki	38.87897286862432	-105.1787860428067	Preacher's Hollow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172l601qfqh0oll3w82lj	38.88127577559236	-105.1814089398478	Outlook Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172l801qhqh0oghps95qf	38.88441872074756	-105.1827428484303	Lost Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172la01qjqh0o5agjlieu	38.88408973504965	-105.1798826524753	Livery Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172lc01qlqh0o7ypwhto8	38.88628839781387	-105.1799804356351	Elk Meadow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172le01qnqh0o1xe4vh9v	38.88949393335335	-105.1816373895507	Homestead Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172lg01qpqh0oy1nqe3jc	38.89093078549484	-105.1790350978368	Peak View Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172li01qrqh0o8drfsef4	38.88194153999756	-105.1736581535224	Dragonfly Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172lk01qtqh0ov37bnqpy	38.8381526306836	-105.1739580714754	Dome Rock SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ln01qvqh0oxj9tu4xl	37.05602865003925	-107.4137230086869	Piedra Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172lp01qxqh0owaliaeyc	37.02514849516045	-107.4050434514981	Windsurf Beach Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172lr01qzqh0oct0eyulr	37.0445151586875	-107.4071614061125	Watchable Wildlife Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172lu01r1qh0oizhmhgh8	38.22212797627834	-107.7348956645785	Ridgway Marina Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172lw01r3qh0o0harlve7	38.21993716195259	-107.7382608486094	Twin Fawn Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ly01r5qh0o60ynu4c8	38.21996149013881	-107.7314205819291	Mear's Bay Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172m001r7qh0orkbmjj1l	38.21245741151391	-107.733730960327	Forest Discovery Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172m201r9qh0ozcjejqd6	38.21302390168002	-107.7342721597056	Wapiti Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172m501rbqh0ogfovwcbx	38.24396248247528	-107.7596514111194	Enchanted Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172m701rdqh0omwcjhc06	38.20239166950058	-107.7347338262811	Cookie Tree Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172m901rfqh0o4mf6mz64	38.19000377689109	-107.7472190843411	Confluence Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172mb01rhqh0ohe3z4h9r	39.67615902494385	-107.6993919539853	Rifle Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172md01rjqh0owxf5gxgz	39.67380519587179	-107.6997068858561	Squirrel Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172mf01rlqh0o221niv2a	40.16715590748328	-104.9828647207222	Bald Eagle Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172mh01rnqh0onlwtxh2p	40.16831972655286	-104.9838659919718	Muskrat Run Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172mj01rpqh0oui3mzla5	39.31471378405649	-106.6384421722134	Chapman Interpretive Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172ml01rrqh0oitvs42qx	40.28669775498231	-106.860589530563	Overlook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172mn01rtqh0oz08hda4s	40.2687456321554	-106.881630510623	Wetlands Waterfowl Viewing	\N	\N	clra170o60000qh0o4eufy4wk
clra172mq01rvqh0oo39ninq6	40.27254151556421	-106.8764397089288	Lakeside Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ms01rxqh0obx81i2yo	40.28679975390325	-106.8319292751131	Stagecoach Dam11812 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172mu01rzqh0o2t2yxk4j	40.27534117346422	-106.8423771313145	Morrison Cove Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172mx01s1qh0ogy1lxos8	40.26878286823138	-106.8760101070221	Elk Run Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172mz01s3qh0ogc0txt55	39.49459270208622	-105.3807124866942	Mason Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172n101s5qh0oq438gveg	39.49726715936933	-105.3820958853119	Davis Ponds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172n301s7qh0ougbkwk5i	40.80619401832686	-106.956391815289	Tombstone Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172n601s9qh0oba4idxuq	40.80875493952362	-106.9683041487081	Willow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172n801sbqh0o5qli4flx	40.79639787970064	-106.9481433529162	Willow Creek South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172nb01sdqh0ogurf71q8	38.71240842730964	-108.0400886236907	Sweitzer Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172nd01sfqh0oiywwbco6	39.53916908664194	-106.754491529502	Meadows Day Use Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ng01shqh0opxnvrrz6	37.14437392138556	-104.5701148148639	Levsa/Reilly Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ni01sjqh0olbj5tpzr	37.13330323476949	-104.5605953538927	South Shore Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172nk01slqh0oxgjqw21y	37.14473257714605	-104.5685350803846	Carpios Cove Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172nm01snqh0ocnusdgub	37.1454937202435	-104.5696230150748	Park View Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172no01spqh0ow5svvi22	37.13304845677894	-104.6096275816604	Reilly Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172nr01srqh0o3jzfprwh	37.11831769347884	-104.6037148371387	Longs Canyon Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172nt01stqh0odaiw55b9	37.13486872433513	-104.539581892772	Sunset Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172nv01svqh0ojdgfibhh	39.21379414352106	-107.8118877176908	Pioneer Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172nx01sxqh0oq67tn3z3	40.49101283587068	-107.312436531213	Yampa Headquarters Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172nz01szqh0orwyo3cx8	39.07225626592767	-107.1816813098116	Beaver Lake SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172o101t1qh0ovcte9h5d	37.68435729393306	-105.7357220491592	San Luis Lakes SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172o301t3qh0ou1nozqql	40.3600298377501	-104.1087380729476	Andrick Ponds SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172o601t5qh0oxfsiyzvm	39.3696409212261	-107.0430056162768	Basalt SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172o801t7qh0oboxx3qpi	38.5424951539604	-106.021631142389	Frantz SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172oa01t9qh0oj261trpf	40.00994910930398	-105.8405758475629	Fraser River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172oc01tbqh0o99p2ndkv	40.60853316212901	-106.2818658626073	Moose-Goose Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172oe01tdqh0ocpl2z7zt	38.54406149706884	-106.0062197492411	Sands Lake SWA West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172og01tfqh0obzb2t071	38.54338835795923	-106.0059005543346	Sands Lake SWA South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172oi01thqh0o4wf4hxcf	38.5435246354279	-106.0026206926623	Sands Lake SWA East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ol01tjqh0o2ey7sp80	38.54571186638879	-106.0133916903485	Mount Shavano SWA West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172on01tlqh0ola5uy81q	38.54559862809952	-106.0108541248655	Mount Shavano SWA East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172op01tnqh0o7jlii1vj	38.54348140857611	-106.0201419156404	Frantz SWA East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172or01tpqh0ouuok1b7n	39.65100977292394	-105.4156495948825	Bergen Peak SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ou01trqh0o259tg8e1	39.67171573957253	-105.410491931464	Bergen Peak SWA North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ow01ttqh0olma8n0mq	40.377720677731	-104.6722456275933	Brower SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172oy01tvqh0of18yuafz	39.95017550270357	-105.5045419765278	West Magnolia Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172p001txqh0o0931gpfs	40.80120215180709	-105.5582785049447	Dowdy Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172p201tzqh0ovxh4bo6y	39.19794864588522	-105.5534795157246	Ute Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172p501u1qh0o740w0y0d	39.12486400333077	-106.9046694826607	East Maroon Wilderness Portal Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172p701u3qh0onj6exlc6	39.09856790703241	-106.940599576586	Maroon Lake Day Use Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pa01u5qh0obblu0y08	39.103200899169	-106.9342934062231	West Maroon Portal Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pc01u7qh0oir3gibej	39.20008716202115	-106.9940872243527	East Snowmass Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pe01u9qh0om6gd01gd	39.0246536522954	-107.0507474823731	East Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pg01ubqh0ocgjlp91p	39.07924013118274	-107.0859519703381	Geneva Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pi01udqh0ox57wk83a	39.24811296806187	-107.0552109619117	Hay Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pk01ufqh0o0f8jr718	39.09421055447256	-106.659822372228	New York Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pn01uhqh0oj762pniq	39.09231473070913	-106.6442721482326	Tabor Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pp01ujqh0ooilvbbt8	39.07715079446873	-106.611742951364	Grizzly Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pr01ulqh0o3kfncibx	39.03096809297985	-106.6152680396471	Petroleum Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pt01unqh0ohvdzp1zr	39.02938252693814	-106.8078723716719	Pearl Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pv01upqh0owomvwft6	39.04280604269201	-106.8081368599194	Cathedral Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172px01urqh0oyopjbtcs	39.12177054406342	-106.624342474539	Lost Man Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172pz01utqh0okgvjl4fo	39.125631655986	-106.6470522358439	Braille Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172q101uvqh0o7lmmc0rg	39.1169287024459	-106.6958843200193	Grottos Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172q301uxqh0o1ft5l5y1	39.11955126174214	-106.722529344633	Weller Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172q501uzqh0o50bvbsai	39.30298095246259	-106.6531717036893	Twin Meadows / Spruce Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172q701v1qh0og3cwasti	39.18252232655205	-106.8143052021191	East Ajax Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qa01v3qh0oyv1iezog	39.18132427416298	-106.8119705972007	Ute Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qc01v5qh0oual9gboh	39.03899386679819	-107.1731534331017	Yule Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qe01v7qh0oes5e3ymn	38.98916195718843	-107.0650972428968	Yule Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qg01v9qh0orw2zo4n6	39.06726099476502	-107.1849034844821	Raspberry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qi01vbqh0ouhupczz3	39.08030023320274	-107.1030709621524	Silver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qk01vdqh0odj05l8l7	39.23483330209701	-107.2019090559541	Avalanche Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qm01vfqh0o5c3ziqdl	39.17921478885476	-107.2323999906114	East Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qo01vhqh0oae7u5v2d	39.14055491872312	-107.2588995777261	Placita Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qq01vjqh0o2wnmp7ww	39.07390444658802	-107.1841984772561	Carbonate Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qs01vlqh0ojpm8w22n	39.07744449562338	-107.1458453318357	North Lost Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qu01vnqh0ovmp3luen	39.30400145540615	-107.1247011994545	Thomas Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qw01vpqh0ogmc5opxa	39.27024598283709	-107.2273355643027	Perham Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172qz01vrqh0oztykfl8s	39.19193504595884	-107.2789871368642	Braderich Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172r101vtqh0ovzbo2xlp	39.24456342306151	-106.5302840424334	Frying Pan / Lily Pad Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172r301vvqh0odxyqgswr	39.23980328172132	-106.5929694272378	South Fork Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172r501vxqh0o6pyk4cd8	39.29480387801726	-106.6032384258684	Granite Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172r701vzqh0o6wpxoyqh	39.26310037811823	-106.6303487687558	Chapman Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172r901w1qh0ona5bklwx	39.29921819292257	-106.6523328910951	Sawyer Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rb01w3qh0oleqgobjm	39.28554490857211	-106.6360925797281	Chapman Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172re01w5qh0ou1ri0i2y	39.31164778483761	-106.6442150788524	Chapman Campground Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rg01w7qh0ouvdtmo0e	39.29194235174156	-106.5268296531156	Lyle Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ri01w9qh0oc3x38sid	39.35639412886779	-106.8191670391019	Rocky Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rk01wbqh0o5z1dru1p	39.34999875548458	-106.5876473786563	Josephine Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rm01wdqh0okkazd1th	39.36540214212631	-106.6333219985507	Last Chance Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rp01wfqh0o7cto4wqh	39.35923107877237	-106.5405744609114	Savage Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rr01whqh0oabzujlco	39.42272921703096	-106.6394783213768	Eagle Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rt01wjqh0o94637snl	39.37973582753396	-106.6489127926229	Tellerium Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rv01wlqh0ol1be3z0n	39.43639799807929	-106.683936672492	Mount Thomas Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rx01wnqh0olilffzrn	39.37579750330465	-106.8165362631647	Ruedi Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172rz01wpqh0ol01btl6k	39.43834347682528	-106.8942957054174	Red Tables Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172s201wrqh0opbf6mt90	39.37750173162945	-106.9830554422756	Basalt SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172s401wtqh0osowumpg2	39.46214976744465	-107.0569771674136	Basalt Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172s601wvqh0oosic2txf	39.46783221272511	-106.7771418425809	Antones Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172s801wxqh0ow3n3dv5o	39.60618550731881	-106.6499731052023	Squaw Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172sa01wzqh0ot7sp2lef	39.50515203738998	-106.6833154101363	Yeoman Park Discovery Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172sc01x1qh0osutcpa33	39.49228036643919	-106.6585947242995	Fulford / Lake Charles Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172sf01x3qh0ojsyanyr4	39.50399268937001	-106.6783172386762	Brown's Loop Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172sh01x5qh0o6b6ie7al	39.53928263073109	-106.6168278413936	Middle Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172sj01x7qh0o1c5d93dh	39.52200803487979	-106.6303338455064	New York Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172sl01x9qh0o1fzzft3b	39.58575341105296	-106.596027944513	East Lake Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172sn01xbqh0o8zhb7ghs	39.58931408895937	-107.1901613203157	Hanging Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172sp01xdqh0oto1v3kp4	39.81528296696982	-107.1839517434878	Hilltop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172sr01xfqh0o1obhchb4	39.82645773049464	-107.296017347731	Indian Camp Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172su01xhqh0osl4ysr0a	39.84328227298654	-107.3347772694209	Budges Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172sw01xjqh0oq62n3kxx	39.85010695832332	-107.3191194893614	Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172sy01xlqh0or5hez5k2	39.7965585750496	-107.1618213765562	Sweetwater Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172t101xnqh0okv2nim9h	39.80044102997829	-107.1597936299577	Ute/Sweetwater Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172t201xpqh0oiqlfo4we	39.91002327794013	-107.1601514249845	South Derby Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172t501xrqh0o7t0j4vyk	39.9543037143597	-107.0647718383455	Stump Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172t701xtqh0oqjuu8rz9	39.57140270344392	-107.2916935129922	No Name Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172t901xvqh0os7qkn4gl	39.6216346634767	-107.4180916100893	Keyser Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172tc01xxqh0o7l8as2zh	39.8228225730676	-107.4359750204176	Crater Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172te01xzqh0oronb0phj	39.76972860225172	-107.4132116430116	Patterson Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172tg01y1qh0ohjh9ss5p	39.95182333946933	-105.8141959009378	Fraser River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ti01y3qh0oki8wffsg	39.66500518994685	-107.6253717423905	Mansfield Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172tk01y5qh0olxok0vt0	39.72467688198025	-107.6399823704019	Upper Cherry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172tm01y7qh0ose98f0w9	39.67513034021946	-107.6366366691255	Lower Cherry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172tp01y9qh0o65r14xsv	39.8648336249539	-107.5340241292472	South Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ts01ybqh0o4hrrc38a	39.8397363110925	-107.5491877379153	Cliff Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172tu01ydqh0oillkyffv	39.30546184427885	-107.5648699751708	Cayton Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172tw01yfqh0o3zqnbknc	39.32608744673612	-107.675226339015	Northern Boundary Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ty01yhqh0owi1yhpka	39.24228780431523	-107.5871331102537	Owens Loop Eastern Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172tz01yjqh0orccmeh0k	39.25126020197686	-107.6171858276647	Owens Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172u201ylqh0ofqmr0b3c	39.28248951887355	-107.6644927115033	Hightower Northern Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172u401ynqh0onrquecnh	39.25000073103364	-107.644437069677	Hightower Southern Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172u601ypqh0o1d433cpw	39.41129234865497	-107.802419287812	Battlement East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172u801yrqh0ovk57wtqu	39.94581492941697	-105.8140427277843	Outdoor Info. Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ub01ytqh0onjiiuuon	40.25187614566052	-105.8525492549578	Grand Lake Metro Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ud01yvqh0o2sii9olh	39.40127859103377	-107.9468568726446	Battlement Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172uf01yxqh0onskt3d2p	39.11533703045324	-107.7895226416798	Western Monument Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172uh01yzqh0ojdt0jxhz	39.10488316392469	-107.7818897296438	Upper East Leon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172uj01z1qh0oz0a97wlc	39.01079391449917	-107.8612174162621	West Green Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ul01z3qh0oaxl6mjth	39.04628931278001	-107.8739563469337	Eureka Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172uo01z5qh0ogr8zodkg	39.06214288415246	-108.0467570727038	Lake of the Woods Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ur01z7qh0og3rhxh87	39.02894217349573	-108.0215835630705	Land of Lakes Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172ut01z9qh0otzrv0sd6	39.04250225576775	-107.9979402217512	West Crag Crest Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172uv01zbqh0ojabjw9j4	39.0487548011064	-107.9369827951824	Crag Crest East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172uy01zdqh0oofldo408	38.9554695437866	-108.1026967978263	Flowing Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172v001zfqh0o7nqxp1sh	39.01239313571349	-108.2332707532141	Coal Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172v201zhqh0okqy385hz	39.00040168568992	-108.1826189895799	Coal Creek East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172v501zjqh0o6nk97mc3	39.00204974205783	-108.1321727511511	Raber Cow Camp Interpretive Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172v701zlqh0ofz29vt8a	38.99099359075164	-108.0965964591923	Carson Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172v901znqh0oguj7vpp5	38.99659623072937	-108.1116144992396	Carson Lake West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vb01zpqh0o2s225fv2	39.04657009176603	-108.0909149506113	Glacier Spring Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ve01zrqh0ox01bvi4r	38.8522111179807	-108.7943545344296	Little Dolores Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vg01ztqh0o3sph29y2	38.84379421949935	-108.7329112672988	Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vj01zvqh0oj8511odv	38.78426428980318	-108.675819725704	Wildcat Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vl01zxqh0o2b3hm3c3	38.67841989448436	-108.7251282842786	Divide Forks/Rim ATV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vn01zzqh0ogeurzagw	38.57020040554873	-108.4256573698062	Middle Point Escalante Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vp0201qh0okxuavqjb	38.67970770506312	-108.5208272334945	Black Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vr0203qh0o2eoh25ec	38.35146293316382	-108.5005716014782	Indian Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vt0205qh0oxc4bu8vi	38.3940756618671	-108.4495614645323	Copper King Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vv0207qh0oafs64i81	38.08652850775096	-108.3199448940113	Thunder Trails Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172vx0209qh0o5q63bhqv	38.01149565384665	-108.2842699963382	Thunder Trails South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172w0020bqh0oh8rlx2su	37.90652524123384	-108.2414381397785	Lone Cone Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172w2020dqh0o7bzqy5bn	37.88421886941276	-108.0562418983834	Woods Lake SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172w4020fqh0o1swz0bt2	37.88209376026965	-108.0186282519876	Rock of Ages Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172w6020hqh0oqh1pl34n	37.89402661881399	-108.0010571716093	Wilson Mesa West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172w9020jqh0otu5uz6va	39.16346097521414	-108.3415147654509	Coal Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wb020lqh0oscvnajri	37.88683754192293	-107.9107958380224	Ames Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wd020nqh0oyliy0iz8	37.94732659302266	-107.8779050492917	Galloping Goose North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wf020pqh0oiy0b3m11	37.92155420983892	-107.9000049977657	Ilium Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wh020rqh0o4vgdbue0	37.80492381607542	-107.8516603541608	Hope Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wj020tqh0o3fr9aqgr	37.81301103271048	-107.9069066325844	Lizard Head Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wl020vqh0o1rc6gic1	37.87939493660515	-107.9241801827971	Wilson Mesa East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wo020xqh0oof5umyr8	37.96442577174822	-107.9022023585434	Deep Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wq020zqh0oq62djjjo	37.95418010822837	-107.8295221845845	Mill Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ws0211qh0ohv9k2o9u	37.95202800055023	-107.8455181398361	Eider Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wu0213qh0oni5hfg0r	37.98958031819456	-107.7795717161175	Wrights Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ww0215qh0obvwzs741	37.99482382111005	-107.7847884900964	Blue Lakes (Southern) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172wy0217qh0oibj7crki	38.03471745414101	-107.8070315806062	Blue Lakes (Northern) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172x00219qh0ovfd2hm65	37.99398883682336	-107.7005049378474	Weehawken Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172x2021bqh0o6kqtqxn4	37.93313580272943	-107.6834369206112	Richmond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172x5021dqh0oovhw8dcz	37.82327882905503	-103.7714474511684	Santa Fe Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172x7021fqh0ocud0ozn4	37.95948346263128	-107.6622301745189	Hayden Ironton Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172x9021hqh0oncezr4ac	38.56374429681412	-108.3862363827644	Dinosaur Quarry Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xb021jqh0oiyzf448z	38.30565086811271	-107.9631238153735	Simms Mesa Interpretive Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172xe021lqh0o4qkgeyrk	39.11886074235499	-108.3887424942867	Mount Garfield Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xg021nqh0oaid33t5d	38.36633625317265	-108.1923904101459	Old Roubideau Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xi021pqh0o3k3le7t5	38.38433703334144	-107.9404346176753	Lower Spring Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xk021rqh0o6rw28gfe	38.00291470402744	-107.661939690934	Bear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xm021tqh0opqh0btap	38.0572606364491	-107.6661931930775	Horsethief Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xo021vqh0ozhbtj3zp	38.06153918691047	-107.6602753644492	Dexter Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xq021xqh0oaxg9gfg3	38.09121772307943	-107.6719648084254	Baldy Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xs021zqh0olvevflln	38.1111289303651	-107.5533247889836	Wetterhorn Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xv0221qh0o6qyc1jxe	38.23835094928928	-107.5294862478489	Clear Lake/Rowdy Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xx0223qh0oxncyk5y1	38.23276286545755	-107.5391592616215	Silver Jack Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172xz0225qh0o0af2m7uv	38.55559810632879	-106.0380329937417	Mount Ouray SWA North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172y10227qh0owyv8a45l	38.55331456947689	-106.0353835785756	Mount Ouray SWA South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172y30229qh0oldnk0eiv	39.79695709100235	-105.0350971081686	Lowell Ponds SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172y5022bqh0ovmzux60o	39.18869251149238	-108.1098202597639	Jerry Creek Reservoir SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172y7022dqh0o7f0gkq3m	39.45472026620804	-105.0539345782713	Sharptail Ridge SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172y9022fqh0obmp4wl8o	39.10537486116759	-108.650580016561	Walter Walker Wildlife Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra172yb022hqh0omjwm2hs1	40.39229357317137	-104.9972852592838	Big Thompson Ponds SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ye022jqh0oxu5k7feo	38.79427558224252	-106.113614414354	Champion SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172yg022lqh0otffh3yhw	38.44137700700439	-107.8709926336662	Chipeta Lakes SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172yi022nqh0o4mxz7ako	38.20223244255833	-106.7350933417879	Dome Lakes SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172yk022pqh0o38kx8h6m	37.73566146974294	-106.7329840295349	Coller SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172yl022rqh0o1f4pf1mc	37.21471067259449	-106.9950576334694	Echo Canyon Reservoir SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172yo022tqh0ooqh9fxyg	40.42020313311897	-106.8386511831569	Chuck Lewis SWA West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172yq022vqh0odn1sx3d4	40.42913517376785	-106.8264224740958	Chuck Lewis SWA East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ys022xqh0olcm13dpk	38.7318633916416	-108.1628016889456	Escalante SWA - Lower Roubideau Tract Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172yv022zqh0o1f5y38dd	40.0459966118967	-106.174522334772	Kemp Breeze SWA Fisherman's Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172yx0231qh0oxglqhryo	40.06416833677673	-106.190651885844	Kemp Breeze SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172yz0233qh0oibas9e4u	40.57070770921562	-106.2815708543578	Yarmony Ranch SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172z10235qh0oloc5r328	39.65335459333747	-106.9388189875355	Gypsum Ponds SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172z30237qh0o40tav03n	39.16722714153136	-108.8088630174619	Horsethief Canyon SWA West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172z50239qh0o5i0z5tel	39.15711225609953	-108.7849510607323	Horsethief Canyon SWA East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172z7023bqh0odnavvxq8	39.16407787877394	-108.7897296207023	Horsethief Canyon SWA North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172z9023dqh0oia4kr5bq	40.27119956149386	-107.4304154747469	Indian Run SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zc023fqh0oukzomx3d	40.27003482283864	-107.4174279618742	Indian Run SWA East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172ze023hqh0om6s3m7x9	36.99837283839905	-104.3654430708704	Lake Dorothey SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zg023jqh0ooj6g5nix	38.11027640770613	-107.0349895570127	Mason Family SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zi023lqh0o7h57a7sx	39.61986631788903	-105.4753712402865	Mount Evans SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zk023nqh0ocn5o1kwp	39.10002666972834	-104.2091584314152	Ramah Reservoir SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zm023pqh0omdam76df	39.98500077192925	-107.6434174733587	Oak Ridge SWA - Lake Avery Unit Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zp023rqh0ozuibyja5	40.02206456987803	-107.6757803428188	Oak Ridge SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zr023tqh0o18tquq2u	39.44212234721692	-108.0483150547939	Parachute Ponds SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zu023vqh0oc45qk7qt	40.90866886362789	-102.6712263007947	Red Lion SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zw023xqh0otds6ef6c	40.76453236806861	-106.4640826463032	Lake John SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra172zy023zqh0oq7gl2iaa	38.25581349037419	-104.5991967781438	Runyon Lakes SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173000241qh0on5l8u4cm	37.58228487407774	-106.0945631499476	Rio Grande SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173020243qh0ou5wt1zcw	37.248426247359	-104.8041579904116	Dochter Tract Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173040245qh0oluozvhi1	37.25925411747796	-104.8667874676046	Sakariason Tract Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173070247qh0onouysck5	40.84199280716025	-102.8505495102712	Tamarack Ranch SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173090249qh0oaibonlcl	39.96862888352834	-106.5485111925447	Radium SWA - Trail Creek Unit Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730c024bqh0og10ziqlr	39.08016372422687	-108.5791876756953	West Lake SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730e024dqh0otqzd8jc6	37.50807748898269	-107.2261244348971	Williams Creek Reservoir SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730g024fqh0osc4w67uh	40.10811366430164	-105.9799674862465	Windy Gap Watchable Wildlife Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730i024hqh0olgkyomo6	40.49779584487001	-107.3739752024121	Yampa River SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730k024jqh0o3p0y51hh	37.77152602897271	-107.3572780386658	Lost Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730m024lqh0odvqcvqmo	37.85779898440151	-106.9745785521859	Miners Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730o024nqh0oo1jzhc7v	37.82951006077772	-106.9801974428801	Shallow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730q024pqh0o3z8ol7w1	39.55994985830365	-106.256580180816	Mount Holy Cross Overlook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730s024rqh0opzlvpi21	37.95523512584455	-106.9665296238689	San Luis Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1730u024tqh0o8em77ikr	37.75969770127719	-107.3428041152514	Ute Creek Trailhead #819	\N	\N	clra170o60000qh0o4eufy4wk
clra1730x024vqh0o6ktprt8c	37.72213550499931	-107.2592928250929	Thirty Mile Trailhead #814	\N	\N	clra170o60000qh0o4eufy4wk
clra1730z024xqh0opswo0sag	37.73621440589854	-107.1004513734642	Fern Creek Trailhead # 815	\N	\N	clra170o60000qh0o4eufy4wk
clra17311024zqh0o3818p2ue	37.77151871847656	-107.1423844618347	Texas Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173130251qh0o5qy2jjs4	37.68405926039895	-107.0320412576394	Trout Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173150253qh0o0vzvj6ov	37.61582130189647	-107.0449636825686	Copper Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173170255qh0ot3649di4	37.68201661255392	-106.9991392027885	Ivy Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731a0257qh0o2q4kya16	37.71544406845365	-106.9018842883062	Pierce Elliott Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731c0259qh0ohih9tywu	37.70473197604627	-106.6465281990647	Alder Bench Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731e025bqh0osq10g1ho	37.81297697549314	-106.7375844444352	East Bellows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731g025dqh0o5ubv5i80	37.87241694086607	-106.7878088039724	Wheeler Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731i025fqh0ov0hk3g3h	37.84849606774599	-106.9237298929428	Wason Park / Inspiration Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731k025hqh0oeii64tmb	37.82802146091868	-106.8888510910606	Farmer's Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731n025jqh0o7u28ybmv	37.90347062642998	-106.9189778890673	Phoenix Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731p025lqh0ongsqlo1t	37.83988793471183	-106.963045383578	Mckenzie (#804) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731r025nqh0oexh3jt6w	37.54175162659132	-106.8025786623696	Big Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731t025pqh0ohyu5cxkd	37.55419242086223	-106.8026756739334	Hope Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731v025rqh0o5ap0q7h5	37.58123150800076	-106.6499279497862	Cross Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731x025tqh0oc1nszbof	37.55478097749488	-106.4016761255673	West Frisco Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1731z025vqh0oyxapn0ud	37.5566405822017	-106.3963693828445	Middle Frisco Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17322025xqh0oafmv3ddg	37.64271451331224	-106.8048731335723	Highline Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17324025zqh0o84gkrndw	37.6359145295938	-106.6738785737121	Trout Trailhead #831	\N	\N	clra170o60000qh0o4eufy4wk
clra173260261qh0oiqv21iyy	37.64807973208588	-106.651957125839	Beaver Mountain Trailhead #933	\N	\N	clra170o60000qh0o4eufy4wk
clra173280263qh0oic58z5h9	37.61477399869742	-106.6848526766995	Tewksberry Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732b0265qh0oy2ec85rt	37.5609480339655	-106.6901340065942	Tewksberry South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732d0267qh0o3yekrm74	37.61552383734626	-106.8392599878419	Hunter Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732g0269qh0og4iitf1w	37.56218637821939	-106.7696888331784	Lake Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732i026bqh0o3x7zqy2a	37.46035206779368	-106.4147501972673	South Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732l026dqh0odvghchoy	37.44754552049189	-107.504842708302	Pine River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732n026fqh0o4k6txe32	37.62991130015423	-107.806448543819	Purgatory Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732p026hqh0ofn62axfz	37.65273996372224	-107.7735522979601	Spud Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732s026jqh0o8o9l46dl	37.72934010316666	-107.7114709002945	Andrews Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732u026lqh0ol4nmqzcp	37.47730020732141	-107.6314979722456	Endlich Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732w026nqh0or84dep1v	37.46341113269092	-107.6822487114992	Transfer Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1732y026pqh0o5r7rgvku	37.53067917879871	-107.6804167842499	Lime Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17331026rqh0ol2v2fv5l	37.8066511200287	-107.7739615836036	Ice Lake Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17333026tqh0ohj17s6to	37.73191590989227	-107.7502271254808	West Lime Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17335026vqh0o62m9jw51	37.66001028057712	-107.8003828411168	Cascade Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17337026xqh0oyqhvvwh7	37.35600760326219	-107.3254162118118	First Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17339026zqh0o1m3p4lly	37.34651044615669	-107.7032080840585	Shearer Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1733c0271qh0o5cmm5eyf	37.36807951537813	-107.8394293790525	Haflin Creek Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1733e0273qh0oydyk0cel	37.33122072965837	-107.9387957143858	Dry Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1733g0275qh0owenmcc7s	37.34018092143637	-107.9082441976107	Logchutes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1733i0277qh0o6j88lkb6	37.46378868520233	-107.97460384993	Clear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1733l0279qh0o04ud0w3q	37.6299063784251	-107.9158371640254	Upper Hermosa Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1733n027bqh0owpf4sgi3	37.59227857726415	-107.8242395513026	Elbert Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1733p027dqh0oxjkc8l10	37.51162294522355	-107.8200180979289	Goulding Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1733r027fqh0ol4rt95ov	37.45174248177963	-108.0114384337416	Kennebec Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1733t027hqh0oq4tr9e7c	37.50146952774671	-108.5518716692012	Can Do Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1733v027jqh0o35sz39bm	37.47105591277874	-108.5178234189873	McPhee Overlook Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1733y027lqh0or50a0xcp	37.5775406748189	-108.2938732817811	Loading Pen Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17340027nqh0o8sgf4p3y	37.69700567637365	-108.1952495810575	Stoner Mesa Trailhead Upper	\N	\N	clra170o60000qh0o4eufy4wk
clra17342027pqh0oszl9dn5p	37.70010771967979	-108.2550556927043	Gobble Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17344027rqh0o4klv89gh	37.72721545466749	-108.2230240356001	Willow Divide OHV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17346027tqh0oyorhv2cg	37.75201738733175	-108.2315239957908	Fish Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17348027vqh0od82nnqq5	37.79688289831748	-108.0387128922245	Kilpacker Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734a027xqh0oljj6gnup	37.74398853755253	-108.1476024449721	Johnny Bull Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734c027zqh0onr995jy2	37.78141141906905	-108.0281488136524	Calico Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734e0281qh0onqzfdrji	37.79637629545158	-107.9375139637175	Cross Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734h0283qh0o29qoabcf	37.79205904590152	-107.9372066326958	East Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734j0285qh0oejtca8kk	37.58689045147484	-108.1639015149271	Priest Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734l0287qh0o9h9php2z	37.57558374084764	-108.1814497544412	Bear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734n0289qh0okk2rsv9k	37.50857610252443	-108.1237752427094	Gold Run Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734p028bqh0oc79knreq	37.63644823710767	-108.0633219901842	Salt Creek Trailhead Lower	\N	\N	clra170o60000qh0o4eufy4wk
clra1734r028dqh0oxp2zeswi	37.46840142029689	-108.2080357072683	Big Al Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1734t028fqh0oyxxkpst0	37.46196671752934	-108.0950863616852	Sharkstooth Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734v028hqh0o4apueh40	37.46945443487699	-108.2103981230276	Upper Chicken Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734x028jqh0o66alud2d	37.46925288587303	-108.198799094142	Aspen Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1734z028lqh0ob49o8o8b	37.45585944444059	-108.2189597611185	Box Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17351028nqh0o337nespj	37.3028950778359	-107.3363611038776	Sheep Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17354028pqh0ouqj3z0ak	37.43015431791169	-107.1942472528491	Cross Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17356028rqh0oho2w6ado	37.19005597820408	-107.3105893231843	Great Kiva Loop	\N	\N	clra170o60000qh0o4eufy4wk
clra17359028tqh0oqgzvp54b	37.53373978843673	-107.251729431666	Poison Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735b028vqh0o0p0os238	37.5411741916933	-107.1979604580875	Williams Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735d028xqh0oyea5xube	37.51230917912816	-107.1477739233859	Middle Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735f028zqh0o4pqb0fao	37.4790161314741	-107.1020221469643	Piedra Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735h0291qh0oh9g0shy0	37.3258082429566	-107.1427265530043	Newt Jack Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735j0293qh0o3iq2psdu	37.4091602452549	-107.0529558773676	Fourmile Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735l0295qh0oebaofylw	37.37709781805108	-106.9667741454544	Jackson Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735o0297qh0objcucwdl	37.45771526720227	-106.9191164565403	West Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735q0299qh0oqyg9x7ia	37.44265460202771	-106.8773826178485	Treasure Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735t029bqh0otxgy46s7	37.41971323773159	-106.7813160756399	Silver Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735v029dqh0olb0vakdn	37.38714454021565	-106.8467906762597	Sand Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735x029fqh0on2cpwl6j	37.30901723648677	-106.9010887638709	Coal Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1735z029hqh0oenf1xkm0	37.30196132556291	-106.8053296453984	Little Blanco Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17362029jqh0o9fiqcwol	37.22032591103673	-106.7241082718489	Fish Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17364029lqh0obgq4g8uj	37.20391434973838	-106.7624160408225	Opal Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17366029nqh0oa8jehcmn	37.20262500348829	-106.7912817849298	Leche Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17368029pqh0ol5nt9u6q	37.13260203236364	-106.8088838967353	Buckles Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736a029rqh0oofvo6p65	37.10712828988361	-106.8206370798937	Navajo Peak West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736d029tqh0omklaecq4	37.08642785456471	-106.7548452963608	Navajo Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736f029vqh0ouv9p3pm3	37.03245196611604	-106.5543079012967	Chama Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736h029xqh0o20eyeayu	37.08801947136934	-106.4491896423603	Red Lake Upper Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736j029zqh0onlcap16o	37.0862220096019	-106.4121193504264	Red Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736l02a1qh0oc4dgbwpk	37.11594972509438	-106.382450646952	Duck Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736o02a3qh0o5s4j5ovi	37.11970604367994	-106.3766641769022	Elk Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736q02a5qh0o7dsikfvx	37.13351206281461	-106.3595266562634	Hidden Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736s02a7qh0o3hqe6iqd	37.18710167078044	-106.4495122989293	Ruybalid Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736v02a9qh0o6rzllyuv	37.23152212597872	-106.464094410119	Lower South Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736x02abqh0oci188uai	37.30223169792067	-106.6055333388437	Conejos River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1736z02adqh0oii6z4x69	37.31849407980036	-106.5946637088715	Adams Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737102afqh0orsc2i2kb	37.36298322634852	-106.6700326956638	Treasure Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737302ahqh0opxgguwod	37.29096457352124	-106.4964826363591	Bear Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737502ajqh0oac4pclxi	37.2611928096206	-106.4662545423773	Valdez Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737802alqh0omvafrp3q	37.38799894258638	-106.3859502919599	Big Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737a02anqh0o1p32196q	37.28609166892197	-106.4416651022681	Willow Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737c02apqh0o9csd437j	37.3923266091583	-106.3821847475724	Alamosa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737e02arqh0oz7czrt04	37.62355239433654	-105.4729569879803	Lily Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737g02atqh0oeuzltf2f	37.63747821066958	-105.4715396882767	Huerfano Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737i02avqh0oktec5bl9	37.96209154272828	-106.55465852994	Perry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737k02axqh0o7konvh3l	37.97178740189412	-106.5805069716296	Bower's Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737n02azqh0o8e7340qd	37.9433578188123	-106.6230593532644	Upper Deep Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737p02b1qh0of6j2qtik	37.93814215274895	-106.6940636279104	South Fork Saguache Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737r02b3qh0omzed4cxr	38.28037197944636	-106.3018220273945	Middle Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737t02b5qh0otr7je481	38.21157621471858	-105.8230235730218	Black Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737v02b7qh0o70u4nmie	38.17976071229654	-105.8130417765414	Garner Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737x02b9qh0oza392okb	38.17126874815254	-105.8080372531101	Major Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1737z02bbqh0o5xam3hkg	38.13155410256569	-105.7886465832921	Cotton Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738102bdqh0oubftcfo2	38.07864446730102	-105.7604746991879	Rito Alto Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738302bfqh0ok2zq3wc8	38.10051770436554	-105.7705911142236	Wild Cherry Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738602bhqh0o7cllvyip	38.01873041254505	-105.685750869367	North Crestone Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738802bjqh0owzj41wj0	37.98885816014933	-105.6627503688289	Willow Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738a02blqh0op0e28n27	37.93025512254521	-105.457214838793	Grape Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738c02bnqh0o9t61cu72	38.05198201432051	-105.5356252655454	Horn Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738e02bpqh0o7m8t8nv2	38.26643685961908	-105.6839290108633	Rainbow (Lake Creek) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738g02brqh0ov0wbts6s	38.25374925102803	-105.6726219416649	Rainbow (Duckett Creek) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738i02btqh0ogpjt14hq	38.1380932220899	-105.6006617371966	Gibson Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738l02bvqh0o42wlu3vo	37.9645426940689	-105.5457994967978	South Colony Spur Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738n02bxqh0ozty2pafg	37.25461909785628	-105.1094716867967	North Fork-Purgatoire Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738p02bzqh0ool4ha6o2	37.32656825748911	-105.1435134317557	Indian Creek - Bear Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738r02c1qh0obd0chkap	37.35196016049225	-105.1275651636641	Baker Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738t02c3qh0o7yeszz4a	37.37190811490314	-105.1062215630335	Spring Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738v02c5qh0o0y630eqh	37.45752490630033	-105.1279460764816	Indian Creek North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1738y02c7qh0o92z3ojd8	37.34858394962013	-105.0243673464429	Cordova Summit Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739002c9qh0ovhk0t1a7	37.39865209196248	-104.9749406375981	Wahatoya Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739202cbqh0orrylsv5w	37.87839271035936	-104.9580358420168	Bartlett Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739402cdqh0o7a8p0yfo	37.92141447827183	-104.9673902379274	Greenhorn Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739602cfqh0oa18wtyda	37.89391921706557	-105.0416051662261	Greenhorn-Barlett Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739802chqh0ocdn9phhg	37.8890340242447	-105.0992335939572	Turkey Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739a02cjqh0o08tomt69	37.89190281244313	-105.1065634673808	West Cisneros Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739d02clqh0oyu4dkz8v	37.91686155465622	-105.1753168661377	Pole Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739f02cnqh0opzs9q67s	37.98177226856746	-105.0744118766779	East Cisneros Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739h02cpqh0oajic9won	38.03733726480585	-105.0872305491498	St. Charles Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739j02crqh0oqwzef0u4	37.9857269252987	-105.0558947809135	Lake Isabel North Shore Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739l02ctqh0o32fb6n4y	37.94839997775416	-104.9959233643019	Millset East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739n02cvqh0ofydv25j8	37.99579501531546	-105.0021694692579	South San Carlos Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739q02cxqh0onhoc9thj	38.03566649251901	-105.0848939932706	Lion Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739s02czqh0o19kdiwcg	38.01507756527536	-105.0073623864307	North San Carlos Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739u02d1qh0osjh17iti	38.05488484022541	-105.0681248405946	Squirrel Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1739w02d3qh0oa6eyo1g9	37.86140863882484	-103.7305630100577	Sierra Vista Overlook Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1739y02d5qh0ofo3kkmyu	38.04291772593321	-105.0043583374658	Tower Trail Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173a002d7qh0owxlgxbkc	38.05047975286166	-105.0015238239954	Devil's Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173a302d9qh0odrteofxm	38.05661923700124	-105.0728874834436	Second Mace Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173a502dbqh0ojajvfxs1	38.0908129583112	-105.0887967031076	Silver Circle Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173a702ddqh0o51sqxafp	38.0989980042359	-105.0983021978704	North Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173a902dfqh0oj3r2be5y	38.19597055267955	-105.1098524416611	Lewis Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ab02dhqh0okq1arbua	38.26677139178155	-105.1888377157801	Newlin Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ae02djqh0oqc5xnfi9	38.30537139621692	-105.2555554819871	East Bear Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ag02dlqh0ockgou2yh	38.33013118677155	-105.2352184397326	Stultz Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ai02dnqh0o8fnta4fi	38.37376601087323	-105.229662870755	Tanner Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173al02dpqh0oiz9aii49	37.00249374037481	-107.4758964797352	Sambrito Wetlands Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173an02drqh0oysbwdiqp	37.13540709551573	-103.0156476964923	Carrizo Canyon Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173aq02dtqh0o9hi8qlzs	38.04373496371616	-103.4316822662693	Big Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173as02dvqh0ofzqyp22y	38.97061910159805	-106.0580081957565	North Salt Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173au02dxqh0onczupyzo	39.03105133335401	-106.1051671820914	Lynch Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ax02dzqh0o078j182v	39.06825227969547	-106.1164168492566	Rich Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173b002e1qh0o5mqktbpm	39.20822570784225	-106.10069679875	Limber Grove Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173b302e3qh0o6h2nibs8	39.40690871427326	-105.9630932576029	Gold Dust Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173b502e5qh0oc7we12fa	39.41268007377154	-105.7585717345214	Kenosha Pass West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173b702e7qh0ove36rqmc	39.03791130531587	-105.5253654079619	Puma Point Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173b902e9qh0owj2x6bjy	39.43603841220815	-105.5908868570153	Ben Tyler Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bb02ebqh0oleep8v66	39.28437870877978	-105.50855248186	Lost Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bd02edqh0od2tz3atz	39.15372992264045	-105.4780577906099	Twin Eagles Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bf02efqh0oaqylby1w	39.17303093659046	-105.3755556651648	Goose Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bh02ehqh0omlv34ess	39.24623893649282	-105.3544375325564	Wigwam Trailhead #609	\N	\N	clra170o60000qh0o4eufy4wk
clra173bk02ejqh0o8l60jc4d	39.13729461767706	-105.461209952258	Lizard Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bm02elqh0obudaj1d0	39.06551810867003	-105.3611004909588	Platte Springs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bo02enqh0oaefrr6b9	39.06521670363364	-105.3665213288998	Longwater Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bq02epqh0o8fn7r8a4	39.02559475418217	-105.354829379461	Platte River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bs02erqh0ox2e3qxlb	38.96023044181698	-105.3746016243762	Hard Rock Interpretive Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173bu02etqh0ofvne5tpd	39.0578567080621	-105.2185016461984	Signal Butte Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bw02evqh0od1s8a0at	39.49165444287363	-105.8240039751815	Gibson Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173bz02exqh0om51zi8ve	39.4752118701543	-105.7684390520944	Burning Bear South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173c202ezqh0ofxfyxt72	39.51080260486983	-105.7106955515658	Burning Bear East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173c402f1qh0o5mjl501k	39.48167849003929	-105.6932661618413	Threemile Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173c602f3qh0oyatl8nbs	39.47502811340058	-105.685121512819	Geneva Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173c802f5qh0o701upjgr	39.40556585651076	-105.5069211677458	Brookside / Payne Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ca02f7qh0od3rrsd9p	39.34212539409497	-105.3356956217095	Buffalo (Colorado Trail) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173cc02f9qh0o4128gx5c	39.35046444579811	-105.3430925010953	Gashouse Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ce02fbqh0ooa41ck07	39.36544424067608	-105.3779814067885	Miller Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ch02fdqh0osbq8jri6	39.38222367195119	-105.3682448851491	Buck Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173cj02ffqh0o1mq63e56	39.22292256807506	-105.2788347376975	Upper Cheesman Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173cl02fhqh0odu9u9a5t	39.2206623982992	-105.2793410220321	Goose Creek Arm Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173cn02fjqh0ojoou2cs9	39.58252251174456	-105.3608609808204	Lower Maxwell Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173cp02flqh0oeu5yc5e7	39.56247571494375	-105.3767609606928	Upper Maxwell Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173cr02fnqh0o4civbrj7	39.37862824385125	-105.1052015097708	Indian Creek Equestrian Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ct02fpqh0o2ko5ak88	39.37923221697606	-105.1005952200938	Indian Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173cv02frqh0ok8tota3h	39.37621947188801	-105.0956830027672	Rampart Entrance Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173cy02ftqh0okyht0k95	39.30142780844433	-105.1725723851697	Sugar Creek Lower Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173d002fvqh0o4ronys56	39.32202895955423	-105.1290604531076	Sugar Creek Upper Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173d202fxqh0osnbxdrw8	39.28175731844957	-105.1040350132153	Cabin Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173d402fzqh0oa8eiukjn	39.28676537403085	-105.0922901597662	Dutch Fred Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173d602g1qh0o5fg5kcai	38.2729322710826	-104.6001836178332	Fountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173d802g3qh0ob8ljizht	39.34722146901126	-105.0851387030026	Sunset Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173db02g5qh0om5gmwb9u	39.31544991736124	-105.0657812665402	Tomahawk Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dd02g7qh0ofs75ugzq	39.0459413749461	-105.0778015412362	Red Rocks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173df02g9qh0oqzlugk4k	39.08704227563159	-105.0986253660441	Manitou Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dh02gbqh0owov56ei8	39.0182465631916	-105.0412655785168	Lovell Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dj02gdqh0onjxi71ir	38.97783992740259	-105.0090212012024	Rainbow Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dl02gfqh0obrwzc762	38.98019470242936	-104.9590186363581	Rampart Reservoir Dikeside Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dn02ghqh0o1kb46qxe	38.9287292739992	-105.0526026628749	North Catamount Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dp02gjqh0o7gusc4u2	38.87371601292684	-105.1238944589894	Crags Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dr02glqh0oresnmpo1	38.85681883543361	-104.9319154787011	The Incline Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dt02gnqh0o71bl4p5d	38.85579288176655	-104.9338542675818	Barr Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dw02gpqh0oymphxdn5	38.83425898884306	-105.1374535113243	Horsethief Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173dy02grqh0oepz1a54q	39.83986350363185	-106.4223935809614	Elliott's Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173e002gtqh0olpc0hwvc	39.83442535292578	-106.373995533937	Gore Range Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173e202gvqh0ocj7bj4i4	39.81491770423388	-106.4281384285685	Soda Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173e402gxqh0om5urtzht	39.71058158200867	-106.4238285247908	Lower Piney Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173e602gzqh0o7rswxhwz	39.70994420483387	-106.3807596940337	East Lost Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173e802h1qh0o9dbcm6yq	39.69778486827487	-106.4366435854985	West Lost Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ea02h3qh0oqrukl179	39.64605262478426	-106.5167291412994	Buck Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ed02h5qh0oitfusrsa	39.6399230369399	-106.5390081595562	Avon Singletree Connector Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173eg02h7qh0od4l1lwbq	39.65085008432158	-106.541640648187	West Avon Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ei02h9qh0ozxzauyrx	39.6571191406171	-106.5492334755719	O'Neal Spur Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ek02hbqh0oaiz7y2fh	39.37414241557548	-106.4564968607949	Lonesome Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173em02hdqh0ov5n207e4	39.38105092927805	-106.4866793769227	Sopris Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ep02hfqh0oljo37n73	39.39038299651181	-106.4706673866585	Missouri Lake / Fancy Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173er02hhqh0ob37x5vxy	39.9558317249218	-105.3563558783034	Gross Reservoir North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173et02hjqh0ozxirzfry	39.42033504943222	-106.4766834147584	Hunky Dory Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ew02hlqh0oyge514n9	39.5005507952331	-106.4329678266807	Half Moon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ey02hnqh0o9oh4g5sa	39.42868569625211	-106.4110622676495	Whitney Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173f002hpqh0ol0dkoyjd	39.54876725593095	-106.4184092018279	Cross Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173f202hrqh0ozu0rsl3h	39.57656634827035	-106.4176173586674	Martin Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173f402htqh0oz237jlko	39.59681837500213	-106.5227547168516	Turquoise Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173f702hvqh0oo7otn4v8	39.54601230549642	-106.2415683724256	Shrine Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173f902hxqh0o5yqfaobq	39.62779746002436	-106.2750118092486	Gore Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fc02hzqh0o6l6xjpvp	39.54414687536202	-106.2205001633218	Black Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fe02i1qh0o0wpual0z	39.62659262742856	-106.274949873964	Vail Pass / Tenmile Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fg02i3qh0oqoke56ik	39.63915234806895	-106.2952499575813	Bighorn Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fi02i5qh0ovi3oev2d	39.64298780594283	-106.3031347779099	Pitkin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fk02i7qh0on5t9n5v5	39.65063933832423	-106.321009657681	Booth Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fm02i9qh0olheent6t	39.63682776583631	-106.4153268481519	North Trail (Buffehr Creek) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fp02ibqh0op1y42tlu	39.59574576874515	-106.4299751479583	Game Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fr02idqh0ovpvoscb2	40.18981534837103	-107.561545930164	Morapos Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ft02ifqh0oo6t9d4dz	40.02611738933739	-107.503621810662	Papoose Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fu02ihqh0obf260d05	39.89779678618067	-107.534966352291	Pelteir Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fw02ijqh0oi7xwrve0	40.0089322829219	-107.4251576911622	Marvine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173fy02ilqh0ojbyycc87	40.02643482096575	-107.4967260394011	Ute Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173g102inqh0on7bfreu0	40.03886353841733	-107.4862316897463	Big Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173g302ipqh0oc86azhwc	40.0641430471474	-107.3246953227104	Mirror Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173g502irqh0ov32tuuc6	39.89422283954169	-107.5301025832789	Hill Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173g802itqh0o0obbfk2f	39.99403915346149	-107.2433102629567	Himes Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ga02ivqh0ovbnqyfgu	39.99065644255068	-107.2409380227775	Scotts Bay Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gc02ixqh0odrx01wq4	39.99884273528198	-107.2308500238293	Trappers Outlet Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ge02izqh0o4rnpepye	39.99056114093194	-107.243328292406	Wall Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gg02j1qh0oj9xj9xwe	39.99430600049293	-107.2369371736066	Scotts Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gi02j3qh0o0kmq0t3d	40.02794303904471	-107.2727448196163	Big Fish Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gk02j5qh0oft6gclun	40.01818935875813	-107.2490152851237	Lake of The Woods Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gm02j7qh0occbiybas	40.07110832831855	-107.314022439935	Lily Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173go02j9qh0ohbf7k6mg	40.03773716297377	-107.2875795648715	Picket Pin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gq02jbqh0oky9g75jy	40.23385263941061	-107.377612487239	Elk Draw Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gt02jdqh0oww4tgxgy	40.15209977616345	-107.2535215622753	Cyclone Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gv02jfqh0owa47yz5y	40.14181662509339	-107.2348620711399	Transfer Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gx02jhqh0o72tki752	40.02754578776737	-107.1234069740386	Stillwater Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173gz02jjqh0ous53wfcx	40.03235484133741	-107.1145059384637	Smith Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173h102jlqh0oavj0q2tp	40.04580414729315	-107.0751095018266	Mandall Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173h302jnqh0ord4bjdfh	40.14971374308695	-107.138935889979	Sheriff Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173h502jpqh0o0l3iqpyc	40.16526471375293	-107.2183615766752	Baldy Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173h702jrqh0of9zm9xl8	40.04578527324674	-107.0161341779703	Gardner Park Wildlife Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173ha02jtqh0obwzaurl4	40.0551312807339	-107.0311620962166	Heart Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173hc02jvqh0on10101qs	40.16715138139283	-107.0582146757364	Allen Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173he02jxqh0o72e3rau0	40.27245083082673	-106.6142949567625	Routt Divide Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173hg02jzqh0o5837jcb0	40.29493347256801	-106.8006716373059	Lower Sarvis Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173hi02k1qh0ozc1ahtta	40.25960722378275	-106.610984392221	Upper Sarvis Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173hl02k3qh0o7b7thm4a	40.28863094699231	-106.8251982031784	Tailwater Anglers Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173hn02k5qh0o95b5zdcn	40.22221303018203	-106.779599320172	Lower Silver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ho02k7qh0onlr8efgq	40.19760459089782	-106.6065084756942	Upper Silver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173hr02k9qh0o0jqj2tbr	40.17236077987445	-106.7469768868787	Morrison Divide North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ht02kbqh0om8mzz8wz	40.10705408254218	-106.6872872062808	Morrison Divide South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173hv02kdqh0omg1fhy3c	40.11151198003538	-106.6780785762238	Tepee Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173hx02kfqh0om62xc78b	40.08960821674431	-106.6246987584776	Tepee Creek East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173hz02khqh0ob8i8h3vh	40.22014056087419	-107.2214933072352	Gill Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173i102kjqh0o8aarla1v	37.38349699995184	-108.8039181347014	Rock Creek OHV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173i402klqh0ob8nhkywf	37.34152958611628	-108.8177464324483	Sand Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173i602knqh0o65tdeg3j	37.39995936461756	-108.7752145930768	Sand Canyon Pueblo Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173i802kpqh0o6edm06lr	37.40918171054837	-109.0334644811187	Horseshoe-Hackberry Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ia02krqh0oee7457ua	37.39989553910531	-109.0403165747127	Holly Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173id02ktqh0ol1bi05qv	37.44351274587508	-108.9825812717847	Cutthroat Lower (4WD) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ig02kvqh0o871u52ki	37.44622599993853	-108.973332996822	Cutthroat Upper Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ij02kxqh0opbi8muor	37.45423148755399	-108.971576223162	Painted Hand Pueblo Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173il02kzqh0oms1yk4nf	37.58508453092904	-108.919347692045	Lowry Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173in02l1qh0ol45fwhfi	37.19599736308101	-108.5377645866535	Wetherill Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173iq02l3qh0o710kgq0p	37.27632210321938	-108.4830638877387	Geologic Overlook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173is02l5qh0ootqqhj7w	37.2795494708629	-108.4620350454592	Park Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173iu02l7qh0ojzsibx8c	37.3042599336005	-108.425370699282	Knife Edge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ix02l9qh0ov9d52gg0	37.30701717068543	-108.4201006450238	Point Lookout Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173iz02lbqh0op517vetf	37.29677700898523	-108.4183507920313	Prater Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173j102ldqh0o2kuq9gxn	37.23799987429977	-108.5040073509281	Far View Sites Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173j402lfqh0ov8ew0cym	37.16756857506079	-108.4699049796362	Soda Canyon Overlook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173j602lhqh0o7q16ufzf	39.10874509949028	-108.7014016675593	Lower Monument Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173j802ljqh0ofn9pffx9	39.07783961856622	-108.727956810586	Upper Monument Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ja02llqh0o906baecb	39.06806815910861	-108.6601367253154	Wildwood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173jc02lnqh0o36f7ivof	39.05547990543041	-108.736937498812	Upper Liberty Cap Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173jf02lpqh0omd6l87k9	39.03693958730538	-108.7089609734944	Ute Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173jh02lrqh0o8jqh0830	39.10111682852773	-108.7351285430618	Alcove Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173jk02ltqh0oovn56i99	39.10480429138494	-108.7284307491422	Window Rock Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173jm02lvqh0os7lpml0i	39.10089892911266	-108.7348866715736	Canyon Rim Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173jo02lxqh0o4zinwz2v	39.09600682177055	-108.7327805937565	Otto's Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173jq02lzqh0o944ffepf	39.03333449129478	-108.6458354196877	Serpents Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173js02m1qh0o7e8lzsc7	39.03191171450091	-108.6308364564349	Devils Kitchen Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ju02m3qh0oig6wbmn9	38.98667140521438	-108.6993072524831	Upper No Thoroughfare Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173jw02m5qh0o0w0j8b82	37.75805955188679	-105.5011751117706	Point of No Return Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173jz02m7qh0o9oadtp2j	37.80089898845608	-105.5003703791071	Sand Ramp Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173k102m9qh0o2l7khp2r	37.92455608760929	-105.4878046419965	Music Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173k302mbqh0o9i3k2ywv	37.73270658082612	-105.5123046262228	Great Sand Dunes Interpretive Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173k502mdqh0oc7vzgewf	37.73420727801815	-105.5085796723558	Mosca Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173k702mfqh0oocqijo69	37.73950532504691	-105.5171073622452	Dunes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173k902mhqh0onoaixpcd	39.80573525982371	-107.7355874179324	Upper Three Forks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173kc02mjqh0onz4lvrw6	38.07770649408864	-105.5663194862543	Alvarado Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ke02mlqh0ok3jarpvb	38.08240432959239	-105.5644691615561	Comanche/Venable Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173kh02mnqh0o00yek0l7	37.92151516263251	-107.3373697354337	Williams Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173kj02mpqh0ooy1eccwi	38.56252484469582	-107.741910494813	Warner Point Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173kl02mrqh0odix2j68m	38.57631615061748	-107.7205314589938	Cedar Point Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173kn02mtqh0o28wfeezu	38.56204270736856	-107.677430544688	Deadhorse Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173kp02mvqh0ol3tg4n1o	38.58672485836193	-107.7051512540815	North Vista Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173kr02mxqh0obicy2djb	38.58502962306508	-107.7088385429927	Chasm View Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173kt02mzqh0ow6hqpp75	40.24383500951465	-108.9727541821485	Cold Desert Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173kv02n1qh0ojzvdqxuq	40.45010543038993	-108.5236358537239	The Steps Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173kx02n3qh0ogzdlpqqm	40.52397271817451	-109.0197420267742	Harpers Corner Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173kz02n5qh0omlgcjcqe	40.72320785912311	-108.8877593830076	Gates of Lodore Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173l102n7qh0ope443u9d	37.26520166640096	-107.0080212406479	Spa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173l302n9qh0ovj1ez6p5	37.26856133456273	-106.9988430677899	San Juan Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173l502nbqh0oykjybte6	39.63292547943023	-106.5279716108159	Elk Lot Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173l702ndqh0o7f6c87bw	39.65307715641364	-106.5874575080605	Berry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173l902nfqh0o7qwudovq	39.64954991802862	-106.9922015425942	 	\N	\N	clra170o60000qh0o4eufy4wk
clra173lc02nhqh0odsawceyw	39.6435051518439	-107.0254234294066	Duck Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173le02njqh0ov9c17qbe	40.05614132156265	-105.0467785634052	Coal Creek Trailhead at Reliance Park	\N	\N	clra170o60000qh0o4eufy4wk
clra173lg02nlqh0o5h7tgkr9	40.04420507631124	-105.0425150670035	Coal Creek Trailhead at Erie Pkwy	\N	\N	clra170o60000qh0o4eufy4wk
clra173li02nnqh0owgsd67tp	38.92692609906495	-105.2817032514978	Hornbek Homestead Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173lk02npqh0of3ypmduz	39.40848722590683	-105.1713030847271	North Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173lm02nrqh0oxajv5e4n	38.83086323867889	-106.1777230839041	Buena Vista Wildlife Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173lp02ntqh0oq2c32s9n	38.84148060491788	-106.1305398272307	Buena Vista Railroad Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173lr02nvqh0odpifgnag	38.81705965798837	-106.0866616659345	Collegiate Peaks Outlook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173lt02nxqh0o7weh8bqh	38.83020698137988	-106.085759496947	Midland West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173lv02nzqh0ocio94v20	38.79209950669267	-106.0853473281495	Chinaman / Carnage Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173lx02o1qh0ony8zwsu7	38.83122874864816	-105.9879682001251	Bald Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173lz02o3qh0oq4pt7yvv	38.84616824478367	-106.0176787492737	McGee Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173m102o5qh0o57qylmfa	38.84931631473783	-105.982384658473	Mushroom Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173m302o7qh0o6xgi47af	39.93671469359635	-105.3726560110377	Osprey Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173m602o9qh0o8jgt1vk6	38.98184452338706	-105.1062252596217	Lower Trout Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173m802obqh0o97wz6jf9	39.00246080331522	-105.1642551836677	Rule Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173mb02odqh0os1n5mouq	39.26952907742604	-105.1049965580038	Devil's Head Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173md02ofqh0oo1s6mkar	38.53116993493501	-106.0111388188231	Monarch Spur (Holman) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173mf02ohqh0ocx2tpbyd	39.02598305753414	-105.2451235167165	Phantom Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173mh02ojqh0ofvhw2se5	37.83651377115968	-106.2718075204044	Witches Canyon Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173mj02olqh0o3pt6fm0t	37.83794888886505	-106.2942283063471	Witches Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ml02onqh0ogi9tk8bv	37.82784957756121	-106.2764849854614	Road 5207e Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173mo02opqh0ov78xyph6	37.84837285218813	-106.2766080345917	Iglesia de San Juan Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173mq02orqh0o58po4wlz	37.84332781894711	-106.2858216019553	Penitente Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ms02otqh0ozzyv32oq	37.81683361600765	-106.283666491933	La Garita Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173mu02ovqh0oejkh9ln3	38.51284598663546	-105.9805744266087	Salida Trails - Burmac Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173mw02oxqh0o7y9ill5u	38.50042091348639	-106.0041346763908	Little Rainbow (CR108) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173mz02ozqh0o4hj4pze7	38.50221234823334	-106.0257751847268	Salida Trails - County Road 110 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173n102p1qh0ouj0nmsr8	38.75210908479742	-106.0657452401615	Ruby Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173n302p3qh0o9wj8vzps	38.45375845867567	-107.4139307104506	Curecanti Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173n502p5qh0o6i217b1q	38.45024205922616	-107.3452146382312	Pine Creek Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173n702p7qh0o5jsbc0oa	38.51503833662058	-107.0183333907687	Neversink Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173n902p9qh0oy61qb88k	38.46343818724073	-107.518823563307	Hermits Rest Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173nb02pbqh0o5timupbz	38.45271825679676	-107.5443978534182	Mesa Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ne02pdqh0ova35d3v0	40.00544824794245	-105.9179670492838	Red Dirt Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ng02pfqh0o5h0fvf4e	40.05316070503029	-105.9102477037023	Village Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ni02phqh0o9ekaihkl	40.06390378832899	-105.9189036113455	Ten Mile Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173nk02pjqh0o4ozw1mbv	40.08222625243882	-105.9314880534824	Kaibab Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173nm02plqh0oi93gaggb	37.72849606844888	-106.3104452996848	Elephant Rocks South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173no02pnqh0o42azo3r4	37.6853919460339	-106.352388935455	River Walk Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173nq02ppqh0o2yzwlebf	37.6719819538797	-106.3507098634885	Chico Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173nt02prqh0oy4dwaeka	37.67122162401988	-106.3542851424499	Spruce Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173nv02ptqh0ouq8grtmi	37.67264075261313	-106.3555815509288	Columbia Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173nx02pvqh0otzsgnvdv	37.67890792235135	-106.3616050418125	Lookout Mountain Gateway	\N	\N	clra170o60000qh0o4eufy4wk
clra173nz02pxqh0oge3e1shu	37.65768725771748	-106.3618031901717	Pronghorn North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173o102pzqh0o3k86xo0d	37.64450175906633	-106.3661617774017	Pronghorn South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173o402q1qh0ouvngk3xw	37.62981782167132	-106.2525476940987	Limekiln Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173o602q3qh0o3ij5tura	37.53467199138522	-106.2266834134237	Dry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173o802q5qh0osy81vju0	37.15363183256527	-105.81721341611	John James North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173oa02q7qh0o2i57f940	37.11235018095115	-105.8322612290593	John James South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173oc02q9qh0oxm83f99z	37.92931144596446	-107.51426315366	Upper Lake Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173oe02qbqh0o6ql95bbq	37.92016308185534	-107.516487192721	American Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173og02qdqh0oxe0gyqmc	40.6826606173153	-105.4648579629699	Mountain Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173oi02qfqh0otr0te9q0	37.94376732158761	-107.4717441514353	Cooper Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ok02qhqh0o55q6i8k3	37.88364171588159	-107.4856196164243	Cuba Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173on02qjqh0o4vzuu2f5	38.01952999250784	-107.358390331218	Alpine Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173op02qlqh0o5fq0jy7b	38.01595178394562	-107.6631952795607	Portland Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173or02qnqh0o2fasqo5t	39.63022810890155	-104.8537531704221	Prairie Loop Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173ot02qpqh0o3m6mdey8	38.01609816501885	-107.6720219901391	Ice Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ov02qrqh0olv88tm13	38.02200450325454	-107.6605323180553	Upper Cascade Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173oy02qtqh0oe6ixtnqt	38.02437826966635	-107.6628502164142	Lower Cascade Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173p002qvqh0o20s8mqs4	38.02483572289345	-107.6658840714544	8th Avenue Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173p202qxqh0o749lgwc1	38.02944931905726	-107.673047943327	Ouray Visitors Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173p402qzqh0olob7tp2w	37.83474272177204	-106.6625818611412	La Garita SD Cut-off Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173p602r1qh0oyjd1wzxq	39.48698482499738	-105.0908893663337	South Platte Canyon Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173p802r3qh0oia3xfzh2	39.52952395973841	-105.0541033089775	North Roxborough Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173pa02r5qh0o414bqpyc	39.55056474371187	-105.0415695988159	High Line Canal Carder Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173pc02r7qh0on7k0577p	39.56444248750532	-104.997144728692	High Line Canal County Line Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173pf02r9qh0ojvs54y87	39.56271835044329	-105.0238476517884	Fly'n B Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ph02rbqh0onm5vgfk8	39.56156635452982	-104.9412109660157	David A Lorenz Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173pj02rdqh0oqntnh0rq	39.60061473357631	-104.9793224578426	Milliken Park	\N	\N	clra170o60000qh0o4eufy4wk
clra173pl02rfqh0or5mrf0nb	39.60014336102373	-104.9579844317375	deKoevend Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173pn02rhqh0o213u9iza	39.57267762881408	-105.0104522068982	Writers Vista Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173pp02rjqh0o7feq7qkq	39.63500704757235	-104.9322665255396	High Line Canal Dahlia Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173pr02rlqh0o01ijoz0j	39.60993024129454	-104.9408776086469	High Line Canal Orchard Rd Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173pu02rnqh0o5c1021t4	39.64270430186046	-104.940727997512	Three Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173px02rpqh0orf37p50h	37.79321339323045	-107.5777039967446	Highland Mary Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173pz02rrqh0o3cexfrrf	39.65952800463929	-104.9381440257907	Eisenhower Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173q102rtqh0oi1doa9md	39.66630335032281	-104.9062917753273	Bible Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173q302rvqh0oq14qwxj0	39.70456702040323	-104.8617719060829	Expo Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173q502rxqh0oegao6x9x	39.68183446278734	-104.8869905250798	South Quebec Way Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173q802rzqh0o9qreszzq	39.66390122005369	-105.202573667027	Trading Post Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173qa02s1qh0on6ie10mu	39.22469878323288	-106.3906256975508	Evergreen Lakes Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173qc02s3qh0opgqyf9ns	39.54534434328938	-104.7827431097694	USMC CPL David M Sonka Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173qe02s5qh0oy0d546rz	39.59360507960606	-104.8157931284817	Arapahoe Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173qh02s7qh0o30qirtdq	39.61535010319916	-104.675436134024	Aurora Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173qj02s9qh0oa0syffcg	39.62025434660661	-104.6552295597432	Triple Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ql02sbqh0oae4t4d15	40.86296667555742	-109.0222687076604	Beaver Creek Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173qo02sdqh0olsf7mxph	39.34440093232487	-105.2837570327231	Shinglemill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173qq02sfqh0oncesoq39	37.78099559029566	-107.5795552332627	Highland Mary Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173qs02shqh0ol248bkt0	37.78261525637941	-107.5805703031164	Cunningham Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173qu02sjqh0op1d8u1nb	37.97422829470622	-107.585222919565	Engineer Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173qx02slqh0ovf84qxgc	38.02156998315907	-107.3293938196866	Henson Creek ATV Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra173qz02snqh0othtl4uww	38.01074418597135	-107.3113883125513	Lake City Ski Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173r102spqh0oq9zadkuo	39.98975077115652	-106.5081664601973	Gore Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173r302srqh0oeoeqev4k	39.92062372893616	-106.1151546204232	Morgan Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173r502stqh0o5xd6cw0n	39.74148012839868	-105.5147529319087	Harold A. Anderson Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173r702svqh0owao1hvjw	38.88729759983789	-107.004737077408	Lower Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173rb02sxqh0o7537kpyf	40.87819665109801	-106.9044003921878	Ellis North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173rd02szqh0ocma4l4my	39.01275573323728	-104.2631866609823	Paint Mines South Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173rf02t1qh0o0yzqndev	39.0204478144247	-104.2741480448133	Paint Mines North Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173rh02t3qh0ouym88543	39.01476768742904	-104.2718018547709	Paint Mines West Overlook Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173rj02t5qh0opruacq0h	38.88151824934888	-104.9495905260717	Waldo Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173rl02t7qh0oi5q1e806	38.7991378526225	-104.8835071371716	Lower Captain Jack's Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173rn02t9qh0ox0xhqxnr	38.78879848517352	-104.9029231983018	Silver Cascade Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173rp02tbqh0oz52qvz6f	38.78883602727135	-104.9016689987855	Upper Columbine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173rs02tdqh0oewjogw6z	38.79168760873105	-104.879084118865	Middle Columbine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ru02tfqh0ozm2vi80r	38.79141985707788	-104.8658853411273	Lower Columbine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173rw02thqh0od02tk6km	38.79160630075224	-104.868679306697	Chamberlain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ry02tjqh0owwj7ze4r	38.79183552675634	-104.8870947693247	Mt. Cutler Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173s002tlqh0o5pa2orcr	38.85678141127314	-104.9287533743027	Iron Spring Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173s202tnqh0oai2opdeg	38.84276624177948	-104.9032052582377	Crystal Park Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173s402tpqh0oxr3792sw	38.82284902946359	-104.8903763430009	Section 16 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173s602trqh0o0sntjoge	38.85336173491723	-104.8794499827737	Red Rock Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173s802ttqh0omzfmhfqn	38.84857990037618	-104.8732467298421	Hogback Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sb02tvqh0ozgqcv9d3	38.81897614639507	-104.8838189811824	Bear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sd02txqh0o8a4si7mv	38.74256073427894	-104.9128957700683	Saint Peters Dome Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sf02tzqh0ol3no7xvw	38.87761761624437	-104.7777317442392	North Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sh02u1qh0o7zffcc3m	38.87991215409257	-104.7723858133734	Yucca Flats Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sj02u3qh0ouwzuqlod	38.87789067445819	-104.7699779361413	Sentinel Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sl02u5qh0osc5dtfqj	38.87228951765499	-104.7647647475168	Council Grounds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173so02u7qh0od055bswq	38.86846534366145	-104.7604073527168	The Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sr02u9qh0olefburpg	38.44387957688138	-107.6402313461287	Cerro Summit Recreation Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173st02ubqh0om6dfkv80	38.43920022285536	-107.6386343478034	Cerro Summit Recreation Area Upper Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sv02udqh0oaqtm6boz	39.07115611275915	-104.9321037979985	Mount Herman Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sx02ufqh0o4e0l6pzv	38.03954078397415	-107.6823454548849	Silvershield Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173sz02uhqh0oy3rg46iv	38.73147916949943	-104.9067011688248	Gray Back Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173t202ujqh0ox8hp3qyx	38.73754094597189	-108.2674013455382	McCarty Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173t402ulqh0oidrm9iuf	38.81087738134876	-108.2799351816543	Wells Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173t702unqh0o09vdltut	38.83302248760815	-108.4798677486865	Cactus Park Wilderness Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173t902upqh0oq21kuzn1	38.87203222220221	-108.5028569581809	Cactus Park Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra173tb02urqh0o9bqbvs6n	38.74513521405474	-108.5498299336898	Upper Big Dominguez Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173td02utqh0oruydy6vu	38.8494099868105	-108.3724801253694	Bridgeport Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173tf02uvqh0o4hm2emjx	39.79722594464378	-104.9310460454777	Sand Creek – Dahlia Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173th02uxqh0ovazmpt5e	39.81243692714679	-104.9591393555165	Platte River Greenway (York) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173tj02uzqh0o2s04radj	39.82357660490943	-104.9410981260679	Fernald Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173tm02v1qh0o56pgsmc3	39.83933504942276	-104.9494927299297	Platte River Greenway (Steele St) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173to02v3qh0o30rcn9ua	39.85209900111733	-104.9394006032327	Platte River Greenway (Gravel Lakes) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173tq02v5qh0ofw3pyauf	37.438460286343	-105.8030494732043	Rio Grande Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173ts02v7qh0oo57urue9	37.36850954204599	-105.7501762720895	Bluff Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173tu02v9qh0obe78exwc	39.59015911054105	-106.0068472793115	Soda Creek South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173tw02vbqh0o8ymtj2dy	39.56673283674149	-106.0489568707258	Blue River Open Space Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ty02vdqh0ootax41ug	39.71547848749219	-105.3091945059499	Beaver Brook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173u002vfqh0on1pzrcl0	39.70250331620474	-105.2881725472691	Genesee Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173u302vhqh0o00ecsjgk	39.70913437740915	-105.2979211222726	Bison Meadow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173u502vjqh0oms4ussac	39.69571954652836	-105.3549713408959	Fillius Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173u702vlqh0ov1lw5n9r	39.69067894989833	-105.3619633128422	Bergen Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173u902vnqh0ovjwdk47k	39.6646231994416	-105.2788304899703	Corwina Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ub02vpqh0ofyzy5t2l	39.63547326607124	-105.332581337908	Dedisse Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ud02vrqh0ojfs32tsf	39.66290749457407	-105.249238339428	Little Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173uf02vtqh0odbe2mc0c	39.73343720590135	-105.2390613747462	Buffalo Bill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ui02vvqh0ofsok85sd	39.73112278061237	-105.2413431105112	Lookout Mountain Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173uk02vxqh0ol3t32bv7	39.66140370789702	-105.2847109664401	Panorama Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173um02vzqh0o9o0llyqw	39.65515872469349	-105.2885049646924	West Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173uo02w1qh0o2dnyoee1	39.63530575950018	-105.2793771229372	Pence Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173yh02zjqh0orsdvba2r	38.43040634630423	-107.9851268102815	Rimrocker Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173uq02w3qh0ofbqms656	39.76171319432118	-105.6923357934513	Paw Educational Site for Universal Design Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173ut02w5qh0o2ovizzuz	39.12099519690466	-108.3207006448929	Palisade Rim Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173uv02w7qh0oo7ys0qco	39.09698476273706	-108.3606539904659	Tilman Bishop Wildlife Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ux02w9qh0oyycp9u13	39.431556362194	-107.8313011053709	Beaver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173uz02wbqh0obnu350fm	39.94449712985347	-108.7584038155001	East Four–Mile Draw Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173v102wdqh0o09j6fwhi	40.04716052143105	-108.1431703506539	Smith Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173v302wfqh0o5ha3ppgh	37.82218924052797	-106.6050422690994	Cathedral Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173v602whqh0oczp0yc8a	37.9366994284967	-106.5618995583473	Miner's Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173v802wjqh0oz9n4rbfw	37.755502298238	-106.6864209482241	West Alder Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173va02wlqh0ofs4fus1h	37.71858923853257	-106.6452715434783	Middle Alder Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vc02wnqh0onmg6pxqi	37.73001652424421	-106.6214500372995	Bear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ve02wpqh0o8pxbmjno	37.56577577518281	-105.6953770016286	Blanca Wetlands Snipe Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vg02wrqh0ogj82jj6r	37.55620975240924	-105.7064652144259	Blanca Wetlands Alkali Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vj02wtqh0oyen0sd1s	37.54753977678628	-105.7288522032944	Blanca Wetlands Axel Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vl02wvqh0o7umd5x4m	37.5598172419156	-105.70498087075	Blanca Wetlands Watchable Wildlife Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vn02wxqh0oxfgr338u	37.56607009286412	-105.7209195309285	Blanca Wetlands North Honker Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vp02wzqh0olv3ndlhi	37.57077228005972	-105.6813691948515	Blanca Wetlands North Mallard Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vr02x1qh0o1369i841	37.55504220388664	-105.684418114825	Blanca Wetlands South Mallard Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vt02x3qh0o45dejpw6	40.41680517539702	-104.7873439080794	Funplex Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vv02x5qh0os0jy5lvu	39.35454887797732	-106.3530571713924	Wurts Ditch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173vx02x7qh0oq4ox5l6p	37.48581275987812	-106.144622674654	Monte Vista Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173vz02x9qh0on66ealm4	37.48151506105426	-106.281164016074	Bishop Rock Play Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173w102xbqh0oyf5xdooz	37.49161934958868	-105.8855418453504	 	\N	\N	clra170o60000qh0o4eufy4wk
clra173w302xdqh0ocmm3jxmc	37.47626503830489	-105.8667299029157	Twin Peaks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173w602xfqh0occyp5q16	37.4814308107408	-105.8681472011347	Blanca Vista Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173w802xhqh0o1zy3vjue	37.90080908443077	-107.4330046719604	Cataract Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wa02xjqh0osggyo842	37.34940959665951	-108.495253874891	Phils World Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wc02xlqh0opnnvlcqh	37.37575182308661	-105.1008629375285	Dikes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173we02xnqh0o702gm0he	37.5046583680444	-105.0068027143326	School Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173wg02xpqh0oaqn19j4l	37.34907188253688	-105.0425061466329	Chaparral Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wi02xrqh0om4s3vxxs	37.34397881893684	-104.991261370507	Apishapa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wk02xtqh0oaz25npbr	38.86729512211687	-106.9861363560535	Crested Butte Nordic Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wm02xvqh0ovojxiy14	38.91927741881941	-106.9603809546016	Snodgrass Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wp02xxqh0o0hbld2bj	38.86059373246072	-106.9731349668985	Baxter Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wr02xzqh0omrhmuf7y	38.96731599874133	-107.0427683305409	Washington Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wt02y1qh0ob6c3xcjw	38.98206775339211	-107.0071500034056	Washington Gulch (Gothic Campground) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wv02y3qh0ozepndu8s	38.55897906162782	-106.9358967235773	Gunnison River SWA Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wx02y5qh0ogqt8abxg	39.57686322500645	-106.0913154736734	Frisco Bay Marina Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173wz02y7qh0osy1ljoxl	40.03977869213253	-107.9251016075927	Ute Park (Hill St.) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173x102y9qh0oqb4rvhf2	40.04902270571407	-107.913888938351	Sanderson Hills Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173x302ybqh0oqiblvqmv	40.03286217499649	-107.9184132777027	10th Street Bridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173x502ydqh0oakokugix	40.41804750195828	-104.7940368713844	71st Avenue Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173x702yfqh0ok35a7eh4	40.1063096007957	-107.2967653218303	Lost Lakes-Pagoda Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173x902yhqh0oggj9lthb	38.50550535419554	-106.9411956598844	Base Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xb02yjqh0o111ouple	38.50506679875977	-106.951040509218	Kill Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xd02ylqh0ofp4x5ref	38.49884092941251	-106.9875445833331	Motorcycle Terrain Park Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra173xf02ynqh0oqmaxqrs4	38.46468537698511	-106.943433195041	Bambi's Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xh02ypqh0o6prmtpb3	38.50058431164924	-106.9929940880081	McCabe Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xj02yrqh0oc2piaq9v	38.17440725631744	-107.7325404974097	Ridgway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xl02ytqh0oo19y8yjl	39.13301269617774	-108.736227076508	Dinosaur Hill Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra173xo02yvqh0og31ksja8	40.43521682162414	-104.7276993642223	Ramseier Farm Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xq02yxqh0o54f2lfo1	38.01797891447318	-107.6652466207089	Baby Bathtubs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xs02yzqh0oh2jr7vdq	38.01792108438316	-107.6775861779131	Box Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xu02z1qh0ovt2ravtr	38.00447869065764	-107.9463210923634	Whipple Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xw02z3qh0owlmyyztl	39.3997935972878	-107.3379313985598	Sunlight Mountain Resort Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173xz02z5qh0o8nkxu9b9	38.42152880676326	-107.9192010192102	Mailbox Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173y102z7qh0ou9g193s2	38.42121337963425	-107.9317360806298	Spring Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173y402z9qh0ogr1uajzl	38.47088543402764	-107.884466508002	Cerise Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173y602zbqh0o96c25ogd	38.46470157607137	-107.8792250379062	Riverbottom Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173y802zdqh0ornzaitdk	38.44221554576089	-107.8727963805449	Chipeta Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ya02zfqh0ovxvlfbmw	38.42614048386601	-107.8607286516011	Valley Lawn Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173yd02zhqh0o7i3p8tti	38.4555103474416	-107.8806340534767	Sunset Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173yj02zlqh0oxmryt5gv	38.98855453004644	-108.617386621847	Bangs Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ym02znqh0oit11roz8	39.01817854009474	-108.6097740048245	Little Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173yo02zpqh0o6ubs68vn	39.05004684075013	-108.6054618702282	Tabeguache Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173yq02zrqh0o87xbhcu2	38.51478833379528	-108.0112033634371	Dry Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ys02ztqh0ov3kqw9n9	38.99322262239063	-108.6249165054687	Old Kiln Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173yv02zvqh0oiox1njdr	39.00305467237282	-108.6076521836678	Third Flats Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173yx02zxqh0oztzs51u4	39.02534061251558	-108.6057026776942	Gunny Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173yz02zzqh0opyqktmx9	39.04576621290309	-108.5867788028464	Mile Marker 12 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173z10301qh0oudr6gohp	38.99473346306888	-108.6425379290109	Ribbon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173z30303qh0on07vl5tq	39.14766723450258	-108.7466668291777	Snooks Bottom Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173z50305qh0oxnjmfwjd	39.0626878362725	-108.4522959301407	Clifton Nature Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173z70307qh0o4ycv5bqt	39.05207809800957	-108.5460641828439	Eagle Rim Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173z90309qh0odb472inl	39.05532263919719	-108.5604555811064	Watson Island Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173zb030bqh0ozhpx3sxs	39.06754502766071	-108.5798136013491	Riverside Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173ze030dqh0oluauab01	39.08180477590578	-108.5917077061163	 	\N	\N	clra170o60000qh0o4eufy4wk
clra173zi030fqh0ooa4p42q7	39.0893598122845	-108.6118174611243	Blue Heron Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173zk030hqh0ogy3r2j5w	39.08891263833821	-108.6190737262775	Monument View Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173zn030jqh0oeqvzz64u	39.15235614963834	-108.7313932409476	Heritage Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173zp030lqh0o1fwevkve	39.0325231494511	-108.5250918614194	Orchard Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173zr030nqh0olq6qb9ks	38.99184938348122	-108.4731651533183	Old Spanish Trail Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173zt030pqh0os5y0sl1j	38.78501929148593	-108.6030260710698	Divide Forks North ATV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173zv030rqh0oaa2zd7sb	39.75276190869655	-106.7653672414482	Blue Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra173zy030tqh0obdqihpoa	38.9736900189818	-108.4624722965752	East Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17400030vqh0oi7xphfz9	38.95285311445954	-108.4768961315716	 	\N	\N	clra170o60000qh0o4eufy4wk
clra17402030xqh0o92poi2nm	39.21662178933074	-108.9549433838612	Rabbits Ear Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17404030zqh0oawufsu89	39.18356367568328	-109.0102093833721	Practice Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174060311qh0ofb9f7ath	39.15850831564868	-109.0341570467007	McDonald Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174080313qh0ozl8pp2nz	39.19354455042532	-109.0201160793083	Trail Through Time	\N	\N	clra170o60000qh0o4eufy4wk
clra1740b0315qh0o1l4vx59r	39.09663462136494	-108.842842107931	Mee Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1740d0317qh0o5wkgy868	39.13714036578759	-108.8334339293008	Rattlesnake Arches Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1740f0319qh0ojesnj0gs	39.05505225776071	-108.7449611184314	 	\N	\N	clra170o60000qh0o4eufy4wk
clra1740h031bqh0owfmocaoy	39.05204798119159	-108.9044953227492	Knowles Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1740j031dqh0opchg3wjh	39.0386783067664	-108.9550382275809	Jones Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1740l031fqh0o08w23jcb	39.06636667163601	-108.6055291369596	Duck Pond Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1740n031hqh0onj62rcz2	39.07764041655523	-108.6181895838038	 	\N	\N	clra170o60000qh0o4eufy4wk
clra1740p031jqh0onh3uakga	39.05750622852384	-108.465233428632	Corn Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1740r031lqh0opsv7yt3w	39.14407077787308	-108.7581992636229	Opal Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1740u031nqh0ou6eypvc8	39.15148582898798	-108.7629232584604	Fruita Paleo Area Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1740w031pqh0ocnrjk0r5	39.15582972402215	-108.7790755254292	Pollock Bench Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1740y031rqh0ou3wfnr5o	39.13982109921379	-108.7561573682119	Devils Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17410031tqh0ovjhvw5f1	39.2184787312175	-108.8823703687974	Troy Built Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17412031vqh0o4r27hchp	39.21089135151411	-108.8716483948088	Mack Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17414031xqh0oqm8bpsl6	39.17337221391722	-108.8296140889971	Rustler's Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17417031zqh0os2rtilzw	39.19712887331028	-108.8586561813316	Lion Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174190321qh0oscnqmpc5	39.17788325994662	-108.8278153788688	Kokopelli Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741b0323qh0owhcfuha8	39.31006839843737	-108.7059490882753	North Fruita Desert Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741e0325qh0og7ki32pt	39.33495921301236	-108.7004671582413	18 Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741g0327qh0o5a611uzx	38.09756030275104	-108.3510742448639	 	\N	\N	clra170o60000qh0o4eufy4wk
clra1741h0329qh0o9lq1veub	38.14209498933164	-108.3354097976283	McKee Draw Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741j032bqh0ob8mkhgqj	38.27729901292118	-108.0784061882951	Spring Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741m032dqh0o6ru6qtcz	38.33407073456262	-108.1250645918066	Silesca Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741o032fqh0otchd8os0	38.01533678721529	-108.0498928919795	Angell Lode Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741q032hqh0oscc0mnr1	37.92982940447474	-107.7741656000201	Marshall Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741s032jqh0o05ico8y2	37.92253099344845	-107.7667604177156	Via Ferrata East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741v032lqh0odrgjvhpw	38.07409573738347	-108.0216862669527	Whiskey Charlie 62 South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1741x032nqh0o3s4ukiu3	38.10415754677289	-107.9586658498223	Whisky Charlie 62 Trailhead North	\N	\N	clra170o60000qh0o4eufy4wk
clra1741z032pqh0oxme95niy	37.96713452358265	-107.9705776979996	M59 River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17421032rqh0odjmlok35	37.98585636371174	-107.9908738476802	M59 River North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17423032tqh0oofrtpdqc	37.92860243968008	-107.7764979855068	Valley View Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17425032vqh0o7rpw9snd	37.92727853559115	-107.9008027358798	Coal Chutes Loop West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17428032xqh0oztz2y0vr	37.92838480301971	-107.8988170506354	Coal Chutes Loop East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1742a032zqh0ot3t5avlv	40.24007644388613	-105.0011945059549	Founders Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1742d0331qh0onqy584pi	40.23329043692794	-105.0271445461037	Mead Ponds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1742f0333qh0oz1z5mlrx	38.87033171713981	-106.993405814374	Woods Walk Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1742h0335qh0okicp0pqi	37.93430241917549	-107.8119303489892	Bear Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1742j0337qh0ollyf2e3w	38.59501553837959	-107.8898703383878	Peach Valley Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra1742l0339qh0ovhnudcxb	38.58661590942855	-107.854876614968	Sunset Rocks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1742o033bqh0oq8hrz278	38.58004947081361	-107.8365970845115	Red Rocks Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1742q033dqh0o3y4nvedr	38.57294702199437	-107.8373157820833	Slanty Bridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1742s033fqh0oi8qn7o0k	38.52133754544979	-107.8597780842252	Flat Top Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra1742u033hqh0oic89c6uz	38.54443138749525	-107.862740943848	Elephant Skin Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra1742w033jqh0ojs2g05fe	39.89837407949625	-105.7738963892305	Winter Park Public Works Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1742z033lqh0o41e10wa0	38.60597731494149	-107.8877888400948	Eagle Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17431033nqh0o3viran5f	38.60402951771854	-107.8843966537391	Eagle Valley Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17433033pqh0o8jsxqpmh	38.75149596454363	-107.9102903058874	Smith Mountain Sidewinder Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17435033rqh0o3z0x1zvo	38.77617014390896	-107.852847750873	Birthday Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17437033tqh0omza6mwpg	38.7705167444286	-107.8603046415502	Crocodile Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743a033vqh0oqw9677ol	38.76728000935147	-107.8755936567252	Cool Rock Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743c033xqh0o3rqanupo	38.7541915182684	-107.9085303792526	Smith Mtn Saddle Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743e033zqh0obdgzk2ki	38.76485363979304	-107.8881036745425	Sun Cliff Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743g0341qh0ob3jqpt1q	38.78062681033027	-107.8366102873804	West River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743i0343qh0omx1z3b1e	38.61103745358592	-107.8316806960748	Chukar Geological Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743k0345qh0ob6n0swnl	38.61336846559157	-107.8359041652365	Chukar Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743m0347qh0oqpkv3apv	38.68236487869398	-107.864058363656	Ute Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743o0349qh0oi2nc6w22	38.6299278500257	-107.8700686769119	Bobcat Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743q034bqh0o6vefgeb7	38.64864961051206	-107.8668180168497	Duncan Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743s034dqh0ojlurcsii	39.82881285758899	-104.8594396644248	Army Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1743v034fqh0o6xh9kpzz	39.81991432216723	-104.8629349310935	Lake Mary Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743x034hqh0o7qxo1f1p	39.81998761309139	-104.8611031195601	North Ladora Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1743z034jqh0och7w4lu4	39.81357973349995	-104.8606679906011	Prairie Ponds Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17441034lqh0ol7f1ybre	39.81244023499014	-104.8207604134397	Bluestem Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17443034nqh0ok8fxnc1e	39.81223851626603	-104.8883190966913	Prairie Gateway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17445034pqh0ovtrbpdo4	39.87038966233112	-104.8466213929327	 	\N	\N	clra170o60000qh0o4eufy4wk
clra17447034rqh0ojdohm3l7	39.79872212870728	-104.7904932086547	First Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17449034tqh0oue7ovzft	38.17430344455573	-107.0958430219133	Ten Mile Springs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744b034vqh0odz44zuoj	38.1340837958898	-107.2849978579624	Devil's Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744d034xqh0ok7781jbg	38.13883415878432	-107.2864357693116	Lake Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744f034zqh0ouc88q5vh	38.06572568736203	-107.0641688498332	Powderhorn Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744h0351qh0odm67a20i	38.16787276796664	-107.7472137945497	Dennis Weaver Memorial Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744k0353qh0otm6w27p2	38.14588613049275	-107.754919883507	 	\N	\N	clra170o60000qh0o4eufy4wk
clra1744m0355qh0ovaftx9gg	38.15242122460977	-107.7551629794884	 	\N	\N	clra170o60000qh0o4eufy4wk
clra1744o0357qh0o7hs7bs3e	38.48532473569365	-108.0431821744488	Rim Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744q0359qh0owas4bdfy	38.53794401053656	-108.0663113565312	Transfer Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744s035bqh0oq2i82rr6	39.77569041245449	-106.7897104879139	Poison Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744u035dqh0o2s5l2w5q	39.07904844419446	-104.5157083084942	Lovaca Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744w035fqh0ocq9ewra9	39.07447454467606	-104.5236310327789	Homestead Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1744z035hqh0okwuwe1qn	39.17426658533458	-104.7498330394355	Lincoln Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17451035jqh0od0odej03	39.29460319062573	-104.9206698557803	Dawson Butte Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17454035lqh0ow250sc26	39.2819566201517	-104.8929578927048	Columbine Open Space Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17456035nqh0ooz7ef02d	39.34090221758009	-104.8414059036917	Rhyolite Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17458035pqh0ovjnynt67	39.40568366039293	-104.8029855005655	Hidden Mesa (Pleasant View Dr) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745a035rqh0op5zjk0ha	39.40945189406096	-104.7622522495865	Hidden Mesa (Parker Rd) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745c035tqh0onnfwvsvu	39.38799265985541	-104.8023295545472	Gateway Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745e035vqh0olqa6zqfz	39.3810539645829	-104.9053180722474	Bison Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745g035xqh0oix84yfia	39.3786653185128	-104.8935541393038	Ridgeline Open Space Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745i035zqh0ohw8ixof4	39.38163517771109	-104.8575764555874	Rock Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745k0361qh0ob6ves37q	39.064664736472	-104.792147104907	Fallen Timbers Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745m0363qh0oodi1on4z	39.0681014220163	-104.7852893230921	Roller Coaster Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745p0365qh0opissk5md	39.06058836744567	-104.7932396729023	Fox Run Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745r0367qh0oxaqvomz9	39.01357618485356	-104.737899114168	Black Forest South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745t0369qh0ozocm8je4	39.01633165175468	-104.736381909406	Black Forest Regional Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1745w036bqh0oudiupciu	38.71365448369708	-104.7166513003352	Fountain Creek Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1745y036dqh0oilknr5e4	38.71002979303687	-104.7165410793918	Fountain Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17461036fqh0o7hizxk4m	38.6948773381839	-104.7078687334617	Fountain Creek (Grinde Dr) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17463036hqh0o206bwlh2	38.72105807579895	-104.72578548218	Willow Springs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17465036jqh0ogogaupag	38.77637707363064	-104.780947404506	Hwy. 85/87 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17469036lqh0o2ipo2cgy	39.03756736131631	-104.7201745767937	Cathedral Pines Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746b036nqh0oyf9pp3yk	40.228447064073	-105.3428077055554	Button Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746e036pqh0owwhb48nz	39.12342295621718	-104.9104461791194	Palmer Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746g036rqh0o6uheblj6	39.0979656886899	-104.8710766091743	Hwy 105 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746j036tqh0o66j80i7e	39.09293393921521	-104.8694622944603	Monument Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746l036vqh0okp2ggxpp	39.0572346113074	-104.8582149632192	Baptist Rd Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746n036xqh0ovc2zn29p	39.02533192470455	-104.8402993632863	North Gate Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746p036zqh0owvd2cub5	38.95980595954373	-104.8348733899654	Ice Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746s0371qh0odyba2elj	38.99881471905858	-104.6688030246403	Black Forest Section 16 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746u0373qh0oaz98vbf6	38.85707204110027	-104.8372566895887	Sondermann Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746w0375qh0o0aw3f5tq	38.72756606212278	-104.7315481322643	Ceresa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1746y0377qh0ozsqala0r	38.73564723716147	-104.7098805252468	Widefield Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174710379qh0o3anzzvta	38.61182775760228	-104.6781273039878	Clear Spring Ranch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17473037bqh0o8ia2b07u	39.07067715064298	-104.5756560511651	Woodlake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17475037dqh0oezdfk9rf	38.93676301918268	-104.6051680327337	Rock Island Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17477037fqh0o39iawj60	38.86811368506556	-104.9242502477547	Rainbow Falls Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra17479037hqh0okllqka4z	40.390852691816	-105.0883057470389	River's Edge Natural Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747c037jqh0o8a55mfac	40.3830178010117	-105.0633872762716	Old St. Louis Natural Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747e037lqh0o03rwh2rv	39.39510736818249	-104.90322827371	Paintbrush Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747g037nqh0o371zrid4	39.40986209706566	-104.9061539445323	Butterfield Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747i037pqh0o8sinaoqq	39.35519764447088	-104.8010379582073	Matney Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747k037rqh0oo39uv017	39.37202561324484	-104.8103679576586	Founders Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747n037tqh0o5qimnhwt	39.3888500641677	-104.8508267360763	Hangman's Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747p037vqh0oszg5jgdq	39.40630626667419	-104.8773156508629	East Plum Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747s037xqh0o9myu08pk	39.36860067741251	-104.8487846891019	Memmen Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747u037zqh0onzg8w1m4	39.45249245139089	-104.7453921997123	Bingham Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747w0381qh0of27zwvpv	39.45605307755752	-104.7661292556982	Cherry Creek (Pinery) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1747y0383qh0o9jrhmqeg	38.91867163712435	-104.8140086615221	Pulpit Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174800385qh0owhnwmvam	38.8722729480987	-104.8851189857961	Scotsman Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174830387qh0oe0pggrgq	38.86540219706886	-104.8903158778033	Spring Canyon South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174850389qh0oq2lgtvvp	38.88094152349078	-104.8801929989541	Garden of the Gods Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17487038bqh0o8212xhg2	38.7436706428789	-104.694373027093	Bluestem Prairie Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17489038dqh0os683mo35	38.93311781857592	-104.8181231729203	Edmundson Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748b038fqh0og3tb2dqz	38.92080102485163	-104.8265132638796	Golden Hills Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748d038hqh0o4vu137i4	38.9299152413777	-104.8709130617172	Wilson Ranch Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748g038jqh0oymzu7rog	38.8916363154806	-104.8751957827414	Blair Bridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748i038lqh0oqp0l7pt5	38.88169542132755	-104.8295647499059	Gossage Sports Complex Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748k038nqh0ovhim1ai3	38.84140379876607	-104.8594634730845	Naegele Rd & S 21st St Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748m038pqh0o4t9f4mok	38.79082534937667	-104.9041976931306	Gold Camp Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748o038rqh0o3jlzbb07	38.81696072071293	-104.8227102750314	Dorchester Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748q038tqh0oynqujuti	38.82990291772818	-104.8310395147481	America the Beautiful Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748s038vqh0o3iq2ybwf	38.84570347466618	-104.8297160285877	Monument Valley Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748u038xqh0okblilro1	38.88276857788126	-104.8026869336745	Portal Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748w038zqh0o8mw9tjt0	38.84063151317952	-104.8136239992378	Shooks Run Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1748y0391qh0omedslfzc	38.91072191916876	-104.7283379221431	High Chaparral Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174900393qh0ogznke4eb	38.53571776393255	-105.2154182507029	Oil Well Flats Upper Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174920395qh0o5vu2fga4	38.53645749455796	-105.2189519651897	Oil Well Flats Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174940397qh0o981io070	38.53240416177551	-105.2040479653826	Fire Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174960399qh0ofzays6qj	38.55730754169828	-105.2715443008586	Seep Springs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra17499039bqh0ox16iz1tr	38.76868748038194	-105.3358844272233	Guffey Gorge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749b039dqh0oowas6fgz	38.6257650652073	-105.3723052341684	Deerhaven - Thompson Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749d039fqh0o76bd1cgf	38.61036220515208	-105.3494150832477	Deerhaven - Wilson Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749g039hqh0oki2xhpym	38.6570489043967	-105.2611216570937	Log Cabin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749i039jqh0ot1czyryg	38.7226101962584	-105.2804446086463	Booger Red Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749k039lqh0oyic3l3qh	38.41567658511494	-105.5861964106693	Texas Creek OHV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749n039nqh0ofa6de885	38.61588702940207	-105.225732270636	Shelf Road Equestrian Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749p039pqh0okn7s3d2l	38.61722819612311	-105.2296410013576	Shelf Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749r039rqh0o5hdv0dku	38.53500010791173	-105.2216692922328	Marsh-Felch Quarry Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra1749u039tqh0oo1omij7c	38.43161697790048	-105.2536808351111	Eagle Wing Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749x039vqh0orloquvt6	38.40436229441424	-105.2712976045743	Lamba Chops Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra1749z039xqh0ogs8d7wac	38.40709052905796	-105.32611824705	Grape Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174a2039zqh0okdu9u86e	38.46496920094489	-105.2916820785206	East Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174a403a1qh0o0y6fef2n	38.43603023383311	-105.2421332175666	Centennial Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174a703a3qh0o5s4dwluy	38.41268922470355	-105.1932390795411	SpringCreek Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174a903a5qh0ob4wl691z	37.62162125444107	-105.5597595875038	Zapata Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ac03a7qh0oheg0gon3	37.62788862721189	-105.5689566641175	Loop 4 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ae03a9qh0ogi3003er	37.62031222319555	-105.5604360355156	Zapata Falls Campground Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ah03abqh0ons2557o8	38.21466652075778	-106.0750781165199	Soda Springs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174aj03adqh0ovp19hagc	39.86619721740521	-105.8216033147768	Vasquez Peak Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174am03afqh0oinzlc6v8	38.63315408970809	-105.3485543828874	Deerhaven - Deer Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ao03ahqh0ow62u2jzc	39.48400851508683	-106.0572281323282	Nordic Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ar03ajqh0oa9l7svte	39.47846884814747	-106.0531174361044	Snowflake Lift Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174at03alqh0ob12ku4t4	40.44129011114086	-105.7547804060961	Alpine Visitor Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174av03anqh0otb9lwbtg	40.39335462905715	-105.6953790942998	Ute Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ax03apqh0ocg44mde1	40.64381194223993	-105.5808731774347	Flowers 4WD Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174az03arqh0ox534hg6w	39.16784389732909	-104.8745208049184	Spruce Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174b203atqh0ox3wmfxo0	39.17973066154982	-104.8582061032155	Spruce Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174b403avqh0oq8u36wfw	40.68279085453874	-105.4638979032983	Kreutzer Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra174b603axqh0o2snon0xo	37.93875574353208	-107.6663409564102	Gray Copper Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174b803azqh0okiua3dle	39.42221807968079	-105.9092641438724	French Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ba03b1qh0oam1w8axz	40.62051702329595	-103.1811413951312	Overland Trail Recreation Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174bc03b3qh0oxukz3hi4	39.12465275387265	-106.5817227506923	Lost Man Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174be03b5qh0oenblc8q1	40.08955733693013	-105.0227364498578	Bulrush Wetland Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174bg03b7qh0o3grvpv76	38.5711401747629	-106.0759550552876	Big Bend OHV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174bj03b9qh0omtu1mr62	38.72464663279563	-107.5443972815381	Needle Rock Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174bl03bbqh0o7nkn4st7	39.5749309490056	-107.8122002640771	Hubbard Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174bn03bdqh0oz3znwhdc	37.8053467119674	-108.7936093625487	Dolores Canyon Overlook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174bp03bfqh0oyydbsyfs	40.44948872536282	-104.8882437614633	Kodak Watchable Wildlife Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174br03bhqh0ov36oeb5x	39.68262011518214	-105.5214515665398	Chief Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174bt03bjqh0otdnb9wla	37.59140271242149	-106.5047487133209	Shrader Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174bw03blqh0ops07ckt7	39.72550832574881	-105.6933085050754	Georgetown Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174by03bnqh0ow461p5ck	37.82959957144882	-106.5195729376288	La Garita Creek Cut-Off Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174c003bpqh0ogohdt9pl	37.82748926017815	-106.6148634714995	Embargo Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174c303brqh0o5zpb9r18	39.18083197289086	-104.8535589287574	Greenland Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174c503btqh0oritl4pwg	39.42848623770069	-106.0699485120198	Mayflower Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174c703bvqh0o6gn57ui9	39.49987786665353	-105.3797113467163	Ranch Hand Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174c903bxqh0opq2lur8i	40.61840703914848	-105.5259979589737	Fish Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174cb03bzqh0obtasjm54	40.57638088539733	-105.5844120328591	Emmaline Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174cd03c1qh0orhvj32p7	40.57404924817944	-105.593258692723	Emmaline Lake Primitive Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174cg03c3qh0obuclbgc7	39.72261986531421	-105.4122258223887	Floyd Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ci03c5qh0oua0wwkx6	39.70403484870765	-105.6955043895151	Rutherford Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ck03c7qh0or81psgq5	40.55437671639544	-105.9141456609326	Montgomery Pass West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174cm03c9qh0oeqmrgv6h	37.95623138660154	-107.3029939756531	Red Mountain Gulch OHV Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra174co03cbqh0oko44gba2	39.13537088331412	-105.1053179209625	Rainbow Falls OHV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174cq03cdqh0o0ddlp222	38.5444638024408	-102.5048662786744	Sand Creek Massacre Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra174cs03cfqh0ojjm6eq4v	39.36011532336183	-105.0790055244216	Mile and a Half Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174cv03chqh0o0jqzhexy	39.35798389134494	-105.0787919289721	Garber Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174cx03cjqh0ojz14o8tk	39.68787776390567	-105.6994462926293	Silver Dale Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174cz03clqh0obhy8ie1d	38.47336345832273	-105.3078306031886	Made in the Shade Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174d203cnqh0ow2rb9ug3	39.99411976253188	-105.1088163424519	Waneka Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174d403cpqh0o7ghoyle1	39.97824673583592	-105.1665367071099	Davidson Mesa Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174d603crqh0ochz7qw3s	39.97849664043093	-105.1651020696326	Harper Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174d803ctqh0o9zeo4aqz	39.96534841617527	-105.1471506424158	Daughenbaugh Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174da03cvqh0o2df8s0pe	39.96893865072006	-105.1417056934454	Warembourg Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174dd03cxqh0ome1neqxp	40.07789130558647	-105.5844498781986	Long Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174df03czqh0ov5h1km40	40.0831865145284	-105.5817642102814	Mitchell Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174dh03d1qh0opwsc5udf	40.08365477819589	-105.5811848402239	Beaver Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174dk03d3qh0ouzb44f6d	39.82571901870129	-105.6444386169733	St. Mary's Glacier Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174dn03d5qh0odtt5grf3	39.6146650830361	-106.0644699776275	Dillon Dam Overlook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174dp03d7qh0ojxvtlmke	39.49735271770932	-106.1363606939098	Corn Lot Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174dr03d9qh0o18djyhd4	40.78768753096225	-108.7379388466974	Irish Canyon Accessible Petroglyph Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra174du03dbqh0oed768ioi	40.32047201101841	-105.6078707821905	Sprague Lake Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra174dw03ddqh0o1a5bxjgb	39.65242665349173	-105.1622866859999	Muskrat Meadows Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174dz03dfqh0o95du04x7	39.65150288432545	-105.1745417537804	Mt. Carbon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174e103dhqh0o4empyi13	39.65328632157477	-105.155800411052	North Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174e303djqh0oergx2qhq	39.91108104439353	-105.1839031869387	Rocky Flats National Wildlife Refuge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174e603dlqh0o93clyd1j	40.13046419175257	-105.8446110046918	Doe Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174e803dnqh0o4uve2m5q	40.53174066353035	-105.1628861823146	Soderberg Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174eb03dpqh0ohkowkni7	40.38391337096105	-106.6969225487749	Fox Curve Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ed03drqh0o029u1a84	38.77534586068337	-105.0093696625365	South Slope Recreation Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ef03dtqh0oiy82efdf	40.36885825185983	-106.7420663376315	West Summit Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174eh03dvqh0obg6sw5vv	40.38561692018983	-106.6808255549496	Walton Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ek03dxqh0oubdg5f2u	40.37980402132127	-106.7164694834375	Bruce's Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174em03dzqh0oth1hz0hk	40.3916395239645	-106.6027739540801	Old Columbine Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ep03e1qh0o2ze5trjy	38.78599783734177	-108.0317892644804	North Delta OHV Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra174er03e3qh0o9n1fm7z3	38.78182966888121	-108.0145467393957	North Delta OHV East Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra174et03e5qh0ohh5p2viy	39.68034895319941	-105.1691106980044	Forsberg Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ev03e7qh0ox0y6urqz	40.0526569136271	-107.4606500495319	Long Park / Lost Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ex03e9qh0orwwnglde	40.14768776182918	-107.740180361896	Yellow Jacket Pass	\N	\N	clra170o60000qh0o4eufy4wk
clra174ez03ebqh0obvfoef7v	39.93700510898662	-107.5651360982446	South Fork Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174f103edqh0ootxnk1tc	39.93315326677778	-107.7712153540822	Miller Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174f403efqh0oxtas79vu	39.92191442175918	-107.899917324996	Hay Flats Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174f603ehqh0oj7ss2291	40.23074691089002	-107.593543844617	Morapos Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174f803ejqh0okreinljh	39.68230393057409	-107.6497002121287	West Elk Alternate Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fa03elqh0ozw76fgxe	39.67705021259045	-107.5698153749947	Clinetop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fd03enqh0oqc6untqq	39.43641726181082	-107.5172792604076	East Divide Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ff03epqh0oo93uvc73	39.36605150531743	-107.5908328158511	West Divide Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fh03erqh0okerwpmnp	39.36861973118264	-107.3057109809301	Marion Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fj03etqh0oro1vdyni	39.40327321761407	-107.3601804511065	Fourmile Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fl03evqh0ogmyzsmyq	39.50509972253319	-106.6779674100457	Yeoman Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fo03exqh0oluuszhe4	39.47426158363979	-106.3621052303019	Homestake Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fr03ezqh0oiv2m6u48	39.43618634679687	-106.3253598725901	Camp Hale Main Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ft03f1qh0opx8tpfq8	39.52806729456407	-106.2183327317194	Vail Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fv03f3qh0oes4q6bzh	39.7294098391511	-106.6780502261856	Muddy Pass Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fx03f5qh0o1e02puhs	40.13588631937566	-105.297932095062	Corral Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174fz03f7qh0o4q6dm349	39.23080333039559	-106.2827415439079	CR 6C Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174g203f9qh0oakqsb0kv	39.24964639574754	-106.2708805467457	Mineral Belt 5th St Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174g403fbqh0oibxa7vkb	39.25434870958504	-106.2690992603571	Mineral Belt 7th St Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174g703fdqh0oqwq882iy	39.25191576832999	-106.2946393460215	Ice Palace Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174g903ffqh0oxs5937xe	39.23944275162153	-106.3041997911984	Dutch Henry Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174gb03fhqh0oj7fimdvg	39.24509579751195	-106.3078168916238	Lake County Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174gd03fjqh0o6dcio6dq	38.90054271884597	-104.9915003741286	Crowe Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174gf03flqh0opeev13zg	38.93621915017402	-105.0182284995806	Mt Dewey Trail Parking	\N	\N	clra170o60000qh0o4eufy4wk
clra174gh03fnqh0otvvq7sj9	38.93395559525531	-105.0148357811582	Green Mountain Falls Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174gj03fpqh0oan8lvqwm	38.92902177668616	-105.0088742424847	H.B. Wallace Reserve Parking	\N	\N	clra170o60000qh0o4eufy4wk
clra174gl03frqh0ojtjmg2jp	38.91452133890255	-104.9931952057191	Mt. Esther Chipita Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174go03ftqh0o1gicyz9o	39.25201930405478	-106.3686734981382	Sugarloaf Dam Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174gq03fvqh0okmha2jrt	39.23492512467742	-106.3018429372072	Colorado Mountain College Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174gs03fxqh0opjd5sjjc	39.24502493400497	-106.3560225166798	Mt. Massive Golf Course Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174gu03fzqh0opnivil33	39.20193791290746	-106.8126507716792	BLM Red Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174gw03g1qh0obd7cvhhb	39.20617836544861	-106.7977508656066	Hunter Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174gz03g3qh0om120tjcx	39.3584162848509	-107.2918047393955	Spring Gulch Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174h103g5qh0omx3r7rpx	39.31973097858765	-107.1368491638476	Dinkle Lake Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174h303g7qh0ogo6z9pmo	39.11849289542452	-106.8282965170464	Little Annie Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174h503g9qh0ovp1034u6	39.15903694497967	-106.8432039224924	Midnight Mine Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174h703gbqh0oj9qf9f4n	39.05583113382857	-106.7996516071614	Ashcroft Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ha03gdqh0owhtwa2vq	39.13399124618428	-106.7563219845077	Dunbar Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174hc03gfqh0ozzx5eotb	39.18776299967005	-107.2342298278395	East Creek Lower Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174he03ghqh0os0mtff8d	39.35724647145732	-107.0377624563989	Basalt High School Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174hh03gjqh0om0e1ues1	39.07267415627832	-106.8035090865473	American Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174hj03glqh0o632w2w6k	39.36256356927429	-107.0875403326849	Nancy's Path Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174hl03gnqh0o9xbmsaib	39.33242877424005	-106.9860620936747	Arciero Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ho03gpqh0orft26xzy	39.27770714037063	-106.8883782632329	Woody Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174hr03grqh0oncspl9fp	39.19171927798062	-106.8082828738852	Smuggler Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ht03gtqh0om9t4tn06	39.21550585533493	-106.8421924892308	Sunnyside Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174hw03gvqh0oc87kdiff	39.22616777488784	-106.9240717555422	Snowmass Recreation Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174hy03gxqh0omm7npfy0	39.199204854556	-107.0013765201507	Snowmass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174i003gzqh0o30zk2e1k	39.34683004433762	-107.0110237109999	Wingo Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174i303h1qh0ookn04ynk	39.36047418248949	-107.0271892597454	Fisherman’s Park	\N	\N	clra170o60000qh0o4eufy4wk
clra174i503h3qh0o4bmcfc6d	39.35485102044229	-107.013493546607	Arbaney Kittle Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174i703h5qh0oypv5ekn2	39.211626959083	-106.839887573817	Henry Stein Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ia03h7qh0owubh3mey	39.18964670035825	-106.8135134201544	Rio Grande Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ic03h9qh0ot1glep51	39.21113959675166	-106.9128720884679	Tom Blake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ie03hbqh0o3hhybgqh	39.2538749196272	-107.2316031921109	Avalanche Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ig03hdqh0oayufa2c7	39.34448100298074	-106.6147038352346	Elk Wallow Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ij03hfqh0oymkikw70	39.55013149303471	-106.4067042006726	Tigiwon Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174il03hhqh0os6s714o9	39.60656675381487	-106.4447642711966	Mountain Meadow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174in03hjqh0op7dazvvu	39.59410051241733	-106.4343013582932	Grouse Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ip03hlqh0obzlbtpj0	39.52184975168567	-105.9599174076917	Tiger Road Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ir03hnqh0ow23f07o7	39.09756183616441	-107.8968666598636	Bonham Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174it03hpqh0omdro1t6s	39.18078096962042	-107.7936436452688	Park Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174iv03hrqh0opkczmhid	39.31698953567339	-107.9487844935661	Kimball Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174iy03htqh0oqioplzin	39.02733299985525	-108.0306860320019	County Line Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174iz03hvqh0of9cmwfbh	39.02851151134097	-108.0483872610508	Mesa Top Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174j103hxqh0okegnkov8	39.05426366330646	-108.0915565833486	West Bench Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174j403hzqh0om6tgyqq5	38.95895179472731	-107.7427647888016	Leroux Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174j603i1qh0ota6yc2nf	38.93163404723054	-107.6169610675394	Stevens Gulch Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174j803i3qh0osonv2el6	39.01896813151396	-107.9985226809982	Ward Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ja03i5qh0ohj3w0xjx	39.95590030724222	-105.8231304301385	Fraser Valley Sports Complex Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jd03i7qh0oixvvfbzg	39.04279248355298	-108.0666949435113	Skyway Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jf03i9qh0ok1lv5j3n	38.93864070872674	-106.153271087775	Vitamin B North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ji03ibqh0oq52nzizt	38.87481455493045	-106.143427984977	BLM Route 375 Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jk03idqh0oxv1b7by5	40.4571436216775	-105.4258986085368	Crosier Mountain Rainbow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jn03ifqh0otiitpu81	40.4423410276849	-105.3783736864388	Crosier Mountain Garden Gate Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jp03ihqh0o6fpopilr	37.65353041553568	-108.0442489208427	Scotch Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jr03ijqh0o41n1mmto	37.56009932180731	-108.4574165806508	House Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jt03ilqh0o3yyk4ho6	39.59680830566231	-106.033685712415	Prospector Bouldering Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jv03inqh0o3l1gag9w	37.65452897136554	-108.3967025077384	Beaver Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jx03ipqh0oo4tsceet	37.50213256647264	-108.4656223398139	Boggy Draw Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174jz03irqh0o3yu01urv	37.59901943036822	-108.1125405380896	Roaring Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174k103itqh0oubsqimae	37.41559144469027	-108.3125489971901	Chicken Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174k303ivqh0oa3j5me5b	37.33269665062927	-107.1258538251032	Coyote Hill Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174k503ixqh0o53ogt109	37.4756732035431	-106.8603352772625	Fall Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174k703izqh0ofqn58gkl	37.4830439706056	-106.7974308422492	CDNST - Wolf Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174k903j1qh0o1pd4y43d	37.74271472941168	-107.7000232244466	Little Molas Lake Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174kb03j3qh0oakdlt2y0	37.73348777351988	-107.7108659892051	Andrews Lake Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174kd03j5qh0o8wjq70sw	37.74761648213705	-107.6880820918046	Molas Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174kg03j7qh0ofve7we3q	37.52896184407781	-107.8163551790644	Haviland Lake Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ki03j9qh0ope1hjiny	37.4748626230722	-107.5483303623924	Vallecito Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174kk03jbqh0ofgt4hugb	37.35375561699299	-108.0777304426081	La Plata Canyon Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174km03jdqh0oa22zuljg	37.49744375521481	-107.2582790968937	Piedra Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ko03jfqh0o9vijdvs9	37.40089548675736	-108.2693611266409	Vista Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174kq03jhqh0o4cgxom9q	38.86062140916523	-107.0487165984109	Kebler Wagon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174kt03jjqh0obh9qayv2	38.77060253324564	-107.0191210438254	Carbon Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174kv03jlqh0o20924b1m	38.90263655186487	-107.0111119961605	Slate River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174kx03jnqh0o2t6nig8x	38.91547207005554	-107.0015476035606	Washington Gulch Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174kz03jpqh0oe6pv8kzx	38.86500443833113	-106.9128940429184	Brush Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174l203jrqh0oufvhsn1k	38.82891628254345	-106.8354803805335	Cement Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174l403jtqh0oodj4sia6	37.77729902334892	-106.8344600597135	Pool Table Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174l603jvqh0of2nsw2qi	37.7009430865346	-107.0298115508942	Middle Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174l803jxqh0ogtj87pk3	38.92542003633977	-105.0938662051094	Elder-Fehn Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174la03jzqh0o74s2ilyd	38.36809995346028	-107.4881874388626	Augie's Corral Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174lc03k1qh0o9kdsrqwl	39.27528046970073	-107.6967820049255	Hightower Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174le03k3qh0okff1n4h3	39.22239872455512	-107.7823144082051	Aspen Nature Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174lh03k5qh0oermc30sl	40.75241378863143	-106.8256913325221	Hinman Nordic Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174lj03k7qh0oiszrwajs	40.80817324962205	-106.9526988567784	Visitor Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ll03k9qh0on9a4nf18	40.80595229461591	-106.9730244159417	Steamboat Lake Marina Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ln03kbqh0omzo0c2cr	37.93700948788797	-107.4605763650094	Burrows Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174lp03kdqh0osg8b57r0	37.9389844340492	-107.6710945218782	Ironton Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174lr03kfqh0olmtpfmw4	37.81646494901427	-107.6513093920258	Silverton OHV Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra174lu03khqh0o5o7tho2x	37.98870197573475	-107.6495499250677	Engineer Pass OHV Staging Area	\N	\N	clra170o60000qh0o4eufy4wk
clra174lx03kjqh0ok78gv8ps	40.07151687987236	-106.6195455726505	Gore Flats Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174lz03klqh0o6nnz8cim	40.07775484487696	-106.5579750279745	Gore Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174m103knqh0o96tpom50	40.51100188089447	-106.0268061588209	Michigan River Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174m403kpqh0ojlkvkizk	40.50453990579474	-105.884070255494	American Lakes Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174m603krqh0oq8fpivdb	40.52047168273669	-105.8938697061424	Cameron Pass Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174m803ktqh0o254zq9hu	40.50244901660104	-105.9687901644565	Ranger Lakes Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra174ma03kvqh0owbj0vt5o	40.55542712256517	-105.9914005154126	Grass Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174md03kxqh0opovgcam9	40.5729757475511	-105.9878526548639	Ruby Jewel Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174mf03kzqh0ot8d91op0	40.61446638289306	-106.0223986347203	Kelly Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174mh03l1qh0o6mh3ix5p	40.5963188954541	-106.0077386352377	Mountain View Nature Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra174mj03l3qh0o4rj09qau	40.53951121741073	-105.8821711683782	Zimmerman Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ml03l5qh0ogdgnqhxm	40.21796263253911	-107.1524918006632	West Fish Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174mn03l7qh0omciqlk60	40.20245960770843	-107.067712797903	Dunckley Pass Ski Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174mp03l9qh0okmnr2kao	39.14234293521541	-106.7743358148244	Difficult Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174mr03lbqh0od04ozwr9	37.81548418508898	-106.9028340322611	Deep Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174mt03ldqh0o3aj895nz	37.70306164576292	-106.9948205524537	Ivy/Lime Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174mv03lfqh0oanru1brf	37.7920235232622	-106.9806792820765	Sixmile Flats Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174my03lhqh0ob7qzxg5l	37.93108754598015	-107.1629795796378	Spring Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174mz03ljqh0ozam4uoaq	37.48007361305012	-106.2800263973653	Bishop Rock Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174n103llqh0o8h9qhzmu	37.5834117508289	-106.156514996095	Monte Vista Golf Course Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174n403lnqh0ogkihvja2	37.47171264955853	-106.3049826450661	Rock Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174n603lpqh0o2c1qnz7c	37.2952059933174	-107.0600182872898	Cloman Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174n803lrqh0oorq7tgqd	37.84290249080851	-107.8834653342583	Priest Lake Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174na03ltqh0o5h29he5p	37.81196355003576	-107.8704288786267	Trout Lake Trestle Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174nd03lvqh0o9nuedpzw	37.93878409335535	-107.8221590623752	Mahoney Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174nf03lxqh0ozkjxp4mx	37.94793787347457	-107.8715447439484	Lawson Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174nh03lzqh0ox3n89wc3	37.93548523642611	-107.8069054153519	Telluride Town Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174nk03m1qh0o9v988u2t	37.25485523543784	-107.0130248684885	Yamaguchi Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174nm03m3qh0o7nhj0dng	40.57964906007257	-105.8557515447262	Blue Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174no03m5qh0onoyx976g	40.55711669205736	-105.8215474147143	Trap Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174nr03m7qh0oej93bjtx	40.5809981967809	-105.8529876584415	Long Draw Parking (Winter) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174nt03m9qh0ozjlp3tjz	38.68955243270503	-105.0544115407022	Skagway Reservoir Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174nw03mbqh0onx3k4yv4	40.21193764961856	-105.5514057699253	Wild Basin Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ny03mdqh0ogoxbfyvi	40.21978249013728	-105.5344599414858	Sandbeach Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174o003mfqh0omkxp82y1	37.29810196174899	-108.4155436866327	Morefield Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174o203mhqh0o4nevmvnf	37.18573867295041	-108.4884549275229	Spruce Tree Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174o403mjqh0oau9biuu5	37.25826012966142	-108.4982990880303	Wetherill Mesa Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174o703mlqh0omj5j8rjb	37.296313033613	-108.4413787800937	Prater Canyon Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174o903mnqh0o36yjpxi1	38.47042657950482	-107.2531434434049	Dillon Pinnacles Trail	\N	\N	clra170o60000qh0o4eufy4wk
clra174ob03mpqh0ok4koolm9	38.55475197617405	-107.686772592968	Gunnison Point Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174od03mrqh0o1iklzudq	40.12444087964617	-105.4423207996427	Ceran - St. Vrain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174og03mtqh0onlwie5vc	37.69540253516235	-108.0273894633506	Argentine & Enterprise Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174oi03mvqh0oek804ndl	37.69003703312355	-108.0357901638779	Piedmont & Silver Swan Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ok03mxqh0od3286ava	37.26545378107041	-105.3472178215081	Costilla County Greenbelt Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174om03mzqh0o4zqmujv6	37.25357229238484	-105.318910704229	Rito Seco Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174op03n1qh0oq1skpv5x	39.93694893451477	-105.899482118226	Crooked Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174or03n3qh0onqgkkdhe	37.0123096557417	-102.7445935029104	Picture Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ot03n5qh0o3c32q17f	40.4865857536809	-106.817445024682	Spring Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ov03n7qh0okweyu2tg	39.65150976923898	-106.0980244444898	Willowbrook Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174oy03n9qh0ok5sidzm6	39.75377908640352	-105.240147476639	Canal Zone Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174p003nbqh0ok8dn7aiu	39.67398100783819	-105.444836378327	Beaver Brook Watershed Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174p203ndqh0omhfv8lta	39.69003617197068	-105.4229861720331	Lower Beaver Brook Watershed Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174p403nfqh0ok94jl0hz	39.74285596443332	-105.4742722746958	Game Check Station Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174p703nhqh0ooa52u9o0	39.62449289537059	-106.430082218017	North Trail (Davos) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174p903njqh0oeta075bx	39.34764272342985	-106.6807769912195	Montgomery Flats Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pb03nlqh0o0hvy1ys0	39.24423922848317	-106.7578349358266	Lenado Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pd03nnqh0ooq93d9fg	39.29801461111987	-106.6059007270016	Granite Lakes/Nast Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pf03npqh0otsonqt1t	39.32945263321538	-106.6589147432663	Aspen Norrie Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pi03nrqh0oyawxrne8	39.26439113638926	-106.3394092489528	Leadville Junction Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pk03ntqh0o1xsg7ajh	39.36255710238155	-106.3112669361976	Tennessee Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pn03nvqh0obj8n7u49	39.59231810297754	-106.6113529583441	West Lake Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pp03nxqh0o2bgcmmod	39.479895795336	-106.7343945896564	West Brush Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pr03nzqh0oialxneau	39.2977362298606	-106.5876641743818	505 Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ps03o1qh0oh0udye8m	39.48634020609957	-105.9806928297458	Lincoln Townsite Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pu03o3qh0oat1nha0z	39.64484516211616	-106.3759349477426	Middle Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174px03o5qh0okdije8lc	39.43711948900229	-106.0506961670051	Spruce Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174pz03o7qh0oq3kfq03g	39.34583300058245	-105.9289241186318	Peabody Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174q103o9qh0omy2f0525	39.46267755224274	-106.0211009547383	Boreas Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174q303obqh0ok0x40tpq	39.82266954913715	-105.769660766676	Second Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174q503odqh0ox5fkhlky	39.00338913501916	-107.9404965727618	Old Grand Mesa Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174q703ofqh0ohj0n0d8e	39.04035847265874	-107.9867394967526	Cobbett Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qa03ohqh0o4lvawdl5	39.00295623370241	-107.857356465646	Leon Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qc03ojqh0ofogb9n3w	38.81380032836154	-106.280841359834	Avalanche Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qe03olqh0o9fxpu5t1	38.7054513314251	-106.3499529023462	Poplar Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qg03onqh0ocu4yxt8l	38.81780317407835	-106.5614227385078	Taylor River Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qi03opqh0ohbqzon47	39.64839455674144	-106.3962708533841	Red Sandstone South Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ql03orqh0opvca9g1j	39.65481231320496	-106.3967259918891	Red Sandstone North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qn03otqh0oqorno87x	40.53457809047565	-106.78466143486	Dry Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qp03ovqh0ohlmo7vv7	40.38907395009478	-106.6357649040403	Dumont Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qr03oxqh0othqaqot8	40.38770033876974	-106.6187902033561	Muddy Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qt03ozqh0o7gj8ywtu	40.55690468876021	-106.5967436294416	Grizzly Guard Station Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qw03p1qh0o5dlu277h	40.14536139238927	-106.5485530330692	Red Dirt Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174qy03p3qh0o3087vsmb	40.86156583510127	-106.9597656575675	Columbine Parking Lot	\N	\N	clra170o60000qh0o4eufy4wk
clra174r003p5qh0o0c7z75wm	40.75442174962582	-106.8197295549431	Seedhouse Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174r203p7qh0omjllfdg2	39.21570786328008	-107.8137846573394	Visitor Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174r503p9qh0opt097c0t	40.68996998690022	-107.4347356904757	Black Mountain Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174r703pbqh0ocg2je7xw	40.69304667293557	-107.4633994412497	Freeman Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174r903pdqh0o79fseozp	40.83508417124632	-107.5177199927634	Wilderness Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174rb03pfqh0o8r08o7c8	37.85529820437917	-107.1541050027723	Bristol Head Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174rd03phqh0oyfrhkdaf	37.94079196979523	-107.1600669825968	Spring Creek Pass Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174rf03pjqh0o9cpu4vlw	37.87168703718242	-106.943019485091	Rat Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ri03plqh0omjqtefv7	37.41752611268481	-108.2526301444063	West Mancos Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174rk03pnqh0o1zc0vxek	37.47307904958466	-108.3803847177063	Haycamp Mesa Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174rm03ppqh0oo5yrjfr4	37.43044354196123	-107.7837953903521	Missionary Ridge Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ro03prqh0ona5rncpa	37.76855869289722	-107.9877617472831	Barlow Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174rq03ptqh0osat6p0ca	37.42325395525	-107.6710366815907	Youngs Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174rs03pvqh0o31qg88k0	37.43868521070078	-107.5428093590685	Middle Mountain Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ru03pxqh0ogw8g6cj8	39.90559466010383	-106.4043862168866	Spring Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174rw03pzqh0ox238iugg	39.73193451201442	-107.6480302240695	West Elk Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ry03q1qh0ovrg7e88t	39.72479652784833	-107.688703947863	Rifle Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174s003q3qh0on3xtd3cp	39.96659785007857	-107.635906015685	Buford Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174s203q5qh0o9d2n8l5o	39.56668324483447	-107.3179610625706	Transfer Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174s403q7qh0or2xv1eli	39.67827770616706	-107.0967682248482	Deep Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174s603q9qh0o2s5r0mjy	40.22521160102673	-105.8924390617413	Idleglen Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174s903qbqh0ohb2yavkj	38.86763773390072	-107.023124508411	Kebler Pass Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174sc03qdqh0o7n6iigqx	38.78424608265831	-107.0739816429023	Ohio Pass Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174se03qfqh0otw0trkyd	38.95400798817453	-107.2712381581549	Erikson Springs Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174sg03qhqh0o6vmoz1eu	38.4679774332136	-107.5154218391219	Corral Gulch Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174si03qjqh0o5vk9qkhi	38.55297500738367	-107.5219569683272	Crystal Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174sk03qlqh0o3ql8xqmz	39.25600797431716	-106.2450927126324	Evansville Town Site Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174sm03qnqh0oac1ds44f	39.25824511641478	-106.2285969146756	Silver Spoon Mine Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174so03qpqh0o8esni1wt	39.24742022401086	-106.2586979067461	Adeliade Town Site Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174sq03qrqh0oqr9wyocj	38.40728395734897	-106.415187223575	Marshall Pass Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ss03qtqh0o8l5t265b	39.23481953192451	-106.2526880289431	Oro Town Site Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174su03qvqh0o4jvliduw	39.22407630467478	-106.2363116229555	CR 6A Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174sx03qxqh0oti7zk9di	39.23190736450265	-106.2442696277956	California Gulch Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174sz03qzqh0oktytjvpa	39.22499713676262	-106.2372387709262	Black Cloud Mine Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174t103r1qh0ovt55dh2l	38.26044601799952	-107.5461779396164	Silverjack Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174t303r3qh0o9uszu39s	38.18036536067895	-107.6183885469103	Vista Point Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174t503r5qh0osulryqup	38.25584209858012	-107.9776361975959	Elk Mountain Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174t803r7qh0o0bitsv79	37.37609103371001	-106.8907412999068	East Fork Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ta03r9qh0ooz6e14vk	37.35737970956881	-107.0382527964056	 	\N	\N	clra170o60000qh0o4eufy4wk
clra174td03rbqh0okmhxz8zg	37.33158613650976	-107.1250058366789	Turkey Springs Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174tf03rdqh0oafrmqctn	37.48577423314798	-106.836962845418	Wolf Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174tg03rfqh0o4b16z124	38.42001417330469	-106.129746040105	Shirley Site Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174tj03rhqh0ormy7vecn	38.58446699360171	-106.2198158450754	Angel of Shavano Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174tl03rjqh0ofu6ymkre	37.88080015103178	-107.5664043284864	Eureka Gulch OHV Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174to03rlqh0o80jjwztu	37.55316605378519	-106.7786038505681	Big Meadows Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174tr03rnqh0oc5hr1umf	37.52805768545856	-106.7702046477758	Tucker Ponds Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174tt03rpqh0o4tfo9n9l	37.59676711608878	-106.7276861111714	Park Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174tv03rrqh0olja4papj	37.58278120507609	-106.6511189140524	Beaver Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174tx03rtqh0obhnnwx0a	37.67408684003317	-106.6040704274016	Willow Park Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174tz03rvqh0oxi6qhtca	39.51489628710372	-106.3646833546514	Red Cliff Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174u203rxqh0orwsgj848	40.55639355493603	-106.0363930612066	Bull Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174u403rzqh0opxjl292v	38.06616632936624	-105.1242042381909	Ophir Creek Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174u603s1qh0oew4sr533	38.49100553436726	-105.0317033395075	Penrose Commons - Independence Extreme Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174u903s3qh0oslva1w5o	37.97714153611586	-108.2612164464935	East Naturita Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ub03s5qh0olezyuxo6	37.3398351840184	-107.7983999758401	Durango Hills Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ud03s7qh0okt6dv84e	40.03198499227484	-105.7973662058873	 	\N	\N	clra170o60000qh0o4eufy4wk
clra174ug03s9qh0o6w4864n3	38.5210485536101	-105.2147641937789	MOOve Over Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ui03sbqh0o57i3k24n	38.13833195054552	-108.3388679120645	Burn Canyon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174uk03sdqh0ocgsemdny	38.27277310011017	-108.5267244629628	Nucla Range Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174um03sfqh0orw367gwg	37.69656319994981	-106.9137920901859	North Lime Creek Summer Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174uo03shqh0oisdg32pn	38.30575503363936	-107.9634638708184	Dave Wood Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ur03sjqh0o4aue5r7t	39.08302531590415	-104.8875260647068	Monument Fire Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ut03slqh0onraf0bvp	37.23499377820578	-107.3588436750555	First Notch Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174uw03snqh0o2stwkzl6	37.24279360237239	-107.5454173958879	 	\N	\N	clra170o60000qh0o4eufy4wk
clra174uy03spqh0o21twu636	37.6991810308697	-107.7790370917317	Engineer Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174v003srqh0ozbqdivli	37.39678694437228	-108.2179216012445	Echo Basin Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174v203stqh0ofxw7lquj	37.53297752777945	-107.8056925920945	Haviland Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174v403svqh0owovtdq19	37.37650840701883	-107.5599563616793	Old Timers Winter Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174v603sxqh0o5zv96pr4	40.59632500621075	-105.1655535102199	Sunrise Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174v903szqh0o6kdlpxj9	40.52345685853986	-105.1141934157225	Cathy Fromme Prairie Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174vb03t1qh0ogokww3ip	40.51105612762898	-105.0966511178234	Cathy Fromme Prairie Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174vd03t3qh0ob6v8pe1l	39.89865541206369	-106.0958868710347	Horseshoe Snowmobile Parking	\N	\N	clra170o60000qh0o4eufy4wk
clra174ve03t5qh0o5ti38byu	39.55952387377275	-105.7623040994342	Shelf Lake Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174vg03t7qh0ouurhihh0	40.31364772127517	-106.066790426219	Gilsonite Guard Station Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174vj03t9qh0o3kj9trg2	39.90691636919911	-105.8831224755796	Deadhorse Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174vl03tbqh0ogd815dbg	39.90796180574999	-105.8810793848019	Leland Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174vn03tdqh0ouh7eonlw	39.92991548430684	-105.7755100938178	Meadow Trail Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174vp03tfqh0o38krszzd	39.90890755966125	-105.764449124398	Lakota Snowmobile Parking Area	\N	\N	clra170o60000qh0o4eufy4wk
clra174vs03thqh0ousoy82qu	40.55644865339005	-105.1438514595396	 	\N	\N	clra170o60000qh0o4eufy4wk
clra174vu03tjqh0or2o5vckz	40.58742181048395	-105.1815651745509	East Valley Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174vw03tlqh0o2p0vwit6	40.58406485423259	-105.1794173261645	North Eltuck Bay Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174vy03tnqh0oafqy86r9	40.57863116978839	-105.1781979290771	Well Gulch Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174w003tpqh0oxz17dw98	40.57582554184001	-105.1778864708712	Well Gulch (Homestead) Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174w203trqh0oi84syhfx	40.56515145648871	-105.1736873312758	Shoreline Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174w503ttqh0o8colqmpz	40.58849820976996	-105.1845105666862	Timber Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174w703tvqh0og4pfysbs	40.55604796366588	-105.0195350970562	Environmental Learning Center Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174w903txqh0ozi2jyz7s	40.59560188377996	-105.0823774992451	Lee Martinez Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174wb03tzqh0osczr0sl6	40.56482664775994	-105.0454360868439	Spring Creek Trail - Riverside Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174wd03u1qh0ooxg6fgl3	40.56514549878905	-105.0510068412303	Edora Ballfields Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174wg03u3qh0otm1tfn34	40.56167835052202	-105.0735322781176	 	\N	\N	clra170o60000qh0o4eufy4wk
clra174wi03u5qh0o1gxuxh3l	40.56705436040506	-105.1551986613583	Rotary Park Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174wk03u7qh0onpid9nj3	40.58224197904459	-105.1597565815122	Skyline Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174wm03u9qh0oce0f7za7	40.35194646896484	-105.4577502888076	Saddle Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174wo03ubqh0onj4qtgwy	39.94796801666816	-105.1658576526629	Oerman-Roche Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174wq03udqh0oaq0icbei	39.53189592093295	-105.0456450816597	Plum Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ws03ufqh0ov4md1xdl	39.51530686438029	-105.0817379984121	Wetlands Connector North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174wu03uhqh0o1kre8479	39.77376806114841	-105.2540432594913	Mount Galbraith Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ww03ujqh0opk6temw2	39.79884419880863	-105.2483841746176	White Ranch East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174wy03ulqh0olxr0tqyz	39.63610373817627	-105.2394995169651	Mount Falcon Park West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174x103unqh0os6ngy0y0	39.66792448928175	-105.2583952439139	Lair o' the Bear Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174x303upqh0oqpsil42o	39.62330383238078	-105.3464976204034	East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174x503urqh0o921dmmtu	39.62277528951537	-105.3599226665005	West Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174x803utqh0owjsvcf3y	40.52390901829082	-105.181177200884	Horsetooth Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xa03uvqh0ox7yadrjn	40.48011017698511	-105.116686668888	Coyote Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xc03uxqh0oq6o4mpwv	40.41149033575579	-105.1527339569438	Devil's Backbone Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xe03uzqh0ojutq2ysw	40.6111827936701	-105.1534639053823	Reservoir Ridge - Michaud Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xh03v1qh0o2mhvjlrz	38.94892742108528	-104.8861798619426	North Blodgett Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xj03v3qh0otejslwrc	38.94241327034154	-104.8764823979358	South Blodgett Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xm03v5qh0ov368pqry	38.91495000246355	-104.8368882268039	South Rockrimmon Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xo03v7qh0oal79e81v	40.47973228007788	-105.2254484308093	Bobcat Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xq03v9qh0o82y4f6ed	39.64690553400848	-105.1965549534165	Mount Falcon East Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xs03vbqh0owoq8uh1o	38.79522762195057	-104.8587797175117	Ridgeway Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xu03vdqh0orex1ocmy	38.80030514966644	-104.8584998516057	La Veta Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xw03vfqh0o8gtqmqnk	38.79120282510694	-104.7844187793774	Seymour Cray Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174xz03vhqh0op5zaptng	40.45883601355759	-105.1174787839248	Prairie Ridge Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174y103vjqh0o4hz89772	38.7897660768103	-107.6938908196608	Crossroads Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174y303vlqh0oevh5dyku	40.42014818553736	-105.2852775235998	Round Mountain Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174y503vnqh0orweozht3	40.38036626850603	-105.5196703390894	Knoll-Willows North Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174y703vpqh0oi7d9p6fl	40.37782595515745	-105.520812058784	Knoll-Willows Town Hall Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174y903vrqh0ou8c0xq6m	39.02272514758845	-104.6601513772292	Pineries Open Space Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174yc03vtqh0onips09kg	40.70125899597848	-105.2429589397449	Gateway Natural Area Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174ye03vvqh0o8ktlcm4u	37.81074256960846	-107.9083081364214	Galloping Goose Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174yh03vxqh0oqj1k46s4	37.19060714847248	-104.5131108092152	Wormhole Loop Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
clra174yj03vzqh0o0c2lq0yl	37.94485111668937	-105.1022451325967	Pole Creek Trailhead	\N	\N	clra170o60000qh0o4eufy4wk
\.


--
-- Data for Name: TrailOrg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TrailOrg" (id, name) FROM stdin;
clra170o60000qh0o4eufy4wk	COPMOBA
\.


--
-- Data for Name: Trailbucks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Trailbucks" (id, created_at, amount, user_id) FROM stdin;
\.


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transactions" (id, created_at, amount, trail_id, user_id, trail_org_id, confirmation_number) FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, created_at, updated_at, first_name, last_name, email, password, is_new) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- Name: FavoriteTrails FavoriteTrails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FavoriteTrails"
    ADD CONSTRAINT "FavoriteTrails_pkey" PRIMARY KEY (id);


--
-- Name: Notification Notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);


--
-- Name: RecentTrails RecentTrails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RecentTrails"
    ADD CONSTRAINT "RecentTrails_pkey" PRIMARY KEY (id);


--
-- Name: TrailOrg TrailOrg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TrailOrg"
    ADD CONSTRAINT "TrailOrg_pkey" PRIMARY KEY (id);


--
-- Name: Trail Trail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_pkey" PRIMARY KEY (id);


--
-- Name: Trailbucks Trailbucks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trailbucks"
    ADD CONSTRAINT "Trailbucks_pkey" PRIMARY KEY (id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Notification_trail_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Notification_trail_id_key" ON public."Notification" USING btree (trail_id);


--
-- Name: Trailbucks_user_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Trailbucks_user_id_key" ON public."Trailbucks" USING btree (user_id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: FavoriteTrails FavoriteTrails_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FavoriteTrails"
    ADD CONSTRAINT "FavoriteTrails_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Notification Notification_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_trail_id_fkey" FOREIGN KEY (trail_id) REFERENCES public."Trail"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RecentTrails RecentTrails_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RecentTrails"
    ADD CONSTRAINT "RecentTrails_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Trail Trail_favorite_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_favorite_trail_id_fkey" FOREIGN KEY (favorite_trail_id) REFERENCES public."FavoriteTrails"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Trail Trail_recent_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_recent_trail_id_fkey" FOREIGN KEY (recent_trail_id) REFERENCES public."RecentTrails"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Trail Trail_trail_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_trail_org_id_fkey" FOREIGN KEY (trail_org_id) REFERENCES public."TrailOrg"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Trailbucks Trailbucks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trailbucks"
    ADD CONSTRAINT "Trailbucks_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Transactions Transactions_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_trail_id_fkey" FOREIGN KEY (trail_id) REFERENCES public."Trail"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Transactions Transactions_trail_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_trail_org_id_fkey" FOREIGN KEY (trail_org_id) REFERENCES public."TrailOrg"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Transactions Transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

