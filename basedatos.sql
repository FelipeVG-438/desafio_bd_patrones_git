PGDMP      4                }            gestion_academica    17.2    17.2 N    N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            P           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            Q           1262    17996    gestion_academica    DATABASE     �   CREATE DATABASE gestion_academica WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 !   DROP DATABASE gestion_academica;
                     postgres    false            _           1247    17998    roles    TYPE     P   CREATE TYPE public.roles AS ENUM (
    'admin',
    'teacher',
    'student'
);
    DROP TYPE public.roles;
       public               postgres    false            z           1247    18101    weekdays    TYPE     �   CREATE TYPE public.weekdays AS ENUM (
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
    'Sabado',
    'Domingo'
);
    DROP TYPE public.weekdays;
       public               postgres    false            �            1259    18043    classes    TABLE     �   CREATE TABLE public.classes (
    id integer NOT NULL,
    teacher_id integer,
    course_id integer NOT NULL,
    max_places integer NOT NULL,
    status character varying(20) NOT NULL
);
    DROP TABLE public.classes;
       public         heap r       postgres    false            �            1259    18042    classes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.classes_id_seq;
       public               postgres    false    228            R           0    0    classes_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;
          public               postgres    false    227            �            1259    18036    courses    TABLE       CREATE TABLE public.courses (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    details character varying(200) NOT NULL,
    credits_value integer NOT NULL,
    prerequisites character varying(200),
    department_id integer NOT NULL
);
    DROP TABLE public.courses;
       public         heap r       postgres    false            �            1259    18035    courses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.courses_id_seq;
       public               postgres    false    226            S           0    0    courses_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;
          public               postgres    false    225            �            1259    18121    departments    TABLE     �   CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    active boolean NOT NULL
);
    DROP TABLE public.departments;
       public         heap r       postgres    false            �            1259    18120    departments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.departments_id_seq;
       public               postgres    false    234            T           0    0    departments_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;
          public               postgres    false    233            �            1259    18050    grades    TABLE     �   CREATE TABLE public.grades (
    id integer NOT NULL,
    student_id integer NOT NULL,
    class_id integer NOT NULL,
    partial integer NOT NULL
);
    DROP TABLE public.grades;
       public         heap r       postgres    false            �            1259    18049    grades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.grades_id_seq;
       public               postgres    false    230            U           0    0    grades_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;
          public               postgres    false    229            �            1259    18015    people    TABLE     c  CREATE TABLE public.people (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birthday date NOT NULL,
    gender character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    address character varying(30) NOT NULL,
    phone_number character varying(15) NOT NULL
);
    DROP TABLE public.people;
       public         heap r       postgres    false            �            1259    18014    people_id_seq    SEQUENCE     �   CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.people_id_seq;
       public               postgres    false    220            V           0    0    people_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;
          public               postgres    false    219            �            1259    18057 	   schedules    TABLE     �   CREATE TABLE public.schedules (
    id integer NOT NULL,
    class_id integer NOT NULL,
    start_time time without time zone NOT NULL,
    finish_time time without time zone NOT NULL,
    day public.weekdays NOT NULL
);
    DROP TABLE public.schedules;
       public         heap r       postgres    false    890            �            1259    18056    schedules_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.schedules_id_seq;
       public               postgres    false    232            W           0    0    schedules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;
          public               postgres    false    231            �            1259    18022    students    TABLE       CREATE TABLE public.students (
    id integer NOT NULL,
    identification character varying(8) NOT NULL,
    person_id integer NOT NULL,
    credits integer NOT NULL,
    actual_course character varying(30) NOT NULL,
    status character varying(15) NOT NULL
);
    DROP TABLE public.students;
       public         heap r       postgres    false            �            1259    18021    students_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.students_id_seq;
       public               postgres    false    222            X           0    0    students_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;
          public               postgres    false    221            �            1259    18029    teachers    TABLE     �   CREATE TABLE public.teachers (
    id integer NOT NULL,
    person_id integer NOT NULL,
    specialities character varying(200) NOT NULL
);
    DROP TABLE public.teachers;
       public         heap r       postgres    false            �            1259    18028    teachers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.teachers_id_seq;
       public               postgres    false    224            Y           0    0    teachers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;
          public               postgres    false    223            �            1259    18006    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    "user" character varying NOT NULL,
    password character varying NOT NULL,
    role public.roles NOT NULL,
    person_id integer
);
    DROP TABLE public.users;
       public         heap r       postgres    false    863            �            1259    18005    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    218            Z           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    217            �           2604    18046 
   classes id    DEFAULT     h   ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);
 9   ALTER TABLE public.classes ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            �           2604    18039 
   courses id    DEFAULT     h   ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);
 9   ALTER TABLE public.courses ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    18124    departments id    DEFAULT     p   ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);
 =   ALTER TABLE public.departments ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    234    233    234            �           2604    18053 	   grades id    DEFAULT     f   ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);
 8   ALTER TABLE public.grades ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    18018 	   people id    DEFAULT     f   ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);
 8   ALTER TABLE public.people ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    18060    schedules id    DEFAULT     l   ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);
 ;   ALTER TABLE public.schedules ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    231    232            �           2604    18025    students id    DEFAULT     j   ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);
 :   ALTER TABLE public.students ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    18032    teachers id    DEFAULT     j   ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);
 :   ALTER TABLE public.teachers ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            �           2604    18009    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            E          0    18043    classes 
   TABLE DATA           P   COPY public.classes (id, teacher_id, course_id, max_places, status) FROM stdin;
    public               postgres    false    228   Y       C          0    18036    courses 
   TABLE DATA           a   COPY public.courses (id, name, details, credits_value, prerequisites, department_id) FROM stdin;
    public               postgres    false    226   +Y       K          0    18121    departments 
   TABLE DATA           7   COPY public.departments (id, name, active) FROM stdin;
    public               postgres    false    234   �Y       G          0    18050    grades 
   TABLE DATA           C   COPY public.grades (id, student_id, class_id, partial) FROM stdin;
    public               postgres    false    230   �Y       =          0    18015    people 
   TABLE DATA           k   COPY public.people (id, first_name, last_name, birthday, gender, email, address, phone_number) FROM stdin;
    public               postgres    false    220   �Y       I          0    18057 	   schedules 
   TABLE DATA           O   COPY public.schedules (id, class_id, start_time, finish_time, day) FROM stdin;
    public               postgres    false    232   �Z       ?          0    18022    students 
   TABLE DATA           a   COPY public.students (id, identification, person_id, credits, actual_course, status) FROM stdin;
    public               postgres    false    222   �Z       A          0    18029    teachers 
   TABLE DATA           ?   COPY public.teachers (id, person_id, specialities) FROM stdin;
    public               postgres    false    224   �Z       ;          0    18006    users 
   TABLE DATA           F   COPY public.users (id, "user", password, role, person_id) FROM stdin;
    public               postgres    false    218   [       [           0    0    classes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.classes_id_seq', 1, false);
          public               postgres    false    227            \           0    0    courses_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.courses_id_seq', 1, true);
          public               postgres    false    225            ]           0    0    departments_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.departments_id_seq', 1, true);
          public               postgres    false    233            ^           0    0    grades_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.grades_id_seq', 1, false);
          public               postgres    false    229            _           0    0    people_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.people_id_seq', 3, true);
          public               postgres    false    219            `           0    0    schedules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.schedules_id_seq', 1, false);
          public               postgres    false    231            a           0    0    students_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.students_id_seq', 1, false);
          public               postgres    false    221            b           0    0    teachers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.teachers_id_seq', 1, false);
          public               postgres    false    223            c           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public               postgres    false    217            �           2606    18048    classes classes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.classes DROP CONSTRAINT classes_pkey;
       public                 postgres    false    228            �           2606    18041    courses courses_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public                 postgres    false    226            �           2606    18126    departments departments_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public                 postgres    false    234            �           2606    18055    grades grades_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.grades DROP CONSTRAINT grades_pkey;
       public                 postgres    false    230            �           2606    18020    people people_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.people DROP CONSTRAINT people_pkey;
       public                 postgres    false    220            �           2606    18064    schedules schedules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedules_pkey;
       public                 postgres    false    232            �           2606    18027    students students_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public                 postgres    false    222            �           2606    18034    teachers teachers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.teachers DROP CONSTRAINT teachers_pkey;
       public                 postgres    false    224            �           2606    18013    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            �           2606    18075    classes class_course_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.classes
    ADD CONSTRAINT class_course_fk FOREIGN KEY (course_id) REFERENCES public.courses(id) NOT VALID;
 A   ALTER TABLE ONLY public.classes DROP CONSTRAINT class_course_fk;
       public               postgres    false    4759    228    226            �           2606    18080    classes class_teacher_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.classes
    ADD CONSTRAINT class_teacher_fk FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) NOT VALID;
 B   ALTER TABLE ONLY public.classes DROP CONSTRAINT class_teacher_fk;
       public               postgres    false    4757    228    224            �           2606    18127    courses course_department_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT course_department_id FOREIGN KEY (department_id) REFERENCES public.departments(id) NOT VALID;
 F   ALTER TABLE ONLY public.courses DROP CONSTRAINT course_department_id;
       public               postgres    false    234    226    4767            �           2606    18090    grades grade_class_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grade_class_fk FOREIGN KEY (class_id) REFERENCES public.classes(id) NOT VALID;
 ?   ALTER TABLE ONLY public.grades DROP CONSTRAINT grade_class_fk;
       public               postgres    false    228    4761    230            �           2606    18085    grades grade_student_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grade_student_fk FOREIGN KEY (student_id) REFERENCES public.students(id) NOT VALID;
 A   ALTER TABLE ONLY public.grades DROP CONSTRAINT grade_student_fk;
       public               postgres    false    230    222    4755            �           2606    18095    schedules schedule_class_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedule_class_id FOREIGN KEY (class_id) REFERENCES public.classes(id) NOT VALID;
 E   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedule_class_id;
       public               postgres    false    228    232    4761            �           2606    18065    students student_person_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.students
    ADD CONSTRAINT student_person_fk FOREIGN KEY (person_id) REFERENCES public.people(id) NOT VALID;
 D   ALTER TABLE ONLY public.students DROP CONSTRAINT student_person_fk;
       public               postgres    false    222    220    4753            �           2606    18070    teachers teacher_person_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teacher_person_id FOREIGN KEY (person_id) REFERENCES public.people(id) NOT VALID;
 D   ALTER TABLE ONLY public.teachers DROP CONSTRAINT teacher_person_id;
       public               postgres    false    220    224    4753            �           2606    18115    users user_person_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_person_id FOREIGN KEY (person_id) REFERENCES public.people(id) NOT VALID;
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT user_person_id;
       public               postgres    false    220    218    4753            E      x������ � �      C   i   x�M���0�N� E � Q �%�P$���v5\c�~��13���фS����8�)�4��`�\9,Z����Q�h���J�u���^?Է��ԅ�	!<�&�      K      x�3�IM����O�L,�,����� I?�      G      x������ � �      =   �   x�M�;�@�z�W�#�HL�SA+A�d��{�F��t3|���#��ZJS*U*{��w1��|t~ޥ ��[l��LW5��l�E]	�Գ{$X����#ؖJgs�8B?Q/�zO��Jg�m�6�4����#�3��m��RV��@q�<����=a,V��QU�d�i�̩׹�0hH�      I      x������ � �      ?      x������ � �      A      x������ � �      ;      x������ � �     