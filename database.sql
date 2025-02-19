--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-28 11:52:17

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
-- TOC entry 220 (class 1259 OID 24874)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    userid character varying(10) NOT NULL,
    addresstype character varying(10) NOT NULL,
    streetaddress character varying(200) NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(2) NOT NULL,
    zipcode character varying(9) NOT NULL,
    CONSTRAINT address_addresstype_check CHECK (((addresstype)::text = ANY ((ARRAY['office'::character varying, 'home'::character varying, 'mailing'::character varying])::text[])))
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24792)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    companyid character varying(10) NOT NULL,
    companyname character varying(100) NOT NULL
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24815)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    userid character varying(10) NOT NULL,
    salutation character varying(10),
    secretaryid character varying(10),
    personalcomments character varying(500)
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24896)
-- Name: emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emailaddress (
    userid character varying(10) NOT NULL,
    emailaddresstype character varying(10) NOT NULL,
    emailaddress character varying(150) NOT NULL,
    CONSTRAINT emailaddress_emailaddresstype_check CHECK (((emailaddresstype)::text = ANY ((ARRAY['office'::character varying, 'home'::character varying])::text[])))
);


ALTER TABLE public.emailaddress OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24805)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    userid character varying(10) NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    jobtitle character varying(100) NOT NULL,
    companyid character varying(10) NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24797)
-- Name: interactionevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interactionevent (
    eventid character varying(25) NOT NULL,
    interactioneventtype character varying(10) NOT NULL,
    date date NOT NULL,
    comments character varying(500),
    CONSTRAINT interactionevent_interactioneventtype_check CHECK (((interactioneventtype)::text = ANY ((ARRAY['phoneCall'::character varying, 'email'::character varying, 'postalMail'::character varying])::text[])))
);


ALTER TABLE public.interactionevent OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24907)
-- Name: interactioneventparticipation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interactioneventparticipation (
    eventid character varying(25) NOT NULL,
    userid character varying(10) NOT NULL
);


ALTER TABLE public.interactioneventparticipation OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24885)
-- Name: phonenumber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phonenumber (
    userid character varying(10) NOT NULL,
    phonenumbertype character varying(10) NOT NULL,
    phonenumber character varying(10) NOT NULL,
    CONSTRAINT phonenumber_phonenumbertype_check CHECK (((phonenumbertype)::text = ANY ((ARRAY['office'::character varying, 'home'::character varying, 'cell'::character varying, 'fax'::character varying])::text[])))
);


ALTER TABLE public.phonenumber OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24849)
-- Name: subordinate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subordinate (
    subordinateid character varying(10) NOT NULL,
    managerid character varying(10) NOT NULL,
    companyid character varying(10) NOT NULL
);


ALTER TABLE public.subordinate OWNER TO postgres;

--
-- TOC entry 4903 (class 0 OID 24874)
-- Dependencies: 220
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (userid, addresstype, streetaddress, city, state, zipcode) FROM stdin;
g7k3v2w9b1	office	1123 Pinecrest Pl, Rm 201	Seattle	WA	981011234
g7k3v2w9b1	home	1234 Maplewood Ave	Seattle	WA	981012345
w5f3p8k2m7	office	456 Michigan Ave, Rm 604	Chicago	IL	606114567
w5f3p8k2m7	home	456 Oak Dr, Apt 2A	Chicago	IL	606025678
k7t2m9r5x3	office	456 Michigan Ave, Rm 305	Chicago	IL	606114567
f7m8t2k5w3	office	789 State St, Rm 508	Chicago	IL	606057890
f7m8t2k5w3	home	2627 Sycamore Ave, Apt 8F	Chicago	IL	606122345
c8k4j2w6r5	office	789 State St, Rm 409	Chicago	IL	606057890
z7t3d9l1p2	office	7789 Cherry Ave, Rm 310	Boston	MA	021012345
z7t3d9l1p2	home	789 Beacon St	Boston	MA	021156789
\.


