CREATE TYPE public.t_sexo AS ENUM (
    'Masculino',
    'Femenino'
);


--
-- Name: t_sino; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.t_sino AS ENUM (
    'N',
    'S'
);


--
-- Name: t_tipocama; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.t_tipocama AS ENUM (
    'Simple',
    'Matrimonial',
    'Matrimonial King Size'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ciudades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ciudades (
    pais_codigo character(2) NOT NULL,
    division_politica_codigo smallint NOT NULL,
    ciudad_codigo integer NOT NULL,
    nombre character varying(100) DEFAULT NULL::character varying,
    latitud numeric(10,7) DEFAULT NULL::numeric,
    longitud numeric(10,7) DEFAULT NULL::numeric
);


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clientes (
    cliente_documento integer NOT NULL,
    nombre character varying(15) NOT NULL,
    apellido character varying(65) NOT NULL,
    sexo public.t_sexo NOT NULL,
    fecha_nacimiento date,
    ocupacion_codigo character(5) DEFAULT NULL::bpchar,
    pais_codigo character(2) DEFAULT NULL::bpchar,
    division_politica_codigo smallint DEFAULT NULL::numeric,
    ciudad_codigo integer DEFAULT NULL::numeric
);


--
-- Name: continentes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.continentes (
    continente_codigo character(2) NOT NULL,
    nombre character varying(20) DEFAULT NULL::character varying
);


--
-- Name: costos_habitacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.costos_habitacion (
    hotel_codigo integer NOT NULL,
    nro_habitacion smallint NOT NULL,
    fecha_desde date NOT NULL,
    costo_noche numeric(5,2) NOT NULL,
    precio_noche numeric(5,2) NOT NULL
);


--
-- Name: divisiones_politicas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.divisiones_politicas (
    pais_codigo character(2) NOT NULL,
    division_politica_codigo smallint NOT NULL,
    nombre character varying(80) DEFAULT NULL::character varying,
    zona_horaria character varying(30) DEFAULT NULL::character varying
);


--
-- Name: estadias_anteriores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estadias_anteriores (
    hotel_codigo integer NOT NULL,
    nro_habitacion smallint NOT NULL,
    cliente_documento integer NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL
);


--
-- Name: habitaciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.habitaciones (
    hotel_codigo integer NOT NULL,
    nro_habitacion smallint NOT NULL,
    tipo_habitacion_codigo smallint NOT NULL,
    m2 smallint DEFAULT NULL::numeric
);


--
-- Name: hoteles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hoteles (
    hotel_codigo integer NOT NULL,
    nombre character varying(100) DEFAULT NULL::character varying,
    estrellas smallint NOT NULL,
    latitud numeric(10,7) DEFAULT NULL::numeric,
    longitud numeric(10,7) DEFAULT NULL::numeric,
    pais_codigo character(2) NOT NULL,
    division_politica_codigo smallint NOT NULL,
    ciudad_codigo integer NOT NULL
);


--
-- Name: limitan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.limitan (
    pais1_codigo character(2) NOT NULL,
    pais2_codigo character(2) NOT NULL
);


--
-- Name: ocupaciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ocupaciones (
    ocupacion_codigo character(5) NOT NULL,
    descripcion character varying(255) NOT NULL
);


--
-- Name: paises; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.paises (
    pais_codigo character(2) NOT NULL,
    nombre character varying(60) DEFAULT NULL::character varying,
    tld character(3) DEFAULT NULL::bpchar,
    prefijo_telefonico character(20) DEFAULT NULL::bpchar,
    continente_codigo character(2) NOT NULL
);


--
-- Name: reservas_anteriores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservas_anteriores (
    hotel_codigo integer NOT NULL,
    nro_habitacion smallint NOT NULL,
    cliente_documento integer NOT NULL,
    fecha_reserva date NOT NULL,
    check_in date NOT NULL
);


--
-- Name: tipos_habitacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipos_habitacion (
    tipo_habitacion_codigo smallint NOT NULL,
    descripcion character varying(25) NOT NULL,
    tv_cable public.t_sino NOT NULL,
    frigobar public.t_sino NOT NULL,
    tipo_cama public.t_tipocama NOT NULL,
    cant_camas smallint NOT NULL
);

