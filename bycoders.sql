PGDMP                     	    z            BYCODERS    11.15    11.6                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    567923    BYCODERS    DATABASE     ?   CREATE DATABASE "BYCODERS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE "BYCODERS";
             postgres    false            ?            1259    567932    bcd_access_bcd_acc_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.bcd_access_bcd_acc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.bcd_access_bcd_acc_id_seq;
       public       postgres    false            ?            1259    567924 
   bcd_access    TABLE     P  CREATE TABLE public.bcd_access (
    bcd_acc_id integer DEFAULT nextval('public.bcd_access_bcd_acc_id_seq'::regclass) NOT NULL,
    bcd_acc_name character varying(200) NOT NULL,
    bcd_acc_login character varying(100) NOT NULL,
    bcd_acc_password character varying(100) NOT NULL,
    bcd_acc_token character varying(500) NOT NULL
);
    DROP TABLE public.bcd_access;
       public         postgres    false    197            ?            1259    567942    bcd_transactions_bcd_tra_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.bcd_transactions_bcd_tra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.bcd_transactions_bcd_tra_id_seq;
       public       postgres    false            ?            1259    567937    bcd_transactions    TABLE       CREATE TABLE public.bcd_transactions (
    bcd_tra_id integer DEFAULT nextval('public.bcd_transactions_bcd_tra_id_seq'::regclass) NOT NULL,
    bcd_tra_type integer NOT NULL,
    bcd_tra_date date NOT NULL,
    bcd_tra_amount numeric(9,2) NOT NULL,
    bcd_tra_cpf character varying(11) NOT NULL,
    bcd_tra_card_number character varying(12) NOT NULL,
    bcd_tra_time time without time zone NOT NULL,
    bcd_tra_store_owner character varying(14) NOT NULL,
    bcd_tra_store_name character varying(19) NOT NULL
);
 $   DROP TABLE public.bcd_transactions;
       public         postgres    false    199                      0    567924 
   bcd_access 
   TABLE DATA               n   COPY public.bcd_access (bcd_acc_id, bcd_acc_name, bcd_acc_login, bcd_acc_password, bcd_acc_token) FROM stdin;
    public       postgres    false    196          	          0    567937    bcd_transactions 
   TABLE DATA               ?   COPY public.bcd_transactions (bcd_tra_id, bcd_tra_type, bcd_tra_date, bcd_tra_amount, bcd_tra_cpf, bcd_tra_card_number, bcd_tra_time, bcd_tra_store_owner, bcd_tra_store_name) FROM stdin;
    public       postgres    false    198   2                  0    0    bcd_access_bcd_acc_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.bcd_access_bcd_acc_id_seq', 1, false);
            public       postgres    false    197                       0    0    bcd_transactions_bcd_tra_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.bcd_transactions_bcd_tra_id_seq', 1, false);
            public       postgres    false    199            ?
           2606    567936 $   bcd_access bcd_access_bcd_acc_id_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.bcd_access
    ADD CONSTRAINT bcd_access_bcd_acc_id_key UNIQUE (bcd_acc_id);
 N   ALTER TABLE ONLY public.bcd_access DROP CONSTRAINT bcd_access_bcd_acc_id_key;
       public         postgres    false    196            ?
           2606    567931    bcd_access bcd_access_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.bcd_access
    ADD CONSTRAINT bcd_access_pkey PRIMARY KEY (bcd_acc_id);
 D   ALTER TABLE ONLY public.bcd_access DROP CONSTRAINT bcd_access_pkey;
       public         postgres    false    196            ?
           2606    567946 0   bcd_transactions bcd_transactions_bcd_tra_id_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.bcd_transactions
    ADD CONSTRAINT bcd_transactions_bcd_tra_id_key UNIQUE (bcd_tra_id);
 Z   ALTER TABLE ONLY public.bcd_transactions DROP CONSTRAINT bcd_transactions_bcd_tra_id_key;
       public         postgres    false    198            ?
           2606    567941 &   bcd_transactions bcd_transactions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.bcd_transactions
    ADD CONSTRAINT bcd_transactions_pkey PRIMARY KEY (bcd_tra_id);
 P   ALTER TABLE ONLY public.bcd_transactions DROP CONSTRAINT bcd_transactions_pkey;
       public         postgres    false    198                  x?????? ? ?      	      x?????? ? ?     