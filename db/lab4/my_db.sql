PGDMP  8    +                }           ecomerce    17.5    17.5 <    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    26250    ecomerce    DATABASE     �   CREATE DATABASE ecomerce WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE ecomerce;
                     postgres    false            �            1255    26306 ~   add_customer(character varying, character varying, character varying, character varying, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.add_customer(IN customer_name character varying, IN contact_name character varying, IN address character varying, IN city character varying, IN postal_code character varying, IN country character varying)
    LANGUAGE plpgsql
    AS $$
begin 
insert into customers(customer_name  , contact_name  , address , city , postal_code , country )
values (customer_name  , contact_name  , address , city , postal_code , country );
end;
$$;
 �   DROP PROCEDURE public.add_customer(IN customer_name character varying, IN contact_name character varying, IN address character varying, IN city character varying, IN postal_code character varying, IN country character varying);
       public               postgres    false            �            1255    26303    category_product(integer)    FUNCTION     8  CREATE FUNCTION public.category_product(p_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare cat varchar;
begin  
select c.category_name into cat  from categories c
inner join products p on p.category_id = c.category_id
where p.product_id =  category_product.p_id;
return cat;
end;
$$;
 5   DROP FUNCTION public.category_product(p_id integer);
       public               postgres    false            �            1255    26309    prevent_deletion()    FUNCTION       CREATE FUNCTION public.prevent_deletion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare total int;
begin
select count(*) into total from products
where category_id = old.category_id;
if total>0 then
raise exception 'Cannot delete category';
end if;
return old;
end
$$;
 )   DROP FUNCTION public.prevent_deletion();
       public               postgres    false            �            1255    26301    total(integer)    FUNCTION     �   CREATE FUNCTION public.total(c_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
count int;
begin
select count(*) into count from orders
where orders.customer_id = total.c_id;
return count;
end;
$$;
 *   DROP FUNCTION public.total(c_id integer);
       public               postgres    false            �            1255    26327    total_revenue(integer)    FUNCTION     A  CREATE FUNCTION public.total_revenue(product_id integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$

declare 
total decimal;

begin

select sum(o.quantity * p.price) into total
from products p
join order_details o ON p.product_id = o.product_id

where p.product_id = total_revenue.product_id;

return total;
end;
$$;
 8   DROP FUNCTION public.total_revenue(product_id integer);
       public               postgres    false            �            1255    26307 !   update_category(integer, integer) 	   PROCEDURE     �   CREATE PROCEDURE public.update_category(IN p_id integer, IN new_cat_id integer)
    LANGUAGE plpgsql
    AS $$
begin 
update products
set category_id = new_cat_id
where product_id = p_id;
end;
$$;
 O   DROP PROCEDURE public.update_category(IN p_id integer, IN new_cat_id integer);
       public               postgres    false            �            1259    26252 
   categories    TABLE     �   CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(255),
    description character varying(255)
);
    DROP TABLE public.categories;
       public         heap r       postgres    false            �            1259    26251    categories_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_category_id_seq;
       public               postgres    false    218                       0    0    categories_category_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;
          public               postgres    false    217            �            1259    26261 	   customers    TABLE     (  CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name character varying(255),
    contact_name character varying(255),
    address character varying(255),
    city character varying(255),
    postal_code character varying(255),
    country character varying(255)
);
    DROP TABLE public.customers;
       public         heap r       postgres    false            �            1259    26260    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public               postgres    false    220                       0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public               postgres    false    219            �            1259    26315    done_orders    VIEW     �   CREATE VIEW public.done_orders AS
SELECT
    NULL::integer AS customer_id,
    NULL::character varying(255) AS customer_name,
    NULL::bigint AS count;
    DROP VIEW public.done_orders;
       public       v       postgres    false            �            1259    26286    order_details    TABLE     �   CREATE TABLE public.order_details (
    order_detail_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer
);
 !   DROP TABLE public.order_details;
       public         heap r       postgres    false            �            1259    26285 !   order_details_order_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_details_order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.order_details_order_detail_id_seq;
       public               postgres    false    226                       0    0 !   order_details_order_detail_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.order_details_order_detail_id_seq OWNED BY public.order_details.order_detail_id;
          public               postgres    false    225            �            1259    26279    orders    TABLE     l   CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date date
);
    DROP TABLE public.orders;
       public         heap r       postgres    false                       0    0    TABLE orders    ACL     +   GRANT SELECT ON TABLE public.orders TO mo;
          public               postgres    false    224            �            1259    26278    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public               postgres    false    224                       0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public               postgres    false    223            �            1259    26270    products    TABLE     �   CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(255),
    category_id integer,
    unit character varying(255),
    price numeric(10,2)
);
    DROP TABLE public.products;
       public         heap r       postgres    false                       0    0    TABLE products    ACL     -   GRANT SELECT ON TABLE public.products TO mo;
          public               postgres    false    222            �            1259    26311    price_label    VIEW     M  CREATE VIEW public.price_label AS
 SELECT product_id,
    product_name,
    price,
        CASE
            WHEN (price < (50)::numeric) THEN 'Cheap'::text
            WHEN ((price >= (50)::numeric) AND (price < (150)::numeric)) THEN 'Moderate'::text
            ELSE 'Expensive'::text
        END AS "case"
   FROM public.products;
    DROP VIEW public.price_label;
       public       v       postgres    false    222    222    222            �            1259    26269    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public               postgres    false    222                       0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public               postgres    false    221            �            1259    26293    testproducts    TABLE     �   CREATE TABLE public.testproducts (
    testproduct_id integer NOT NULL,
    product_name character varying(255),
    category_id integer
);
     DROP TABLE public.testproducts;
       public         heap r       postgres    false            �            1259    26292    testproducts_testproduct_id_seq    SEQUENCE     �   CREATE SEQUENCE public.testproducts_testproduct_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.testproducts_testproduct_id_seq;
       public               postgres    false    228            	           0    0    testproducts_testproduct_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.testproducts_testproduct_id_seq OWNED BY public.testproducts.testproduct_id;
          public               postgres    false    227            H           2604    26255    categories category_id    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
       public               postgres    false    217    218    218            I           2604    26264    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public               postgres    false    219    220    220            L           2604    26289    order_details order_detail_id    DEFAULT     �   ALTER TABLE ONLY public.order_details ALTER COLUMN order_detail_id SET DEFAULT nextval('public.order_details_order_detail_id_seq'::regclass);
 L   ALTER TABLE public.order_details ALTER COLUMN order_detail_id DROP DEFAULT;
       public               postgres    false    226    225    226            K           2604    26282    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public               postgres    false    224    223    224            J           2604    26273    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public               postgres    false    222    221    222            M           2604    26296    testproducts testproduct_id    DEFAULT     �   ALTER TABLE ONLY public.testproducts ALTER COLUMN testproduct_id SET DEFAULT nextval('public.testproducts_testproduct_id_seq'::regclass);
 J   ALTER TABLE public.testproducts ALTER COLUMN testproduct_id DROP DEFAULT;
       public               postgres    false    227    228    228            �          0    26252 
   categories 
   TABLE DATA           M   COPY public.categories (category_id, category_name, description) FROM stdin;
    public               postgres    false    218   �K       �          0    26261 	   customers 
   TABLE DATA           r   COPY public.customers (customer_id, customer_name, contact_name, address, city, postal_code, country) FROM stdin;
    public               postgres    false    220   �L       �          0    26286    order_details 
   TABLE DATA           X   COPY public.order_details (order_detail_id, order_id, product_id, quantity) FROM stdin;
    public               postgres    false    226   \]       �          0    26279    orders 
   TABLE DATA           C   COPY public.orders (order_id, customer_id, order_date) FROM stdin;
    public               postgres    false    224   ��       �          0    26270    products 
   TABLE DATA           V   COPY public.products (product_id, product_name, category_id, unit, price) FROM stdin;
    public               postgres    false    222   h�       �          0    26293    testproducts 
   TABLE DATA           Q   COPY public.testproducts (testproduct_id, product_name, category_id) FROM stdin;
    public               postgres    false    228   I�       
           0    0    categories_category_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.categories_category_id_seq', 8, true);
          public               postgres    false    217                       0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 94, true);
          public               postgres    false    219                       0    0 !   order_details_order_detail_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.order_details_order_detail_id_seq', 2155, true);
          public               postgres    false    225                       0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);
          public               postgres    false    223                       0    0    products_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_product_id_seq', 1, true);
          public               postgres    false    221                       0    0    testproducts_testproduct_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.testproducts_testproduct_id_seq', 10, true);
          public               postgres    false    227            O           2606    26259    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public                 postgres    false    218            S           2606    26268    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public                 postgres    false    220            Z           2606    26291     order_details order_details_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (order_detail_id);
 J   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_pkey;
       public                 postgres    false    226            X           2606    26284    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    224            U           2606    26277    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    222            \           2606    26298    testproducts testproducts_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.testproducts
    ADD CONSTRAINT testproducts_pkey PRIMARY KEY (testproduct_id);
 H   ALTER TABLE ONLY public.testproducts DROP CONSTRAINT testproducts_pkey;
       public                 postgres    false    228            Q           1259    26319    c_id    INDEX     A   CREATE INDEX c_id ON public.customers USING btree (customer_id);
    DROP INDEX public.c_id;
       public                 postgres    false    220            P           1259    26322    idx_2    INDEX     L   CREATE UNIQUE INDEX idx_2 ON public.categories USING btree (category_name);
    DROP INDEX public.idx_2;
       public                 postgres    false    218            V           1259    26320    o_id    INDEX     >   CREATE INDEX o_id ON public.orders USING btree (customer_id);
    DROP INDEX public.o_id;
       public                 postgres    false    224            �           2618    26318    done_orders _RETURN    RULE     �   CREATE OR REPLACE VIEW public.done_orders AS
 SELECT c.customer_id,
    c.customer_name,
    count(o.order_id) AS count
   FROM (public.customers c
     JOIN public.orders o ON ((c.customer_id = o.customer_id)))
  GROUP BY c.customer_id;
 �   CREATE OR REPLACE VIEW public.done_orders AS