--
-- TOC entry 4898 (class 0 OID 24792)
-- Dependencies: 215
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (companyid, companyname) FROM stdin;
A1B2C3D4E5	PixelWave Systems
6F7G8H9J1K	Equinox Financial Services
L2M3N4P5Q6	Apex Innovations
7R8S9T1U2V	Evergreen Consulting
W3X4Y5Z6A7	Velocity Enterprises
\.


--
-- TOC entry 4901 (class 0 OID 24815)
-- Dependencies: 218
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (userid, salutation, secretaryid, personalcomments) FROM stdin;
g7k3v2w9b1	\N	\N	Prefers email
w5f3p8k2m7	\N	\N	Prefers phone calls
k7t2m9r5x3	\N	\N	\N
p4n6d8l1s7	Dr	b6r4x9d3v1	Prefers phone calls
l3w5s8h2p7	Dr	\N	\N
f7m8t2k5w3	\N	x3y5v1d7m9	\N
c8k4j2w6r5	\N	\N	Prefers postal mail
z7t3d9l1p2	\N	\N	\N
m5n8s2r4x7	\N	\N	\N
h3d7f2m8k6	\N	\N	Prefers email
\.


--
-- TOC entry 4905 (class 0 OID 24896)
-- Dependencies: 222
-- Data for Name: emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emailaddress (userid, emailaddresstype, emailaddress) FROM stdin;
g7k3v2w9b1	office	william.brown@pixelwave.com
g7k3v2w9b1	home	williambrown@gmail.com
h6r8j4p2x3	office	sophia.johnson@pixelwave.com
t9m2d5b6z8	office	christopher.taylor@pixelwave.com
n4y7s1u8l3	office	olivia.martinez@pixelwave.com
w5f3p8k2m7	office	benjamin.lee@equinoxfinancial.com
d9g2r5x1v4	office	abigail.thomas@equinoxfinancial.com
j6b8w3z4c2	office	joshua.clark@equinoxfinancial.com
k7t2m9r5x3	office	madison.harris@equinoxfinancial.com
k7t2m9r5x3	home	madisonharris@outlook.com
p4n6d8l1s7	office	alexander.lewis@apexinnovations.com
m2y9j7k3t5	office	megan.walker@apexinnovations.com
l3w5s8h2p7	office	joshua.king@apexinnovations.com
l3w5s8h2p7	home	joshuaking@gmail.com
b6r4x9d3v1	office	mia.wright@apexinnovations.com
f7m8t2k5w3	office	anthony.hall@evergreenconsulting.com
p9j6n4z2s8	office	samantha.young@evergreenconsulting.com
x3y5v1d7m9	office	andrew.allen@evergreenconsulting.com
c8k4j2w6r5	office	ava.scott@evergreenconsulting.com
c8k4j2w6r5	home	avascott@outlook.com
z7t3d9l1p2	office	joseph.adams@velocityenterprises.com
z7t3d9l1p2	home	josephadams@gmail.com
m5n8s2r4x7	office	natalie.baker@velocityenterprises.com
g4y9l6p3v2	office	matthew.phillips@velocityenterprises.com
h3d7f2m8k6	office	chloe.campbell@velocityenterprises.com
\.


