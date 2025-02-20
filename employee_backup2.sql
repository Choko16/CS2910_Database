PGDMP  ;                    }         	   employees    17.2    17.2 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16494 	   employees    DATABASE     }   CREATE DATABASE employees WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';
    DROP DATABASE employees;
                     postgres    false            �            1259    16508 
   department    TABLE     �   CREATE TABLE public.department (
    dnumber integer NOT NULL,
    dname character varying(50) NOT NULL,
    mgr_ssn character(9),
    mgr_start_date date
);
    DROP TABLE public.department;
       public         heap r       postgres    false            �            1259    16556 	   dependent    TABLE     u  CREATE TABLE public.dependent (
    essn character(9) NOT NULL,
    dependent_name character varying(50) NOT NULL,
    sex character(1),
    bdate date,
    relationship character varying(20),
    CONSTRAINT chk_dependent_sex CHECK ((sex = ANY (ARRAY['M'::bpchar, 'F'::bpchar]))),
    CONSTRAINT dependent_sex_check CHECK ((sex = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);
    DROP TABLE public.dependent;
       public         heap r       postgres    false            �            1259    16520    dept_locations    TABLE     s   CREATE TABLE public.dept_locations (
    dnumber integer NOT NULL,
    dlocation character varying(50) NOT NULL
);
 "   DROP TABLE public.dept_locations;
       public         heap r       postgres    false            �            1259    16502    employee    TABLE     �  CREATE TABLE public.employee (
    fname character varying(20) NOT NULL,
    minit character(1),
    lname character varying(20) NOT NULL,
    ssn character(9) NOT NULL,
    bdate date,
    address character varying(100),
    sex character(1),
    salary numeric(10,2),
    super_ssn character(9),
    dno integer,
    CONSTRAINT chk_sex CHECK ((sex = ANY (ARRAY['M'::bpchar, 'F'::bpchar]))),
    CONSTRAINT employee_sex_check CHECK ((sex = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);
    DROP TABLE public.employee;
       public         heap r       postgres    false            �            1259    16530    project    TABLE     �   CREATE TABLE public.project (
    pnumber integer NOT NULL,
    pname character varying(50) NOT NULL,
    plocation character varying(50),
    dnum integer
);
    DROP TABLE public.project;
       public         heap r       postgres    false            �            1259    16540    works_on    TABLE     �   CREATE TABLE public.works_on (
    essn character(9) NOT NULL,
    pno integer NOT NULL,
    hours numeric(4,1),
    CONSTRAINT chk_hours CHECK ((hours >= (0)::numeric)),
    CONSTRAINT works_on_hours_check CHECK ((hours >= (0)::numeric))
);
    DROP TABLE public.works_on;
       public         heap r       postgres    false            �          0    16508 
   department 
   TABLE DATA           M   COPY public.department (dnumber, dname, mgr_ssn, mgr_start_date) FROM stdin;
    public               postgres    false    218   �,       �          0    16556 	   dependent 
   TABLE DATA           S   COPY public.dependent (essn, dependent_name, sex, bdate, relationship) FROM stdin;
    public               postgres    false    222   -       �          0    16520    dept_locations 
   TABLE DATA           <   COPY public.dept_locations (dnumber, dlocation) FROM stdin;
    public               postgres    false    219   �-       �          0    16502    employee 
   TABLE DATA           i   COPY public.employee (fname, minit, lname, ssn, bdate, address, sex, salary, super_ssn, dno) FROM stdin;
    public               postgres    false    217   �-       �          0    16530    project 
   TABLE DATA           B   COPY public.project (pnumber, pname, plocation, dnum) FROM stdin;
    public               postgres    false    220   �.       �          0    16540    works_on 
   TABLE DATA           4   COPY public.works_on (essn, pno, hours) FROM stdin;
    public               postgres    false    221   /       =           2606    16514    department department_dname_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_dname_key UNIQUE (dname);
 I   ALTER TABLE ONLY public.department DROP CONSTRAINT department_dname_key;
       public                 postgres    false    218            ?           2606    16512    department department_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dnumber);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public                 postgres    false    218            K           2606    16561    dependent dependent_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.dependent
    ADD CONSTRAINT dependent_pkey PRIMARY KEY (essn, dependent_name);
 B   ALTER TABLE ONLY public.dependent DROP CONSTRAINT dependent_pkey;
       public                 postgres    false    222    222            C           2606    16524 "   dept_locations dept_locations_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.dept_locations
    ADD CONSTRAINT dept_locations_pkey PRIMARY KEY (dnumber, dlocation);
 L   ALTER TABLE ONLY public.dept_locations DROP CONSTRAINT dept_locations_pkey;
       public                 postgres    false    219    219            ;           2606    16507    employee employee_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (ssn);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public                 postgres    false    217            E           2606    16534    project project_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (pnumber);
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public                 postgres    false    220            A           2606    16620 !   department unq_department_dnumber 
   CONSTRAINT     _   ALTER TABLE ONLY public.department
    ADD CONSTRAINT unq_department_dnumber UNIQUE (dnumber);
 K   ALTER TABLE ONLY public.department DROP CONSTRAINT unq_department_dnumber;
       public                 postgres    false    218            G           2606    16622    project unq_project_pnumber 
   CONSTRAINT     Y   ALTER TABLE ONLY public.project
    ADD CONSTRAINT unq_project_pnumber UNIQUE (pnumber);
 E   ALTER TABLE ONLY public.project DROP CONSTRAINT unq_project_pnumber;
       public                 postgres    false    220            I           2606    16545    works_on works_on_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.works_on
    ADD CONSTRAINT works_on_pkey PRIMARY KEY (essn, pno);
 @   ALTER TABLE ONLY public.works_on DROP CONSTRAINT works_on_pkey;
       public                 postgres    false    221    221            N           2606    16515 "   department department_mgr_ssn_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_mgr_ssn_fkey FOREIGN KEY (mgr_ssn) REFERENCES public.employee(ssn) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.department DROP CONSTRAINT department_mgr_ssn_fkey;
       public               postgres    false    218    217    4667            S           2606    16562    dependent dependent_essn_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dependent
    ADD CONSTRAINT dependent_essn_fkey FOREIGN KEY (essn) REFERENCES public.employee(ssn) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.dependent DROP CONSTRAINT dependent_essn_fkey;
       public               postgres    false    222    4667    217            O           2606    16525 *   dept_locations dept_locations_dnumber_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_locations
    ADD CONSTRAINT dept_locations_dnumber_fkey FOREIGN KEY (dnumber) REFERENCES public.department(dnumber) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.dept_locations DROP CONSTRAINT dept_locations_dnumber_fkey;
       public               postgres    false    4671    218    219            T           2606    16597    dependent fk_dependent_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.dependent
    ADD CONSTRAINT fk_dependent_employee FOREIGN KEY (essn) REFERENCES public.employee(ssn) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.dependent DROP CONSTRAINT fk_dependent_employee;
       public               postgres    false    222    4667    217            L           2606    16567    employee fk_employee_department    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_department FOREIGN KEY (dno) REFERENCES public.department(dnumber) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.employee DROP CONSTRAINT fk_employee_department;
       public               postgres    false    218    217    4671            M           2606    16623    employee fk_employee_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_employee FOREIGN KEY (super_ssn) REFERENCES public.employee(ssn) NOT VALID;
 G   ALTER TABLE ONLY public.employee DROP CONSTRAINT fk_employee_employee;
       public               postgres    false    217    217    4667            P           2606    16582    project fk_project_department    FK CONSTRAINT     �   ALTER TABLE ONLY public.project
    ADD CONSTRAINT fk_project_department FOREIGN KEY (dnum) REFERENCES public.department(dnumber) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.project DROP CONSTRAINT fk_project_department;
       public               postgres    false    220    218    4671            Q           2606    16587    works_on fk_works_on_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.works_on
    ADD CONSTRAINT fk_works_on_employee FOREIGN KEY (essn) REFERENCES public.employee(ssn) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.works_on DROP CONSTRAINT fk_works_on_employee;
       public               postgres    false    221    4667    217            R           2606    16592    works_on fk_works_on_project    FK CONSTRAINT     �   ALTER TABLE ONLY public.works_on
    ADD CONSTRAINT fk_works_on_project FOREIGN KEY (pno) REFERENCES public.project(pnumber) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.works_on DROP CONSTRAINT fk_works_on_project;
       public               postgres    false    221    4677    220            �   `   x���
�0E��_*I��ݜ;��
vP���c�t8�2�k�N`�·1&2{���ܥ����ܐ����jq2�c�0g�[җ�gņ	�_���      �   x   x�E̽
�  ��|
_��yƿ5$�2�v�"UH"HJ�ۗ�C��O��u>�����S�p&EHÔ��r�.�w��,�^R^e��Q`�h��	b�ŷ#�b�ȱ���K=�E���vB���!       �   -   x�3��/��+��2�K�K�/-K-�2����&�p��qqq �#h      �   �   x�E���0E׷_��d
��R|,HP#�4M B�4��o!g59��9����ZF�J�,��3��T3�a����묙,*$�' Bs�dek4
�c?uȳ4Qq�٢e¯�ˏ�c�\[s�ϗv�#U_��w����݄
g�&��9	
I���z�c嫜n�~a���5c�cN6�      �   _   x�340�t�TJ-NM,J���/��+��4�240�tI,ILJ,NU�,.I�-�K�K�/-K-+0��R)J����K��j,JM��4�����  �P      �   9   x���  �7�D<z��:D�;��k�h�{͑]D���PE2f�i�~[�
�     