SELECT
    NULL::integer AS customer_id,
    NULL::character varying(255) AS customer_name,
    NULL::bigint AS count;
       public               postgres    false    220    220    4691    224    224    230            �   �   x�5O�n�0�������T�@�.�tJ�8�A�)����t�����D{\!|�ҡ��I���/1�T��Ρ�ꞩ-9�r��_��;�k����[����t:	8��$KN���eщ�5���AR{�%��W�aUp��q2�^J����'�i���K8eݵ0樴�[za^�O��7M���;}��/�X�F�`bAh.6U�A���d�(s�����Ip,%,hAú����yt��)�y      �      x�}��r�H�����Ȉ�8W�!��O��mƸ��'�&�4d#��~�':�q^�|;��{b:���,�r��Zk'�e/�]����*[l]YYuo
g�(_٢T�[X=�������U��v���;�Z]5ʍ~.��]�y}���4+_���L>�t���̅^Y�=�yY��^:��.��{��-�����P��ӍNWZ1�T>w^����^?�?j[�?]&�ʰy�ߍ������Q��|����_}���ߙR5��@�>���z�ǅ��|�s�}��r�~�k%��u��.s�Xl�ݫɦ ���Ͽ�կ�]�\�jZg֨y{�����ove�V_�3S�ˬ՗6s[Sٲ��b�v���/�����u;�O�N��$T*c�6�{)����x���4=q�5���}���,���,�V�ڔ_k�t:2�ҶR5��[y
�s+��/,�6|����ݎ&ף�ʸ���W�[�n*����[C�ʵ����Ԕ��O��mL^��/�`�+[걯�A!/(-б*�;������BU�w�K�e��ܷ�Ui�U�fa����|�\uc�\�7#	���uu��V��k������Ԋ"5��ʛ�-կnY������F]�:�20v �Ų.�踚tu��,� z����#e�Kū)��T��z�v��''�(\�u�j\��R�\�ۣq�
�#�jE1��U��ғ�3�XV�X�L�W��	�\��cY^M��!:=�4ŹMZY��}��-�m\nI�o,���z_M����C�u��N$v�r0��%j�쌎�yWx5�+6<z�٥�i~֥�|т���԰C'���v�G
stY+�+a	���U�����*����~�6c�74��Ku��}��A���?#ݟ6���|���O-�R�Wp�XU����d�-��Z�F���J���G�E����N�NK��o&'z=5���-������M^Y�� ?�����q�P]i�\H2��
���rv�ʧ8�w�A�X8>�u��������v�ԓ���{~�����_�Vi ZMu�i�ٹLP_����(�t�����6�����ݟ�ףxq�\<�u};���5ypK�o���M�ܸ�l�/F��ٵ�O��A 0�Ɏ�8H$�"��w"0s$����I�g&��I2��v�5AJ��3w�Ʃi��d�)�ݞ,��~��/�����S�G�s���D�Glv��0x��	ǝ���ն6�9Jv�	V�.����TG���<�)����CQ��]i���"M(���|�ٹ�RI�ԓ?��O��OG�����h�h����&�"8;n�|z��CD�u:�2��qkI��,MF>�%�����DBs)EZ����~�r;-�F�;��q�ې��� Q3vP��J��/�$!��ＺZլE�
��dv�Ln�J����cS,-�giA �7^xf◢��n��7�>B��=	a�/����W�aT/"�"�d�T��s+��#���p�ea�5@_����k�罥���A�= Ƨ� 7�5���^{�:I����Y��J�����$YW52`�p������ņo��W���tKL\^����H\G�^텞�����[�@ZTQU��4R����M$@ �Ty�Z���I����>����*P^�{X 鵉�=�D}����nڣ��Ų�����(
K����~O7�}��,U�-m�؜>�����
��i�}���א��<������?T���v��R����۬p�t���$�S�3������ ��B���2=ʲ��[o*��bTN�NW-�,�M������� 3+���*u[ؠ�q�n����X)'��aPx�pU#d(^h'�V�@���Ff�q��oB��P�a��������m �=������~&��B�^�>�����QʮW�,�@���z�%�zF[�A�t�����-e���^K5H?QQ/�Ew�A��:*�-5}��JE��FY�mO=������Wq�y��x��FVZn�Y߅'V�`y*�8�ܥ"�^?�m(�Bv5$�~��u�.:;?(yj�}��*�܀F��G�:�)QNz�>��"5x)���W�n@K���vCN�"��'�'�c3���CY��H.��KZ����V�N��W&a���M����cԠZ��#]�<СYR�k<�nz���!��`��WSz�=�į1������H吏L>��XX��~��z
~�����JvTy
V��-{��������~����A�<e1�DuoB7x�s{�\C�qɰ�0�|^;�cKh\ςx�R�����C�MZW���I��],W�̰)
Uq��h�J���չC6o���\`8̲FG��ʿ��v��YN��� d�އ�&]p�3�����������o�c�	j1.�6�ԸED>�S�k%2�A3i9�
�͆rے^��84�࡙�*%���d�k�MG�����@�d�x�[2�n}Y�QfY�d,*u�@	qj���ֈ\4�8Hb� ���!n�%f���
O��<��Q[ފ=\}����������z\Z�H*UI����\��^����F���}��5��|Q�I�����tڣ�:Z%�z�V�;�[�w�
�Ҳ$6�%�LZ�R�u���X�}��`(�+��X��J&y�.p���F�{�)��)�q_x��5��O .(�.�Vf>W�4��N*!s��'_�B��UL`!�iT�D&�&)�����x��0/bnj!�b�C�$�\җl�a.7X��ϓd�~����a4�rȲ#Lf��'�7֕��#'��1(R�1��;jF���dl(��2���7�,�����/�+�c��������$ȳ�P�w�ُ�k*�Lc��c
 O�nM��'�X�3�ݟ]N7N����}P����(Ա1jZ��C_�͐\fe�bJ����)F?P�-Y8/��r;�k��A���$Ϧ9�:	(O4�Ԭ�Dqg��~O=ߪ�A�1�Ś`n��	�����N�4I�x���~¢�PU:��:(�Ɯi��F}�JX��a�E-Gw�A�0ڡe���z�$"����|'��p��t���8l�K'9#YxRNedU���{����@R�HN�;1����q����`jC���GeRYx#ֱ�P�xu/C-��곣�|�T�b)I���j�t1��؄�o�}�J3�;�+C;��Ĵ��O3���2��WF��|H8���!�+�@a�����#2HI*V����#��f����նM;���h�4>�Co���y�1�/��;�Z�MM]�h��e#�/�,PӻZ�}��6�6��Z��D�����{��`A@J�p�׿��l-1�	pA�p��r���{��y~�����5�c�w�ԫ�Y��$�y8�����\I3V�\ʀ����\�b~��YJ?!���NK�su^.7o֭Ypv�(��NЗi�Q�v�s��
�v'�BWoʥ�����3�?��x��лA:LA_����y##�	�r~7uG��~4�}y!q�"s��%v�A�)l-�0=,���P�<2�$	����@�p�R��|������!�}�[��c���j��)���0$xɃ���Z�|�!F��^��熺�O#��50��kt�4?�0:VL���_:?�i7�\K�������
�dt��(;��B'�a���A������+�����Y������U�Q��^m�]������Wa�Ӹ�mS�p�%IMc�
��N��᳠˷i��ά�̯y�¨`(i ��i/�e�̀�iK �܊� 	4{�=��b$)�fW}���u@"mW�W&[zO�`�����`u|NǞ̈���,\�v�J����}9�3f�CQ���Z���x5�>ɷ#��4���@�����
�-�����Ɔ��g�+��H��kk�Z3?�Y	�]�<Pq������VCZ��TB���)�}��"X9=F�A<h��wo������$�(���vȐ�E�m��;�n���5���!� ��!�6&-Ba�Z�&�{~�|���l���(x m��yG�� {   ���q�_�Cy�[Ug��Ʈ��5cm'j���搟mp3Z��1��|Ih�ĈXr�j}�W�aWQB�����v�V���Z++����4�����o�)�{�\��G{ʆ{�}�j��\�5�      �      x�M�[��(�C��L�y�\z��h�%NuDE�Uo;�1�$�.��W��WʿR5��������_���o���)4���W+�������'�w�ʿZ��_�������=�~�b_F���5Jl�_����_��h�Z�o���ʯ���Ƨ��v_��{��_��xu���t�po���6�T���k�`�����u�\�M�S����~����WO�r�4|�׉qK	��~�5�iã��~�Zl�<�f�&�;�ut�8���קvh�h��6D����|�?�5�!;����m�_�G������mW����{���
�Ϣ�_ǥ{����{�ۀ�����@�!.��Wy8�i��[=�Ժp��8u[_W��x_���t�/���.��i�����S�vw�i�Vq��i����$gj�c#P��ڧ�_�@��{��`�'��U�xo���©���dW}�^��i�]����z��'�����`�8�O�wo�wN?��Ow����T�Q��6ٿ]���m��ѓֱ�iqq��ឹg�u�>�m�t�����A��ׇt�t�{t/���;%H/���!��k���=���x����g�Y��t��W`�hsv�t�=���5�x�K�|��`	쌁_�����4R���}��-���3�E������C҉.>����;~��}�҅���)�(��U��/�������nt�}�ch�~����;X�r�];~�L&�Mj�����qG�g`��v�{u�o��-�����[�!.F��{��顳0�_����Ѐx=gpW�0�wa����I�0��B��9�Q��,̛3����I�����z�c�?'i�P�nW�����x��f�A�-�_Xÿ�0�j<��!_X��m\���:�m��k��{��~���}�m�uu$��{h��/w��{CC�1��S2��-��=�;���>���ᮎ4�QO��_��s����x�Z?Ʒ;iaR3i�9�_�nd�yA��\h��N;b1_h�n잙��dگ�gt{�Y@����y@xpi���p�]+��HM���.�N�f1��}��7=��sC�R���5XĪ�qofZv�D��vo����Ax_��o�3����O���{��/�����E�,l�jaԽ����e�z�Z5wh�9�H��5s�Юi��I��m��L���T3���L�~%X<*�sw�$�kAůZ�����75�p�ʹ�m�� \��7D'?��-����~�������7�f--�>Q�yغ��8��)�a�q1�1�	��{�}�yp3����{h5=�{��G���������� �F�mw��,���1C4�䝿�`���!�<��l����]�[	��6��"e]Ԃ�'Ƶ���n�6�x���Mϱ��}N�K�s;���y��Ú�]\��T��β8�7O+����[��߾%<�5��vO��A�5�}r�C�[�C�s��s��B����7tϹ�m*�Axr�<�u�ý���M �n.��v �
7����pÅ�w
5�������Յ.�����j=�_�.�f+�е�t�Bݳ�
=t�����Å��T�Amk�a�=N�*���?�>��5?��Ъ��
A( �C� ��4��Ubx2�n� �yB(���x�+��G'� 4޾Ybx��?���A�B�k��g����z��"B����N�[yC�/�xb���C\<=AZ�ss�����0O�P_��p�fs����sǁ#4�H����wSl��M�58bz&��%z�%�����5h�b��ퟩ�axB��m�(fM�i�|��QLϽo�6�b�	�_Ws�~`��	ݽ<D��S|z��s��3p-C���F��rˣa�(.&~� �����5xB3__��������Ԡ���G�M�۸�4hbBC��Є^F.��s~��_�Kh2
�s��p��V�&�O,�Жp��x{w������>��)��
���h0��4N����	a�B�w�S,�W�L�0h0��e�[׿�Sܡ��Dq�cK�Q~m��g���'�Ik�(�"$:;D���1Lq��9h�*���k0����Dq�����D���������	f@mP��ǀW(�����,��x���xn�Ņ�d!��tpŞ	�6�B�\q������VSA��3�3���E��-��y�`�<#n���)��U�$a��G~��g~���`�;
��Ɔ-����P�a*��`��%��`B�)�����������.��r����������[[w�9��}/ lqzV���$p�գ�.��<:tq��Nƹ��[�-���[Wº��^���x8��a�����e������-tqN�C�8������W��.t��������z��.��q7]t�K��<���4@w3����=x*�p�0nYr�2�������<�O���ˢ^���[��ތ:O��7���{���֪�am�\܃��{��#����+�y�_�`BE��`��^�m{;�߾��go%p`o8�=��[�l�4�����#ؓ���^)��w_ո��L�w󅟗鬛/���ZvӅ ��n������;��Ig�=����A�}�H��w�����&���y��>�ne��G	���5P������n[�S��� #�1��<�U��
^���;O����0ޛ0��K�����4�fC��tឪ�q7[�Ǜ.����aB��t��]�fulu�{��|[�昆�|��۽j����k_x7<	��59�y%t�[+P3�qNc���»��v��N#�{�.�����M~q�ȣ�,��'E�d!<h,��������o����NT7]/~o��Swk��C�������u	�ߜ�<���)��ƃޔ�g���ZG;n;pL.~���������8��SƇs;���`6�׃����	χ��pE���\q��i�ԣ0Ew�v�St��zSh���;�A�w���L�a���8����3xzks���(D���� D��E��\�u�)�ߋ}a�\���Q���Ԁ)��3]���y?tkr��4L�1с�St���k0������B�<D�<6_!�Ό�4D��A��3��GX����S�P� s�S(^��z@I%�mU�PC���l�-Tq�����a��3X� �8H\V��`�d@�qY=[�b�,ed1<�Sׂ-.��e�3����4A���[�IӀ.����mt1v��]����..f�`@J)Ȏw	f�7 a~� Ř�}c����1����ӛ���C���ܼ�0���Ջcȇ{�K��Q�vnz�ոw�KC�v��ޭ�=�P ���/�ۂ�|ѡaLo�u@C�xC��a(�@ׁ0&�}�{�;����1��I�i���P�t1w�t�I�[��'�*��X�̅�m9�*_a�q�[p��-n�aY���7 /�<��f)1`��L؂x�����\����[p���-V�6ӄ-����f'l�����	[,O�Ώ��	���pɄ.��R[,/�tu��/:1a�0�y���#X�{7����q'l�N�tB�w1�����ʞ���m��5��]�5�]�;������	a(-��C
)x�6!���~��ƽ��5ይU� t�=G�ɡ��;�,|��\_�����	_\���N�b������6���Q���~[���;��	]�U��B�i�}4���ޣ�.Η�.9%�Ա{�"�|3�A�	YD}��i;���'d!l򘐅����&dq_N?�{0�����!�	W��x�+���:j��m�L��x�"W���D*���^X���8'Q�	W\���w�9z���i���4Wh"I��+4���֛n��
�Q�*'��\�yf��{�+�:��B�N���!i�`�s�`xz.���\�sӃ�u~���y��x�2Z�]�`�ۉ�݂O~���^�\�im5�Os�p���B�\��BpO����T�90�    �T!|{�>���f
��`i�ЌJ�g7s�<3x��\s ��������`�:���5�<�`v�ׇ{�#�k�e���QL�h߈�5~0��i�/ƿ�����`������U�oiF{OWʃZA�R5�]�w~��Kl����m�Up�CWY�,�V��~1/�k��p�����j^h�HOh����zV4�B���|)s��\�p�����=�Y�/T�W������Jpׂi5|���Wk�dެփ�y��`V@���H��j+���x�H��}"y�������]Z����G}���@�:�>��nW�3ڷ�
&�j���������&a�H�	Bx��i�^�~^Z�)�r��k5;��� <�ÿLZ�q��A����`��x��\�܃K0�>k��H�ǚ-�߃���p<xH2Ż���� ڣ�A;qA�Q8�d��W��j����� ����H:C��?��(!�挭u�|��B|;�T�@���\9��t���fj����U�ߐCwN�z�пL0�Й��lv�;��x+�v�
�&�;t����;���߮������ޖXD��~~��dķ�EЂ�{��+�M�;����`M��%7���6ަڰC[�v���*:�e>��=��)������o|�m�A�p�������ې��R?�;��<������~5����0CIwP��|�3�Ch�A���#���=6A0C�"��=]�p���o�p�~Z��X����N ����hb�$lhb�چ&�̀��	�Kp~hb8WE��'�c�No�9?D1���ߏ����!���A��N2�6<1�u�ݛ_Xo���SLV�{�6T1kbE����Y�QɆ-���l�[L��������'P~Y��/6dq��i@�#�� �陏�ރ=�]�{+�����u�-�R�a�����xw�Fߐ�|ٔ��M׆,���d�1[�{pwz؆-4�:Yd��y�qa���0`�E���g���,�{�byլہ-���X��Ճ.�����B�@�)�-|��E�w���0t6�be/q��1�0찶`CD,||�{a,DG��!���0c,G�w�|��/��6�!=�0�v�޹��ǽ!%XxF�a�aaeL0�����l(х(c�E�2�ߒ{�eH<����K��w����0��@�al���x���y��!��w���ީ���	�<�b�6�;Ձ/OЭ��xI�[�.Ԟ~�tq�e$hߎgݒ���tq��xU�5��V���8#�|`��е�V� !a��C'�q������[�r;��Y���B�	��8ddI��;�4�8�ý,��x<(�����-py�x��Dz�u���\v��L:�r�
Ljѳ/��7��4*��S�T!�|L�[z�;��5zz&C���~��x7�>�>���s��n��~��'�=��}|10��Q��#z�z��{GK������3p�VB�1����I�1Q(�ڜgqL����'�M��7�!X7�oPX{��{�A��,O.zL��Ala�V�3W��o�TU��\�v<�TF�8�� ��,��j�������{[�a�·�h�Y8w;�o}�@��g��g.�q�ͮ���ÞK��$\��[��k/�s��@B��!�8�"����Pt��'pznqL�L�~3E{�wN������a�f(:xǆ��|X�sV �sp�y�'�W�v_0q�k�;2B�5����ŀ���p=q�����	��i]�q�^Î��Jv�����k���)M
�/m_l7�T�@�3_3�{�X�I8hʰA��0c��+�{c�簛J4�'�8=�|��a����m�\��!��-x��\�^�x����౭.����Ȕ1��$k{�.��pҩ�n�Vb���\C��y�2���6ҿЫR�c��V��5��T���*�ц��0���0ӯ ���0I�n�~B%AL�.T��<�p�\�K���9n�(-�9C��(~�y��g������Q��g���7���-���T�Z�W^����?���MBcX�'vtx��UNL��K��9�%�zc��>8f����`GY�s��/���i�b���hF'�|0�x[;׀��1���ȋ�g��e���0bp�H���1�#��=�r�_�81̴/�3��.�o-j���ŰV����j:|��וx
�8���q�҇��
jHkq疕�5J�k���rS�
D6�È_��$N-��!R
�\!�ٳ�w8:�;�~�#!�ͷ�+h��9�^OA�=�5p�:�SO��F��OI�a#�5m�xk\�<�l�H�uz0
�I�@��6ZΥ�}18eA��r�KAn���s�'ME.CD���m��P�O��>�:��<��>�\�70n:��F��
�p"�En��x��O.�G�)XKx�/�µ�XӼ��Zl���UdY���"����M��-�e�'�ni�+h�eȫ�H\��*�I�Nzb�ip(i;K#B���?�����ݠ����6=Gu� (��%ɀv��D��)�s�+�''��
|���͙�!������L=������'�H��0n�ǃ��e���B��)���{Kּ�n\{�Q�#���&|��*�W�ܠ�%dA?>�_����=��>:΅���x�7](:r�/��no�� $�>PNeAJ.<��#&��!���tAM���'��LƂ��;�+�C��?tt�{a��p�:dt�߫���HʽK�\M�V�#*�y�����/vN�.˵ѭ����;���D����5��y�f"�6��hE�OFY��/���<
sm�3��W:��H��^!0$RP�ːsm�{Ƃ�\�pNAd���"3׆|��6��#4���;��@k.Ð��5�>%�
js8��˰�rXЛk��T��\к���\��;���"p�~Ő�"�s��p��k� 9w� ��B-�m�1x��s����pAwN~�J�A2�wĊ��o��g��f�Ӟ�"�sg)�X�%��[A����e[{���5<e\�i#�,��/�n������+���T+ѕQ-�*(�e � E�a2֠Ew�]��6�k�C���G��ͯ� �I���b��Bx��_��+��7��%#\N�~V�nOS�r�Dg4	�.��qM��ˠ���2)�#$�4�|���2L�{��ȶWA�.��5��a��L�|�o��	�'�����0��Q��Ā��6@A�.����'8���˴��;x)"uS���4Z��'�(�՝���2�����Z]83m���V!٩�W�a����V�I)(�W
>�NLA2dъf]�A�D��rɛ�{�k�=b����&@�.����9S5� ]_l� ��k~�P[�j;�j��ʞa�z]X}X�
����0P���~]����%@ZP�/L\��z�N�`�L!��˰�'(h�W�![�����7�v�*ӌ�e���Bv\)� dwr��!�0{�%�"��ׇ��!eW:4��i!bvf���s�����u�R�qbi
�����D�6xև�]8kQd��Br�#d��y���e�$a��*+b��˯��B�"��B�[�^�Ou+�$D�D���Ħ���k��8�'���q$�� o_�!`X�`�jA�.C����s(H�e�VCA�.���
��W+� rW�Uc���}!�P����C�0��i<J��؃s�FM��C%�ݕ�ŶxA��-d��+?i1t�sHޗa霐�t�Y�>�w�{Y�%Ê�9$����y�	(ߕ#���^�#}_� �p�����_"���k��,{%�V0QJ�y��W�����+���+��/"-^����S��eH�����wd�2�{�vU��������)�R�]Q�7;�j�+1��U��ȀhzQ�!jK*0�^e"�Q�@�N�!%9^@O��4�4��W"q�^�B�i�8А�SP    T�2��=��+�.�W��+�����x���M����ϰRϮn�7��Nu;��:��������ύֿ��`�D �l��P�۠�͂B^����D�|���Đl������p���e����k�3p��w� a��2�iZP�;��]u��FNzb��)��m�aA.��C���뿰z�E�Cc4�y!G2��DF:4��y�0ѩ�~ �y�/�,XP����[ռ3Yg����(=�y�8N/������r^Y�����2�7Y���0ӏ`#�@j�G=�T��)lD%G=B���y
z'O24"��!c'z2 �w~%*zF���h�P���q���h6�����r2�p=e��-�V���2P�5��8���Pӵƈ��Ⴂ�LO�����Pwαc讽��^��-�d~ϰc����vAW/<����^x��L�tF�����ן猁�킸^��]�^�nnoS�pu=A���y`��8�5��x�LE2d����R3#��}gAcok;T�J\e�F�	*��.������!�q�g�F*J{�^���i6
Z�MfG�2���W>,9����j?�1d���)>��^9�-'=%�w+O]zS��ପP�+�6SKt������^g���ʼ����������w&.> ��!����o�,�B��H���������{�E�0^�7kG/C
}"�W�/�	�NHpt��FtA�/Cv���o/�����bq¸y2�#�f��I�-�R~!�҈�DE�/(���� )�h�xl
F��}�꫈�7�w��P�;Qف;���T�+��e�jA���|�O��n_p+�B+��+6<t�<j-���&��*
���,@���h�.�a���*_X�yj�vb�(IA����C�����N�k0���2��i��D��l�(�S��iDn}�</��8_�����v�^A?�K�lA�Ob7O�����7u%}U�������T4�2t�8��N!eD�2 H.���?>�w�G�9�9��+�FA�/C�f�c��V���0ؚB�/���90Pw�O ��� ׷�Yz}�{y�`������k���P����(;Zp�q(����T��^�@;�l_��.MT��WB����3���T3���>�Q�
A�o�w���,l���v�}eܧ�A>�]N�@�/<IB��|f�����a4���~UAĿ��>T�2P�����D:���>c����J����g�ӕZ�h�75.��^�g�B�/9��.v�+���*HZP�K/P	�#�a�\bŐ�A�$���p��^�I�5�Q�;G�n@�/Cc]�03�~���C�/���.�;8{#(�����s�gZ+����_҆�;���׆-���zG�{E���b;�͕�$��RC$����W����ә��[0�)a aV��e�d~ �!#:����`��#���b�+uGA�o��0��T�*h�eȔ����Q����r)9j�����mG.��V<�@B��Eι���8:_������륏����C�/�H>r��_2�c ���������������M��������7A?hh����n2��<��~m��͢[��C�!R.T�T�po�����>���/�J �U�(T0f��Z {������&Q ����r 2d>KA �*H
�r�tia�4�71�3����'ʰ�X.��&:�[xR@��$( EM�7T��&�}R`$�a�Cm���/(`Kh�Ud�{�@�`#JUj�L� ��Y����E�7x�S񅡣��K�N� n�=z���I���3%D�6����1�hH�b���>%��|���5ϐ� ]��5�J@���d
ӆ�*'���0�/���G���N�O}v�{�D*H_D�B� ��U�ݷ�(��ϙ�
�]v)���&~��  ����;���gK�"2t��RE����_��d��=�d����������sM3�a=�	X�ċC9*>����O�?��[���^c6���6��H�BU�C�������
XE��$u������n�鞨g޿ऊP[��+���ɪ��Vb1a���1��0bH�5$�_����}��*2̴���[y��c1]ϔ$A�5(T����b�+���)��#F�"+�����Po���Q�B��C"����Qg���x1�3���Y�	�怤e��9 <����9Ru@�3�w�: �&�Kx���|}�{�����P9����z���Aꁡ?C��ld�[�Cw�#��vT�~ưc�y��G2X5���|��ʈB�؂?�R�3E��q�?�OQ��{<��c���s���u����%8���T�#��.��9%��M�Scp%{Zn�&�$z�gϕ���Me��	��5|��R�P��N]�WKa\B�P�@��
���u�Q�&��}oB�2T&�'8$3p~�d�P�@�rv�ϢB���
%
dȮ5
P�<5t�*��M�(S ѡ���Ht8N�L�q��3~������s� S�9�!�^�R��n��vR�nHh��(�*8|x�'����
$tdZA��P)R.�A�'���R��4��=�c)�+��
���g�h�$�������f����0�AՂ3�K��l�l�Q���G�_�B����,��Z�h�l�t��o��f�.8|nҷiBP9�^l�S���Ñ�R��P�q-J	@S�@�y������+���J��Nʧ|���NȠ|�0���/8|]�w� �p��}����P�ϜO�A��a���E�'��� )�3w�����c�1(,'����\�BR���S����3J)�Qy���r~���Y�x���p�ȇm���q)�q9sۿX������ިhp(I�ۄ{�z"5�!��T5�!9�5�6�|�~KI�Ȑ/ұ�;|{���OO�Da�Vs��-�l����B��ֆ~֫]�op��݂~vyQJH�˼��l"P����k���B�kv-�.T9�!��98$t��v�P�J�`�ԁpc�A��C���S�(�U(v C��;8��9G�D׭S�@5��|4����-8����ƹ/���c��A({ �fl>`��z�qbd�S�@E��&�s������V"�l��?0��yy����U8��1$����z'�u�v�
���:�w�� �s��0�Y��[(� ��H�"�r:.H��gp���B�V��T��&��Q S��)�Nd�5S�C0�(�i�Q�0�2;������O1c�3�i�.���[5�e81$K�el讈Q\�>V\���h�p<�a�p�S^��6��
�IO�w`�]�����VoO�<���,̠�	ƻ>��E�	�Z����1ܞ��;g�I���r��E採1�t��'���`�:�%g�`r�~}s��_q��y_ֈa�q�"�q��ީYP\1��^���y���K&�0=�s���;Y���`�|�o�m�tN�l�|K_���Y2�JG�٥�y���X�d4��/���=�C.�`�k�P��;[��t�c7=�ѵ�ݬN��C�gi�s��7����)w�E��(�@�uu!��'�Y��o�����Z ���e\ �D��7Æ���1�|��[1P����5�T�u��GT�Q����������/
^��FՅl������wZ�3>�Y�������z%uk�~*
�O���J
6����O��.��'?��T]O���R
���C�#�n�}�n������N �a?��#��)�0�X��|���,)�G{*"VWS��w���Ĺ�8�����!��l@�]]M�x��� �ou1��74�[����Z*�j|�J��,�^E���B͙���PJ=����3�4�R��
���zI�d�`�^S��~�e#tQh�R�%��޳R�<�G����:���~�~j�:1��O #�7��l�t ��Hq�����L����z   3����AZ?�h�������b~a/G�A��Q��\�κ�3d4ZҼ���~CF|�s���O�h*�'�F+���
�c�6�r���]Ȉ�M�Q�����=l4�	a��ȸ�U?�h��/���*�\4N�������$N�K���0�|�k�L4_Ŧ�AE,�9��@zK� ��"��d4ߧ��͖-���F�BԇC?�h�����F���G-���p	vp���Zp>6Z`�9�@�MG��d4gJ�_n.J�]������'X�u���_�Ѡ@F�2H-��?���EZw�����/C�h=�-P���P�A�L��H;	)4���ȼ�mJz �(D��F���֨&r��Dk��V�PTD����u�������$�\4�2��!�0����Z��o���������W{��������>�tG��p���a���Sx>�?�
7ןk���盤���9݃���Z�Z�s�{,(�����������71j�?��j�?��ϿI���¿��[�m���d��������o�>      �      x�m�]�
���s黢�?s���A@ر��[I�*Vyk��z��������[�,�x3~jɦ���V�ѓ-e��WY{
����>�Ue���̖�'���CɆ��J����axW�����f���\U[:�7*)�A�8��O^���.� �&w�	��|(M&uU�p�d����Ϳ����C�c��)��7�3�9�O~��d�R��|��K�x$��tc>�sɱ�֒����1u�d^_7��OzZO�K6�'����Gg�0�����G-��y=�a�P��L�+3��8�zjAR�9�����G-VèY,�-����aj��|�����[+��,����e��W�x���e�^��o����Жe���oY��3��BI�x�L6�	H4-�F����dq���y��C��R���l:S�h,��$�&�=5���sjr���3�-��S*+\������L�����00��J8V2�E��(��R��9�_�9Ȣ[GT����*�s��%h3u���I���UT�u#EZg�R�����4E�.�P>�s�H����RV���dq'3�ڢ��&�4�&�nV��FQ�6S���^�'A�R����2�6S��$S�I��d�L�� �.:��]����f5�[|s�lsWt��9�Y����[��<���x����l��7GM��IhG"�n�8ݬ>i��V�)�:OD���IN%Rn-��tRD'�l�?-/:Ģ�?k��ԟ2C��D�j2��$^�|��_�f2��L�&ś�9�O*�7�9�WQ��Z�H�[,WD�Z�YM�Tϟ-��<��|#F�Yq�����Z��fGfi�E<��4�ep2�N�Y��j΂�EDD|�-�h"��yg+��tl"���MD��7���,��}�*K�d�0zei��VE��h����HY�U2��#YW�=K�e�4�7���dS�ܖlǨI�Jڢ�׶����"aL��Yd�)k�/���0�����tl��n6��ӱ��m�L�m���gq�L�����ն��s:6����ǫ9��V��>� ����5��gYeL�A/��_�O<�U���tl"��<�U���9!��d:	�H�!���鱒i�BǍ�pE�G2K!���`zx�k"�=�Ӣ֚W+D�H&����kgǁL��N���2�H�#*>�1����`k��^q�d�r3F[J�\�����7�?l����B�L���9L�֏p ���"c�Ծ��y3�iL� N��I(���96���ݸ2˕�kCC�>q{)7��D�4W���ɖ,㬩�1גE �0,Y�șl���3h�8��ٲw �*˖�7�O��tl�cp���||���<]�g�.{;^o6])�����ձ����Y��y��ի�*.P��(J�L�Q�i�D�'���%o�f3�k�V����T���c�R&�Q�ti���R�f��o�㬐�Ҋ_���D�E��F3���&��8�=0.Po�%���T�f9Ţ�3N�u�|3���LY�8@s�Eřn6}�mLG&*^2f�S,�:^.�f㭊�2�b޳�ה�@^a�2��a+^,�&_�X���L�!���hx����\C���>���z1�m0~�<-^,����%:�T
6�`���ӡ����x��j7���lŋ�DcO41�͛q9�D�g~���3X��/q��x�>T�Y�1�`5{�1ajX���x����V�P,g�/f(T��HCĹ�|[o8��v�n��j���'�����Y��-�)ԩw0�rO~�~��up�����	5O�7~B4�������-�t`�@�ތ��\��c�S�D��]g05�׮}���X��'��dK�-J�f���t`2�{�H�� ����ҵ�{2��V�r3�3O2Ѥ�]ށ��^�D�'���w�xч��E�c��3�ޕ��+��m��)���^�*�TuQpJ�h�uQp�U��Y)'�w���`�����_X�x�������;Z]4��74�z�������V?�P�D�a�Z��>R�{#�F�o���E[�e3]���^և�0$ޱh��W�ud5��w��^s2�>Q�7�>��75�z�`�O~TkW����bBԼ�֩d|�i֩��)��x#�oդ�qn����Zěk�`�l�
�n]��D��>��sÛp]"6�f��p-�������{u�����r�A�
61,�,�� �Upɡ-�ǭ��f�S����@����|�ajx��3$U0�����R�z�X�J�<o�'�*��uy1�J�(������弌����o6ѣ���H�.6^����xW�"�� y{���Ӽ>�@_��#�L�&�����A�M��&d�r���Qo�K�	��`��hY+挣U�90���ӿ�{~����;-;��/�ޅ�(6S�wO�n��q��$�t9�ބ���Ȳ���"�g�v�xs�zڡ�͉�)�a8���Q�^o�Q�N�t��3��l<�F�{�5��c�����9G>�x���ȴ p�3�<W���ؿ����-�4Y3y��'Y�mf&��6�D��g��ONi*�Z?��$����d�tk�ԏ�.�{�o63�����|�Q����G�-�F�*>f�b�yCe�,�x�t�7J��6��'�|3ɩ�D����sʶ��y��"�𪎵�)[2�����t�<�9]�!�~��;Z.ѓe�=��!�}�y0~cYs��c��sj���Q�*�/�vY2�8j{����N6?���X/���'W+��g�ﴜ���v3��i9���l� �Yf�і�r����I�Ff�ʀ6@3�`؃�.���KF�����p�q,�Ogz�������f�I�Z���7Θ���3���RoF���	9��� �l��V����r����꽧�Ͷ����,��"�܌ �6]����1z�Y�N�|���q�����LC$�֗�-��f�W���h$��U���	��sƩ����4�Hx7�޲�h�O�p�.�rv�Ȋ�E�sΆ윳ce�&�sZ��l5(�������YJ���(�^l�8���]��0E�g��9���(0�������*�y?%�F�Kq�`֣�D�g�Y�m.��)�k�f�U�����������A�RQ�D�"�|��y��~��|A�h��s�Z[Z�*9%��{3��Q圻�nvtY�|C=�枳�_���-�=c�GV0�m�s��sF|Bӑz�ٹ���?02�P�`8�`�������b�
��_dQܰ����s�Fz�A�'y�n��xS]�ϵUdgmKq7c�s5�n�����g�"���7;[p�;so��ņ:~A]7F�?�����a���W��7kJ����s���`�γ���o�9�uW��#s/��&z���\�ۇ���f%��Ws_j{oF9�|�1W���ؑpd��{��u��Mo>R\P��
O��7�0X���9�ފqsF�S]b��#��7�uLf]v�}��n6Ss}��ޕjp�h��ac鬢��N@g�Æ2�Z���~��vKU6}��l�F�O������ ���`���ń&+���Uc��7Y[��Ȫ3'L0�����c�ՑEg뇬>�F�+�`-�Y�Y9�S�F��U�jU��k����t��F�����`Y��g��a
hYZ�t.�u�����=�m�Rl}������ԥ������d���I�mm�n7�O��Ⱥ�ץC�
v�ـ����v�����'����̑��5~�juX�;�"Ȇ7�����j:��כ����%ҙ���*�>g��ry﷾� �g��l`Ԭ��}�{���2�q�1�f���~l1F8��5d��Z��T�.Ά�!R�@[s�d;7���t��j+�ґU߆"��A��s�o�-�q�7�o)�~�m���L[��1V��~M˦���,����� k�v�N����l��n�	�?[Y��d�0���<�F5E'���be7��q�����h��E��7��f+ ��#����>Y�T<(G��n���p��Y�Cd#g��&����h����0z1[�F��?X�E_0J�	ֲ�6-��_H�V��!��lٛ��w�ϻ��ܘ�M�ҽ�) �   ��:�Y��Q
E����j�����?g!˪�m��1����]է\r��W�(��\�}�}-�"X��l����sGs_9z��V��/�)ix{�9�X�Q�B0��{�YL��L�`#S�u黛����r����X�څ��]�|����2JQ�����e�ݓ�i,��F�e��ߟ?�i      �   �  x�}V�v�|��?`$H�ѫ����;r6���H�LP@�c�ק ��<3ɋmY��TwU7#��0-I	��M��ie�A˞��e�,2rmT/eC�G��X]Q���g�$��p'_����F�yC�R��(a$_�eb�	���#��ѭ�W�>��g��;K�_��	��EO��^�J:w�ۃ����Z����$�4��xQ��ɵ¨���)��,�Y9�K���k�%�b-+�hݰ�fm�Rx�&|-�`#^1Z�Ƀ�w���J�G�yR�4͓����uLӄ|�d5�bI4:��h��?��-���(�$�]t��6�<S�dk齠Ϣ,<�<�!v���2rgM���@�񋜼�WP��2�xɲ%㋔�[i$ں���D��4�%���<�wm��H�N��=M�e%�֪����?�b1p�jPP�!LWd#�����Z	��[qB�`1⚼H1�������:��ګ�18��;(Y#���%���r��m�<�@����#g�:Li�"�,�d����! ��h!@>������ ^{zgd���ن����}ey��LF����69\
L��7�h����3�CGj����?����^]=Zߊ�j��>�A�c�V��i�1HFJ��W�Sf"��)�J�qfY�`%��;۶��ߝ�@ͧyqɳ�V�+��`�t�~��1����T_0Fw�ALd ����w���A*!@������c[�Y��\=�z;��~'��0D�D�s�P�ޤ�ֺ֚�(��H���b����݌����0	hG��V��qI��yY��&v��nr�������slM��v�R�#�,`��qd|V�/F�*����O틒3�}4�]4T��Y�>Mg��t��Vviq��Е��g`EkZ�%�'}/�tC�/������D��X@shnE@�9�<�E�9LS�Qw=}�����3�h����H70�h�,�"g`�i��bs�w�u
�v��`\�f�!�3��`wtc__e��8��#<y &f�R��l��(��+ ڗs�ն �J7!�n�u�-/�� [9}��L�8IyI�-P�����D��Q�Fwh�(���زD*X\�Ci���͚tnzT0��?��
���N���t��aM��̛��ôl��0e�)��b�x�3r������뼚³h��gL�.�7��᠘��Z�$�/�%���_�瀛s�#m��Ux�:�u�FC��!z��0����#h�R�^_J�Qy	{��!�Jme��N��=(Ek�>2	��5r��yk�u��p��e@��5��Q4N���;�H�!�2H�@�n�R~B�Yo K,���Pl�J�y����&g��r��,���|����c����S�J^��k,D.���R��"'�R�=�7m=n%>��`*u���' �D�ɽ��W��AyG���CP��(�N�)lS�..^�w����'�������i+Jr/|�ai�}\�o�W�=�O��6 ��;��[�V����ԎˣXC/�*�}#t?���-΢��	y�C�SӪ�8��qJn44z<����@���~��h(��V�`3���+$+3���aޅ��9�X%c9	�k�*�tS�gv��J �	 ��F��U�\W���\Vt�D#E�	�:��i^��Q��ɩV�!��t�H�<��֊�t�N�Qy��<i�.�����GX$��K�лiD��-��Kؠq      �   �   x���N�@D��W�P�I�=ҪD�%W.npY�M6�u�׳\�i捃&�9�%�jt�o�
��r�gz����/��NLR�a,�[o7p��ѩ�2&1�e�E�9��9h櫘�t�l��,A2�->Có-�Ĥ&t�"Y��8j��8	��)�����*ܗ��E�	8Lq�=��WI�����_^�v�6�j�tqY'z˹?���M�     