--
-- TOC entry 4900 (class 0 OID 24805)
-- Dependencies: 217
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (userid, firstname, lastname, jobtitle, companyid) FROM stdin;
g7k3v2w9b1	William	Brown	IT Project Manager	A1B2C3D4E5
h6r8j4p2x3	Sophia	Johnson	Software Developer	A1B2C3D4E5
t9m2d5b6z8	Christopher	Taylor	Database Administrator	A1B2C3D4E5
n4y7s1u8l3	Olivia	Martinez	Quality Assurance Tester	A1B2C3D4E5
w5f3p8k2m7	Benjamin	Lee	Audit and Compliance Manager	6F7G8H9J1K
d9g2r5x1v4	Abigail	Thomas	Internal Auditor	6F7G8H9J1K
j6b8w3z4c2	Joshua	Clark	Compliance Analyst	6F7G8H9J1K
k7t2m9r5x3	Madison	Harris	Financial Planner	6F7G8H9J1K
p4n6d8l1s7	Alexander	Lewis	R&D Manager	L2M3N4P5Q6
m2y9j7k3t5	Megan	Walker	Product Development Engineer	L2M3N4P5Q6
l3w5s8h2p7	Joshua	King	Research Scientist	L2M3N4P5Q6
b6r4x9d3v1	Mia	Wright	Administrative Assistant	L2M3N4P5Q6
f7m8t2k5w3	Anthony	Hall	Consulting Services Manager	7R8S9T1U2V
p9j6n4z2s8	Samantha	Young	Junior Consultant	7R8S9T1U2V
x3y5v1d7m9	Andrew	Allen	Administrative Assistant	7R8S9T1U2V
c8k4j2w6r5	Ava	Scott	Senior Consultant	7R8S9T1U2V
z7t3d9l1p2	Joseph	Adams	Operations Manager	W3X4Y5Z6A7
m5n8s2r4x7	Natalie	Baker	Logistics Specialist	W3X4Y5Z6A7
g4y9l6p3v2	Matthew	Phillips	Supply Chain Analyst	W3X4Y5Z6A7
h3d7f2m8k6	Chloe	Campbell	Facilities Coordinator	W3X4Y5Z6A7
\.


--
-- TOC entry 4899 (class 0 OID 24797)
-- Dependencies: 216
-- Data for Name: interactionevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interactionevent (eventid, interactioneventtype, date, comments) FROM stdin;
a1b2c3d4e5f6g7h8j9k0l1m2n	phoneCall	2022-10-05	discussed software for new product
z9y8x7w6v5u4t3s2r1q0p1o2n	email	2022-01-31	\N
j8k7l6m5n4b3v2c1x0z9y8a7b	postalMail	2022-07-08	Adams sent documents to Hall
n1m2l3k4j5h6g7f8d9s0a1q2w	phoneCall	2022-12-01	follow up next week
f5d4s3a2q1w0e9r8t7y6u5i4o	phoneCall	2022-02-03	\N
p1o2i3u4y5t6r7e8w9q0a1s2d	email	2022-12-07	forward to remainder of Operations team
g7h6j5k4l3m2n1b0v9c8x7z6y	postalMail	2022-05-27	\N
e5r4t3y2u1i0o9p8q7w6e5r4t	email	2022-03-21	\N
q9w8e7r6t5y4u3i2o1p0a9s8d	phoneCall	2022-09-19	\N
y1x2c3v4b5n6m7j8k9l0h1g2f	email	2022-09-02	\N
\.


--
-- TOC entry 4906 (class 0 OID 24907)
-- Dependencies: 223
-- Data for Name: interactioneventparticipation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interactioneventparticipation (eventid, userid) FROM stdin;
a1b2c3d4e5f6g7h8j9k0l1m2n	g7k3v2w9b1
a1b2c3d4e5f6g7h8j9k0l1m2n	p4n6d8l1s7
a1b2c3d4e5f6g7h8j9k0l1m2n	l3w5s8h2p7
z9y8x7w6v5u4t3s2r1q0p1o2n	k7t2m9r5x3
z9y8x7w6v5u4t3s2r1q0p1o2n	c8k4j2w6r5
j8k7l6m5n4b3v2c1x0z9y8a7b	f7m8t2k5w3
j8k7l6m5n4b3v2c1x0z9y8a7b	z7t3d9l1p2
n1m2l3k4j5h6g7f8d9s0a1q2w	p4n6d8l1s7
n1m2l3k4j5h6g7f8d9s0a1q2w	z7t3d9l1p2
f5d4s3a2q1w0e9r8t7y6u5i4o	w5f3p8k2m7
f5d4s3a2q1w0e9r8t7y6u5i4o	f7m8t2k5w3
p1o2i3u4y5t6r7e8w9q0a1s2d	p4n6d8l1s7
p1o2i3u4y5t6r7e8w9q0a1s2d	z7t3d9l1p2
p1o2i3u4y5t6r7e8w9q0a1s2d	m5n8s2r4x7
p1o2i3u4y5t6r7e8w9q0a1s2d	h3d7f2m8k6
g7h6j5k4l3m2n1b0v9c8x7z6y	w5f3p8k2m7
g7h6j5k4l3m2n1b0v9c8x7z6y	f7m8t2k5w3
e5r4t3y2u1i0o9p8q7w6e5r4t	w5f3p8k2m7
e5r4t3y2u1i0o9p8q7w6e5r4t	p4n6d8l1s7
q9w8e7r6t5y4u3i2o1p0a9s8d	g7k3v2w9b1
q9w8e7r6t5y4u3i2o1p0a9s8d	c8k4j2w6r5
y1x2c3v4b5n6m7j8k9l0h1g2f	c8k4j2w6r5
y1x2c3v4b5n6m7j8k9l0h1g2f	m5n8s2r4x7
\.


--
-- TOC entry 4904 (class 0 OID 24885)
-- Dependencies: 221
-- Data for Name: phonenumber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phonenumber (userid, phonenumbertype, phonenumber) FROM stdin;
g7k3v2w9b1	office	2065551234
g7k3v2w9b1	cell	2065552340
h6r8j4p2x3	office	2065555678
t9m2d5b6z8	office	2065559012
n4y7s1u8l3	office	2065553456
w5f3p8k2m7	office	3125551234
w5f3p8k2m7	fax	3125556901
d9g2r5x1v4	office	3125555678
j6b8w3z4c2	office	3125556780
k7t2m9r5x3	office	3125552346
p4n6d8l1s7	office	2135551234
m2y9j7k3t5	office	2135555678
l3w5s8h2p7	office	2135554322
b6r4x9d3v1	office	2135557891
f7m8t2k5w3	office	3125551239
f7m8t2k5w3	home	3125554327
f7m8t2k5w3	cell	3125552341
p9j6n4z2s8	office	3125559017
x3y5v1d7m9	office	3125555673
c8k4j2w6r5	office	3125550987
z7t3d9l1p2	office	6175551234
z7t3d9l1p2	cell	6175552468
m5n8s2r4x7	office	6175555678
g4y9l6p3v2	office	6175554321
h3d7f2m8k6	office	6175555432
\.


--
-- TOC entry 4902 (class 0 OID 24849)
-- Dependencies: 219
-- Data for Name: subordinate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subordinate (subordinateid, managerid, companyid) FROM stdin;
h6r8j4p2x3	g7k3v2w9b1	A1B2C3D4E5
t9m2d5b6z8	g7k3v2w9b1	A1B2C3D4E5
n4y7s1u8l3	g7k3v2w9b1	A1B2C3D4E5
d9g2r5x1v4	w5f3p8k2m7	6F7G8H9J1K
j6b8w3z4c2	w5f3p8k2m7	6F7G8H9J1K
m2y9j7k3t5	p4n6d8l1s7	L2M3N4P5Q6
l3w5s8h2p7	p4n6d8l1s7	L2M3N4P5Q6
p9j6n4z2s8	f7m8t2k5w3	7R8S9T1U2V
m5n8s2r4x7	z7t3d9l1p2	W3X4Y5Z6A7
g4y9l6p3v2	z7t3d9l1p2	W3X4Y5Z6A7
h3d7f2m8k6	z7t3d9l1p2	W3X4Y5Z6A7
\.


--
-- TOC entry 4736 (class 2606 OID 24879)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (userid, addresstype);


--
-- TOC entry 4724 (class 2606 OID 24796)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (companyid);


--
-- TOC entry 4732 (class 2606 OID 24821)
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (userid);


--
-- TOC entry 4740 (class 2606 OID 24901)
-- Name: emailaddress emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emailaddress
    ADD CONSTRAINT emailaddress_pkey PRIMARY KEY (userid, emailaddresstype);


--
-- TOC entry 4728 (class 2606 OID 24809)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (userid);


--
-- TOC entry 4730 (class 2606 OID 24848)
-- Name: employee employee_userid_companyid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_userid_companyid_key UNIQUE (userid, companyid);


--
-- TOC entry 4726 (class 2606 OID 24804)
-- Name: interactionevent interactionevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactionevent
    ADD CONSTRAINT interactionevent_pkey PRIMARY KEY (eventid);


--
-- TOC entry 4742 (class 2606 OID 24911)
-- Name: interactioneventparticipation interactioneventparticipation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactioneventparticipation
    ADD CONSTRAINT interactioneventparticipation_pkey PRIMARY KEY (eventid, userid);


--
-- TOC entry 4738 (class 2606 OID 24890)
-- Name: phonenumber phonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phonenumber
    ADD CONSTRAINT phonenumber_pkey PRIMARY KEY (userid, phonenumbertype);


--
-- TOC entry 4734 (class 2606 OID 24853)
-- Name: subordinate subordinate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subordinate
    ADD CONSTRAINT subordinate_pkey PRIMARY KEY (subordinateid);


--
-- TOC entry 4750 (class 2606 OID 24880)
-- Name: address address_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_userid_fkey FOREIGN KEY (userid) REFERENCES public.employee(userid) ON UPDATE CASCADE;


--
-- TOC entry 4744 (class 2606 OID 24827)
-- Name: contact contact_secretaryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_secretaryid_fkey FOREIGN KEY (secretaryid) REFERENCES public.employee(userid) ON UPDATE CASCADE;


--
-- TOC entry 4745 (class 2606 OID 24822)
-- Name: contact contact_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_userid_fkey FOREIGN KEY (userid) REFERENCES public.employee(userid) ON UPDATE CASCADE;


--
-- TOC entry 4752 (class 2606 OID 24902)
-- Name: emailaddress emailaddress_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emailaddress
    ADD CONSTRAINT emailaddress_userid_fkey FOREIGN KEY (userid) REFERENCES public.employee(userid) ON UPDATE CASCADE;


--
-- TOC entry 4743 (class 2606 OID 24810)
-- Name: employee employee_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_companyid_fkey FOREIGN KEY (companyid) REFERENCES public.company(companyid) ON UPDATE CASCADE;


--
-- TOC entry 4753 (class 2606 OID 24912)
-- Name: interactioneventparticipation interactioneventparticipation_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactioneventparticipation
    ADD CONSTRAINT interactioneventparticipation_eventid_fkey FOREIGN KEY (eventid) REFERENCES public.interactionevent(eventid) ON UPDATE CASCADE;


--
-- TOC entry 4754 (class 2606 OID 24917)
-- Name: interactioneventparticipation interactioneventparticipation_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactioneventparticipation
    ADD CONSTRAINT interactioneventparticipation_userid_fkey FOREIGN KEY (userid) REFERENCES public.employee(userid) ON UPDATE CASCADE;


--
-- TOC entry 4751 (class 2606 OID 24891)
-- Name: phonenumber phonenumber_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phonenumber
    ADD CONSTRAINT phonenumber_userid_fkey FOREIGN KEY (userid) REFERENCES public.employee(userid) ON UPDATE CASCADE;


--
-- TOC entry 4746 (class 2606 OID 24869)
-- Name: subordinate subordinate_managerid_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subordinate
    ADD CONSTRAINT subordinate_managerid_companyid_fkey FOREIGN KEY (managerid, companyid) REFERENCES public.employee(userid, companyid) ON UPDATE CASCADE;


--
-- TOC entry 4747 (class 2606 OID 24859)
-- Name: subordinate subordinate_managerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subordinate
    ADD CONSTRAINT subordinate_managerid_fkey FOREIGN KEY (managerid) REFERENCES public.employee(userid) ON UPDATE CASCADE;


--
-- TOC entry 4748 (class 2606 OID 24864)
-- Name: subordinate subordinate_subordinateid_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subordinate
    ADD CONSTRAINT subordinate_subordinateid_companyid_fkey FOREIGN KEY (subordinateid, companyid) REFERENCES public.employee(userid, companyid) ON UPDATE CASCADE;


--
-- TOC entry 4749 (class 2606 OID 24854)
-- Name: subordinate subordinate_subordinateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subordinate
    ADD CONSTRAINT subordinate_subordinateid_fkey FOREIGN KEY (subordinateid) REFERENCES public.employee(userid) ON UPDATE CASCADE;


-- Completed on 2024-11-28 11:52:18

--
-- PostgreSQL database dump complete
--

