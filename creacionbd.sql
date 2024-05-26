/*=====================================================================================================================================
  ============================================= CREACIÓN DE TABLAS E INSERCIÓN DE VALORES =============================================
  =====================================================================================================================================*/
-- Configuración del formato de fecha
ALTER SESSION SET nls_date_format = 'DD/MM/YYYY HH24:MI';

--Drop para todas las tablas
DROP TABLE alquiler_vehiculos;
DROP TABLE vehiculos;
DROP TABLE empresas_alquiler;
DROP TABLE carnets_chofer;
DROP TABLE idiomas_chofer;
DROP TABLE variedades_uva_bodegas;
DROP TABLE rutas_actividades;
DROP TABLE actividades;
DROP TABLE bodegas;
DROP TABLE reservas;
DROP TABLE rutas_fecha_hora;
DROP TABLE chofers;
DROP TABLE rutas;
DROP TABLE coordinadores;
DROP TABLE clientes;

-- Drop table si existe
-- DROP TABLE clientes;

-- Creación de la tabla CLIENTES
CREATE TABLE clientes (
    id        VARCHAR2(20) NOT NULL,
    nombre    VARCHAR2(20) NOT NULL,
    apellidos VARCHAR2(50) NOT NULL,
    telefono  VARCHAR(20) NOT NULL,
    email     VARCHAR2(255) NOT NULL,
    direccion VARCHAR2(200) NOT NULL,
    CONSTRAINT pk_clientes PRIMARY KEY ( id )
);
-- Inserción de 20 filas en la tabla CLIENTES
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('15785612D', 'María Luisa', 'Fernández Rúa', '695487525', 'marisa1975@gmail.com', 'C/Las Acacias, 4, 5º, Zaragoza, 50011');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('12345678A', 'Juan', 'Martínez García', '612345678', 'juan.martinez@gmail.com', 'Av. Navarra, 9, 2º, 26280 Ezcaray - La Rioja');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('X764Y2', 'Sophie', 'Dubois', '+33678901234', 'sophie.dubois@hotmail.fr', '8 Rue Saint-Melaine, 35000 Rennes, Francia');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('P987A3', 'Grazziano', 'Rossi', '+390123456789', 'luca.rossi@caperi.it', 'Via S. Vitale, 19, 40125 Bologna BO, Italia');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('F347B8', 'Emily', 'Smith', '+441234567890', 'emily.smith@example.co.uk', '59 Barrack St, Townparks, Dundalk, Co. Louth, A91 E9V0, Irlanda');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('87654321B', 'Ana', 'Hurtado Larra', '633987654', 'ana.garcia@gmail.com', 'Avda. de la Constitución, 22, Sevilla, 41004');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('Z129X8', 'Maximilian', 'Weber', '+491234567890', 'max.weber@example.de', 'Königsreihe, 22041 Hamburg, Alemania');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('23456789C', 'Elena', 'Fernández López', '688765432', 'elena.fernandez@gmail.com', 'Bo. Francisco Temprano, 10,5º, 49800 Toro, Zamora');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('K438Y1', 'Matías', 'Alves', '+351987654321', 'matias.alves@gmail.com', 'Q.ta São Miguel 33, 3030-333 Coimbra, Portugal');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('98765432D', 'Carlos', 'Martín Sánchez', '655432109', 'carlos.martin@gmail.com', 'Carrer del Poeta Cabanyes, 45, Sants-Montjuïc, 08004 Barcelona');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('44321677N', 'María', 'González López', '634567890', 'maria.gonzalez@gmail.com', 'Rúa do Pombal, 12, 3ºA, Santiago de Compostela, 15705');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('X12YB7', 'Liam', 'Murphy', '+353123456789', 'liam.murphy@example.ie', 'Main St, Cahersiveen, Co. Kerry, Ireland');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('34812399L', 'Sofía', 'Martínez', '+34678563412', 'sofia.martinez@gmail.com', 'Rúa Nova, 15, 1ºD, Lugo, 27001');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('W76Z12', 'Jacques', 'Dupont', '+33123456789', 'jacques.dupont@example.fr', 'Rue de la République, 10, Lyon, France');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('21449157C', 'Ricardo', 'García Pérez', '691234567', 'ricardo.garcia@gmail.com', 'Plaza Mayor, 8, 2ºB, Salamanca, 37002');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('4321AS', 'Olivia', 'Andersson', '+4681234567', 'olivia.andersson@example.se', 'Drottninggatan 65, 111 36 Stockholm, Sweden');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('12443821O', 'Pablo', 'Fernández Castro', '611223344', 'pablo.fernandez@gmail.com', 'Rua do Teatro, 7, 1ºC, Vigo, 36202');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('B902L3', 'Giulia', 'Romano', '+393456789012', 'giulia.romano@example.it', 'Via dei Giardini, 20, Roma, Italia');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('Y654H1', 'Emily', 'Jones', '+441632987654', 'emily.jones@example.co.uk', '23 High St, Cardiff CF10 1PT, UK');
INSERT INTO clientes (id, nombre, apellidos, telefono, email, direccion) 
VALUES ('45679139T', 'Miguel', 'González Paz', '634567891', 'miguel.gonzalez@gmail.com', 'Rúa de San Pedro, 20, 2ºE, A Coruña, 15001');

-- Drop table si existe
-- DROP TABLE coordinadores;
-- Creación de la tabla COORDINADORES
CREATE TABLE coordinadores (
    id        NUMBER(10),
    nif       VARCHAR2(20),
    nombre    VARCHAR2(20) NOT NULL,
    apellidos VARCHAR2(50) NOT NULL,
    telefono  VARCHAR(20) NOT NULL,
    email     VARCHAR2(255) NOT NULL,
    direccion VARCHAR2(200) NOT NULL,
    sueldo    NUMBER(8, 2) NOT NULL,
    CONSTRAINT pk_coordinadores PRIMARY KEY ( id,
                                              nif )
);

-- Inserción de 5 filas en la tabla COORDINADORES con valores aleatorios no correlativos en la columna NIF
INSERT INTO coordinadores (id, nif, nombre, apellidos, telefono, email, direccion, sueldo) 
VALUES (1, '58749612B', 'Manuel', 'Fernández López', '634567890', 'manuel.fernandez@gmail.com', 'Rúa Porta da Pena, 25, Santiago de Compostela', 25000);
INSERT INTO coordinadores (id, nif, nombre, apellidos, telefono, email, direccion, sueldo)
VALUES (2, '84920563E', 'Ana', 'González Rodríguez', '645678901', 'ana.gonzalez@gmail.com', 'Rúa San Pedro, 82, 1ºizq Santiago de Compostela', 23780.50);
INSERT INTO coordinadores (id, nif, nombre, apellidos, telefono, email, direccion, sueldo)
VALUES (3, '50789634R', 'Xoán', 'Martínez Varela', '656789012', 'xoan.martinez@gmail.com', 'Avda. de Lugo, 88, Milladoiro', 25000);
INSERT INTO coordinadores (id, nif, nombre, apellidos, telefono, email, direccion, sueldo)
VALUES (4, '63095287P', 'Iria', 'Pérez Castro', '667845223', 'iria.perez@gmail.com', 'Rúa da Rosa, 3, Ames', 21000.80);
INSERT INTO coordinadores (id, nif, nombre, apellidos, telefono, email, direccion, sueldo)
VALUES (5, '71984623F', 'Xabier', 'López Iglesias', '677890123', 'xabier.lopez@gmail.com', 'Rúa Marqués de Pontejos, 30, 5ºA, A Coruña', 20500.60);

-- Drop table si existe RUTAS
-- DROP TABLE rutas;
-- Creación de la tabla RUTAS
CREATE TABLE rutas (
    id          NUMBER(10),
    nombre      VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(2000) NOT NULL,
    duracion    VARCHAR2(10) NOT NULL,
    distancia   NUMBER(4) NOT NULL,
    zona        VARCHAR2(30) NOT NULL,
    precio      NUMBER(8, 2) NOT NULL,
    CONSTRAINT pk_rutas PRIMARY KEY ( id ),
    CONSTRAINT chk_rutas_zona CHECK ( UPPER(zona) IN ( 
                    'MONTERREI', 'RÍAS BAIXAS', 'RIBEIRA SACRA', 'O RIBEIRO', 'VALDEORRAS' ) )
);

-- Insertando 12 filas en la tabla RUTAS

INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (1, 'Ruta enológica y medieval por Monterrei', 'Embárcate en una emocionante ruta enológica por la pintoresca región de Monterrei. Comienza tu jornada con la Experiencia enoturística maridada en Bodegas Triay, donde descubrirás los secretos de la elaboración del vino mientras degustas exquisitas combinaciones de vinos elaborados con variedades como Godello y Mencía. Luego, maravíllate con la imponente belleza del Castillo de Monterrei, una fortaleza medieval que te transportará a tiempos pasados. Finaliza tu día con la Cata de vinos autóctonos y visita de viñedos en Castro de Lobarzan, donde aprenderás sobre la pasión por la viticultura y la elaboración de vinos naturales en esta bodega familiar, con variedades como Godello, Treixadura, Mencía, Araúxa y Bastardo. ¡Una experiencia inolvidable llena de historia y sabor!', '7h', 20, 'Monterrei', 70);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (2, 'Ruta Cultural y Enológica por Monterrei', 'Descubre la fascinante combinación de historia y enología en la Ruta Cultural y Enológica por Monterrei. Comienza tu día explorando el majestuoso Castillo de Monterrei, una fortaleza medieval que te sumergirá en siglos de historia y leyendas. Después, continúa tu aventura enológica con la Visita a lagares rupestres y viñedos en Bodegas Triay, donde aprenderás sobre la rica tradición vitivinícola de la región y degustarás vinos excepcionales. ¡Una experiencia única que une pasado y presente en Monterrei!', '5h30m', 15, 'Monterrei', 60);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (3, 'Ruta del Albariño por las Rías Baixas', 'Embárcate en una encantadora Ruta de Enoturismo por las Rías Baixas y descubre la esencia de esta fascinante región. Comienza tu jornada sumergiéndote en el encanto de Pazo Quinteiro da Cruz con la Visita a sus bodegas, donde aprenderás sobre la historia y tradición vitivinícola de la zona y degustarás sus prestigiosos vinos. Continúa tu aventura enológica explorando la excelencia de los Vinos de Pago en Pazo Baión, con una cata comentada de sus exclusivos albariños. Para finalizar, déjate sorprender por ORIXE en Martin Codax, donde conocerás el origen de los vinos D.O. Rías Baixas en una experiencia guiada por expertos, acompañada de una deliciosa cata maridaje.', '8h', 50, 'Rías Baixas', 120);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (4, 'Ruta de los pazos del Albariño', 'Disfruta de una experiencia vinícola inolvidable en las Rías Baixas con esta cautivadora ruta. Comienza sumergiéndote en el encanto de Pazo Quinteiro da Cruz con una visita guiada a sus jardines, donde descubrirás la riqueza botánica y cultural de la región. Continúa tu aventura enológica en Pazo Baión, donde te sorprenderás con "El Alma de los Albariños", una experiencia que te llevará a explorar los viñedos y bodegas mientras degustas una selección de sus mejores albariños. ¡Una jornada llena de sabor y belleza en las Rías Baixas!', '4h', 15, 'Rías Baixas', 90);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (5, 'Paseo en barca por la ría y visita a Martín Códax', 'Sumérgete en una experiencia única que combina la belleza del mar con la excelencia vinícola en las Rías Baixas. Comienza tu día con un emocionante paseo en barco por la Ría de Arousa, donde podrás disfrutar de las vistas panorámicas y la brisa marina. Luego, continúa tu aventura enológica en Martín Códax con ONDAS DO MAR, una experiencia que te llevará a descubrir el origen de los vinos D.O. Rías Baixas en un entorno privilegiado, acompañado de una deliciosa cata maridaje con vinos y conservas gourmet. ¡Una jornada que estimulará todos tus sentidos en las Rías Baixas!', '5h', 30, 'Rías Baixas', 150);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (6, 'Ruta por la Ribeira Sacra con comida en bodega', 'Descubre la magia de la Ribeira Sacra en una emocionante ruta vinícola que te llevará a través de paisajes impresionantes y vinos excepcionales. Comienza tu jornada con una visita a Finca Millara, donde podrás sumergirte en la historia y el paisaje de esta bodega artesanal, culminando con una cata panorámica de sus vinos más destacados. Continúa tu experiencia enológica en Vía Romana con una visita a sus instalaciones, seguida de una degustación de tres de sus vinos emblemáticos. Finalmente, disfruta de una visita a bodega y comida panorámica en Adega Algueira, donde podrás aprender sobre la viticultura y disfrutar de una deliciosa comida acompañada de vinos selectos. ¡Una jornada inolvidable en la Ribeira Sacra!', '7h', 150, 'Ribeira Sacra', 130);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (7, 'Vitucultura heróica y paseo en barco por la Ribeira Sacra', 'Embárcate en una aventura vinícola por la Ribeira Sacra y descubre la belleza y el sabor de esta región única. Comienza tu día con una visita a Finca Millara, donde conocerás la historia de esta bodega artesanal y degustarás una selección de sus vinos más destacados. Continúa tu experiencia enológica con una visita heroica en Vía Romana, donde recorrerás los viñedos en las laderas del río Miño y disfrutarás de una degustación de vinos de la región. Finaliza tu jornada con una ruta en barco y visita a Viña Algueira, donde podrás explorar los viñedos a lo largo del río Sil y disfrutar de una cata a bordo de sus vinos mientras contemplas el paisaje único de la Ribeira Sacra. ¡Una experiencia vinícola completa que te llevará a través de los rincones más encantadores de esta región!', '8h', 150, 'Ribeira Sacra', 135);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (8, 'Descubre la Ribeira Sacra con los 5 sentidos', 'Descubre la belleza y la diversidad de la Ribeira Sacra en una emocionante ruta que combina la exploración vinícola y acuática. Comienza tu día con la Visita Vía Romana 5 Sentidos, donde sumergirás todos tus sentidos en la historia y tradición vitivinícola de la región con una visita guiada y una cata de vinos emblemáticos. Continúa tu aventura enológica con una Ruta en barco y visita a Viña Algueira, donde te embarcarás en un viaje por el río Sil para descubrir los viñedos que rodean esta zona y degustar los vinos de la bodega a bordo del barco. ¡Una jornada única que te llevará a través de los paisajes más impresionantes de la Ribeira Sacra!', '5h', 100, 'Ribeira Sacra', 120);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (9, 'Explorando el Legado Vinícola de O Ribeiro', 'Embárcate en una jornada única donde la historia y la naturaleza se entrelazan. Comenzamos la aventura en Ramón do Casar, una bodega enclavada en una terraza con vistas al embalse de Castrelo de Miño. Déjate cautivar por el paisaje mientras  descubres los secretos de la vinificación. Sumérgete en una cata de 5 vinos, donde las variedades Treixadura, Albariño y Godello despertarán tus sentidos. Luego, nos dirigiremos al Priorato de Razamonde para una experiencia gastronómica en medio de viñedos centenarios. Aquí, un guía te llevará a través de los procesos de elaboración de vinos, mientras disfrutas de un picnic con vistas al río Miño. Dos destinos, una ruta inolvidable que fusiona la pasión por el vino con la belleza natural de O Ribeiro en Ourense.', '8h', 25, 'O Ribeiro', 110);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (10, 'Ruta enológica y termal por O Ribeiro', 'Descubre el encanto de O Ribeiro a través sus vinos en esta emocionante ruta que combina la historia vinícola, la cultura y el relax. Comienza tu jornada con una visita a Ramón do Casar, una bodega situada en una terraza a los pies del embalse de Castrelo de Miño, donde te sumergirás en la magia de la viticultura local y disfrutarás de una cata de 5 vinos emblemáticos. Continúa tu viaje enológico en el Priorato de Razamonde, una bodega familiar donde aprenderás sobre el proceso de elaboración del vino y degustarás sus exquisitos vinos. Finaliza tu día con una visita a las Termas de Outariz, donde podrás relajarte en las aguas termales y disfrutar de un merecido descanso mientras contemplas las impresionantes vistas del entorno natural.', '8h', 50, 'O Ribeiro', 150);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (11, 'Exploración Vinícola en Valdeorras', 'Embárcate en una emocionante exploración vinícola en la región de Valdeorras con esta completa ruta enológica. Comienza tu día en Adega Alan de Val, donde te sumergirás en el apasionante mundo del vino, desde el proceso de elaboración hasta el paseo por los viñedos de la finca Pedrazais, culminando en una cata de sus vinos más destacados. Continúa tu experiencia enológica en Adega Pinguela, ubicada en el pintoresco lugar de Carballal, en Petín de Valdeorras, donde disfrutarás de una cata comentada de sus vinos y un agradable paseo por los viñedos. Una jornada completa que te llevará a descubrir los secretos vinícolas de Valdeorras y degustar algunos de sus mejores caldos.', '5h', 35, 'Valdeorras', 80);
INSERT INTO rutas (id, nombre, descripcion, duracion, distancia, zona, precio) 
VALUES (12, 'Descubriendo Valdeorras: Vinos, Cuevas y Tradición', 'Sumérgete en una experiencia única en la región de Valdeorras, donde los vinos, las cuevas y la tradición se entrelazan en un recorrido inolvidable. Comienza tu jornada enológica en Alan de Val, una bodega que te llevará a través del fascinante mundo del vino, desde la vinificación hasta el paseo por los viñedos de la finca Pedrazais, culminando en una degustación de sus selectos vinos. Continúa tu aventura vinícola en Pinguela, donde disfrutarás de una cata comentada de sus vinos y un agradable paseo por los viñedos. Para completar tu experiencia, visita las Covas de Valdeorras, un tesoro arquitectónico y etnográfico único en Galicia. Estas cuevas, utilizadas para elaborar y conservar el vino, representan una parte importante de la historia y la cultura de la región, transmitidas de generación en generación. Descubre el valor social y cultural de estos espacios mientras exploras su diversidad arquitectónica y su profunda conexión con la tradición vinícola de Valdeorras.', '6h', 45, 'Valdeorras', 100);

-- Drop table si existe
-- DROP TABLE chofers;
-- Creación de la tabla CHOFERS
CREATE TABLE chofers (
    id        NUMBER(10),
    nif       VARCHAR2(20),
    nombre    VARCHAR2(20) NOT NULL,
    apellidos VARCHAR2(50) NOT NULL,
    telefono  VARCHAR(20) NOT NULL,
    email     VARCHAR2(255) NOT NULL,
    direccion VARCHAR2(200) NOT NULL,
    sueldo    NUMBER(8, 2) NOT NULL,
    CONSTRAINT pk_chofers PRIMARY KEY ( id,
                                              nif )
);

-- Inserción de 8 filas en la tabla CHOFERS
INSERT INTO chofers (id, nif, nombre, apellidos, telefono, email, direccion, sueldo) 
VALUES (1, '23870561J', 'Manuel', 'Fernández Vázquez', '658451448', 'manuel.fernandez@gmail.com', 'Corredoira das Fraguas, 26, 15703 Santiago de Compostela, A Coruña', 20325);
INSERT INTO chofers (id, nif, nombre, apellidos, telefono, email, direccion, sueldo) 
VALUES (2, '54680923B', 'Xoán', 'González López', '665895745', 'xoan.gonzalez@hotmail.com', 'Rúa de Moron, 2, 36540 Silleda, Pontevedra', 24000);
INSERT INTO chofers (id, nif, nombre, apellidos, telefono, email, direccion, sueldo) 
VALUES (3, '79014628N', 'Carmen', 'Martínez Rodríguez', '632588744', 'carmen.martinez@yahoo.com', 'R. Ánxel Gómez Montero, 100, 27500 Chantada, Lugo', 25125);
INSERT INTO chofers (id, nif, nombre, apellidos, telefono, email, direccion, sueldo) 
VALUES (4, '42960817J', 'José', 'López García', '5636520100', 'jose.lopez@hotmail.com', 'Rúa Vila Valencia, 6, 32002 Ourense', 21500);
INSERT INTO chofers (id, nif, nombre, apellidos, telefono, email, direccion, sueldo) 
VALUES (5, '10372596Z', 'María', 'Pérez Castro', '680455734', 'maria.perez@gmail.com', 'Av. de Rosalía de Castro, 115, 15706 Santiago de Compostela, La Coruña', 23874);
INSERT INTO chofers (id, nif, nombre, apellidos, telefono, email, direccion, sueldo) 
VALUES (6, '25641803A', 'John', 'Smith', '621457888', 'john.smith@gmail.com', 'Rúa Fernando II, 10, 36003 Pontevedra', 24010);
INSERT INTO chofers (id, nif, nombre, apellidos, telefono, email, direccion, sueldo) 
VALUES (7, '63792410G', 'Manuel', 'Sousa', '678548012', 'manuel.sousa@hotmail.com', 'Casas Novas, 87, 36164 Pontevedra', 21500);
INSERT INTO chofers (id, nif, nombre, apellidos, telefono, email, direccion, sueldo) 
VALUES (8, '87409351L', 'Ivan', 'Kovač', '+34 612 789 345', 'ivan.kovac@yahoo.com', 'Pl. Luis Fernández, n1, 32001 Ourense', 23540);


-- Drop table RUTAS_FECHA_HORA si existe
-- DROP TABLE rutas_fecha_hora;

--Creación de la tabla RUTAS_FECHA_HORA
CREATE TABLE rutas_fecha_hora (
    id_ruta        NUMBER(10),
    fecha_hora     DATE,
    disponibilidad VARCHAR2(1)NOT NULL,
    id_chofer      NUMBER(10) DEFAULT NULL,
    nif_chofer     VARCHAR2(20) DEFAULT NULL,
    CONSTRAINT pk_rutas_fecha_hora PRIMARY KEY (id_ruta, fecha_hora),
    CONSTRAINT chk_rutas_f_h_disponibilidad CHECK (UPPER(disponibilidad) IN ('S', 'N')),
    CONSTRAINT fk_rutas_f_h_rutas FOREIGN KEY (id_ruta)
        REFERENCES rutas(id),
    CONSTRAINT fk_rutas_f_h_chofer FOREIGN KEY (id_chofer, nif_chofer)
        REFERENCES chofers (id, nif)
);

-- Insert de 57 filas en RUTAS_FECHA_HORA
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (1, TO_DATE('20/04/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n', 4, '42960817J');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (1, TO_DATE('11/05/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (1, TO_DATE('18/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n', 6, '25641803A');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (1, TO_DATE('19/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (2, TO_DATE('02/05/2024 10:30', 'DD/MM/YYYY HH24:MI'), 'n', 8, '87409351L');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (2, TO_DATE('13/07/2024 10:30', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (2, TO_DATE('20/07/2024 10:30', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (3, TO_DATE('05/05/2024 11:00', 'DD/MM/YYYY HH24:MI'), 'n', 2, '54680923B');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (3, TO_DATE('06/04/2024 11:00', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (3, TO_DATE('27/04/2024 11:00', 'DD/MM/YYYY HH24:MI'), 'n', 2, '54680923B');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (3, TO_DATE('22/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (3, TO_DATE('23/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (3, TO_DATE('13/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (3, TO_DATE('14/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (4, TO_DATE('03/05/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n', 7, '63792410G');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (5, TO_DATE('04/05/2024 10:30', 'DD/MM/YYYY HH24:MI'), 'n', 6, '25641803A');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (5, TO_DATE('05/05/2024 10:30', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (5, TO_DATE('27/04/2024 10:30', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (5, TO_DATE('28/04/2024 10:30', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (5, TO_DATE('19/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n',2,'54680923B');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (5, TO_DATE('20/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (5, TO_DATE('06/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (5, TO_DATE('07/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n', 7, '63792410G');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (5, TO_DATE('13/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (6, TO_DATE('06/05/2024 09:00', 'DD/MM/YYYY HH24:MI'), 'n', 3, '79014628N');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (6, TO_DATE('19/06/2024 09:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (6, TO_DATE('20/06/2024 09:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (6, TO_DATE('28/06/2024 09:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (6, TO_DATE('29/06/2024 09:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (7, TO_DATE('07/05/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n', 3, '79014628N');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (7, TO_DATE('08/05/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (7, TO_DATE('19/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (7, TO_DATE('20/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (7, TO_DATE('26/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (7, TO_DATE('27/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (8, TO_DATE('06/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (8, TO_DATE('13/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (8, TO_DATE('20/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (8, TO_DATE('27/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (9, TO_DATE('09/05/2024 11:00', 'DD/MM/YYYY HH24:MI'), 'n', 5, '10372596Z');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (9, TO_DATE('19/06/2024 11:00', 'DD/MM/YYYY HH24:MI'), 'n', 4,'42960817J');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (9, TO_DATE('20/06/2024 11:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (10, TO_DATE('11/05/2024 11:30', 'DD/MM/YYYY HH24:MI'), 'n', 8, '87409351L');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (10, TO_DATE('12/05/2024 11:30', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (10, TO_DATE('20/04/2024 11:30', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (10, TO_DATE('27/04/2024 11:30', 'DD/MM/YYYY HH24:MI'), 'n', 8, '87409351L');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (10, TO_DATE('19/06/2024 11:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (11, TO_DATE('20/04/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n', 3, '79014628N');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (11, TO_DATE('27/04/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (11, TO_DATE('04/05/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n', 8, '87409351L');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (11, TO_DATE('19/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (11, TO_DATE('20/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'n', 8, '87409351L');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad, id_chofer, nif_chofer)
VALUES (12, TO_DATE('12/05/2024 10:30', 'DD/MM/YYYY HH24:MI'), 'n', 4, '42960817J');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (12, TO_DATE('06/07/2024 10:30', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (12, TO_DATE('13/07/2024 10:30', 'DD/MM/YYYY HH24:MI'), 's');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (12, TO_DATE('20/07/2024 10:30', 'DD/MM/YYYY HH24:MI'), 'n');
INSERT INTO rutas_fecha_hora (id_ruta, fecha_hora, disponibilidad)
VALUES (12, TO_DATE('27/07/2024 10:30', 'DD/MM/YYYY HH24:MI'), 's');

-- Drop tabla RESERVAS si existe
-- DROP TABLE reservas;

-- Creación de tabla RESERVAS
CREATE TABLE reservas (
    id              NUMBER(10),
    estado          VARCHAR2(10) DEFAULT 'pendiente',
    medio           VARCHAR2(3) NOT NULL,
    fecha_hora      DATE NOT NULL,
    num_personas    NUMBER(3) NOT NULL,
    pto_recogida    VARCHAR2(200) NOT NULL,
    idioma          VARCHAR(10) NOT NULL,
    importe         NUMBER(7, 2) NOT NULL,
    peticiones      VARCHAR2(200),
    num_tarjeta     VARCHAR2(20) NOT NULL,
    fecha_tarjeta   VARCHAR2(7) NOT NULL,
    cvc_tarjeta     VARCHAR2(3) NOT NULL,
    id_ruta         NUMBER(10) NOT NULL,
    fecha_hora_ruta DATE NOT NULL,
    id_cliente      VARCHAR2(20),
    id_coordinador  NUMBER(10) DEFAULT NULL,
    nif_coordinador VARCHAR2(20) DEFAULT NULL,
    CONSTRAINT pk_reservas PRIMARY KEY ( id ),
    CONSTRAINT chk_reservas_estado CHECK ( UPPER(estado) IN ( 'CANCELADA', 'CONFIRMADA', 'PAGADA', 'PENDIENTE' ) ),
    CONSTRAINT chk_reservas_medio CHECK ( UPPER(medio) IN ( 'APP', 'WEB', 'TLF' ) ),
    CONSTRAINT chk_reserva_num_personas CHECK (num_personas < 9),
    CONSTRAINT fk_reservas_id_fecha_ruta FOREIGN KEY ( id_ruta,
                                                       fecha_hora_ruta )
        REFERENCES rutas_fecha_hora ( id_ruta,
                                      fecha_hora ),
    CONSTRAINT fk_reservas_id_cliente FOREIGN KEY ( id_cliente )
        REFERENCES clientes ( id ) ON DELETE SET NULL,
    CONSTRAINT fk_reservas_coordinador FOREIGN KEY ( id_coordinador,
                                                     nif_coordinador )
        REFERENCES coordinadores ( id,
                                   nif )
);

-- Insertando 27 filas en la tabla RESERVAS
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (1, 'pagada', 'web', TO_DATE('14/12/2023 23:32', 'DD/MM/YYYY HH24:MI'), 3, 'Parador Castelo de Monterrei', 'español', 210, '4982984151881611', '04/2033', '841', 1, TO_DATE('20/04/2024 10:00', 'DD/MM/YYYY HH24:MI'), '15785612D', 1, '58749612B');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (2, 'pagada', 'app', TO_DATE('10/01/2024 21:51', 'DD/MM/YYYY HH24:MI'), 2, 'A Morada do Cigarrón', 'español', 120, '4603706218465719', '04/2030', '194', 2, TO_DATE('02/05/2024 10:30', 'DD/MM/YYYY HH24:MI'), '12345678A', 1, '58749612B');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (3, 'pagada', 'tlf', TO_DATE('20/03/2024 15:44', 'DD/MM/YYYY HH24:MI'), 4, 'Agusta Eco Wellness Resort', 'español', 480, '4428314293466810', '02/2031', '560', 3, TO_DATE('05/05/2024 11:00', 'DD/MM/YYYY HH24:MI'), '4321AS', 1, '58749612B');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (4, 'pagada', 'app', TO_DATE('10/02/2024 09:07', 'DD/MM/YYYY HH24:MI'), 5, 'Novavila Design Wine Hotel', 'inglés', 600, '4428314293466810', '08/2031', '937', 3, TO_DATE('27/04/2024 11:00', 'DD/MM/YYYY HH24:MI'), 'X12YB7', 1, '58749612B');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (5, 'pagada', 'web', TO_DATE('12/12/2023 14:15', 'DD/MM/YYYY HH24:MI'), 3, 'Parador de Pontevedra', 'español', 270, '4142269601316286', '09/2032', '614', 4, TO_DATE('03/05/2024 10:00', 'DD/MM/YYYY HH24:MI'), '87654321B', 2, '84920563E');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (6, 'pagada', 'web', TO_DATE('21/01/2024 10:30', 'DD/MM/YYYY HH24:MI'), 5, 'Aeropuerto de Santiago', 'inglés', 750, '4896325299307348', '12/2024', '173', 5, TO_DATE('04/05/2024 10:30', 'DD/MM/YYYY HH24:MI'), 'Z129X8', 1, '58749612B');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (7, 'pagada', 'app', TO_DATE('07/03/2024 09:00', 'DD/MM/YYYY HH24:MI'), 7, 'Parador de Monforte de Lemos', 'español', 910, '4679805607873829', '06/2030', '386', 6, TO_DATE('06/05/2024 09:00', 'DD/MM/YYYY HH24:MI'), '98765432D', 3, '50789634R');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (8, 'pagada', 'tlf', TO_DATE('05/12/2023 10:00', 'DD/MM/YYYY HH24:MI'), 4, 'Cabo do Mundo Casa Rural', 'español', 540, '4506403195488223', '09/2025', '863', 7, TO_DATE('07/05/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'K438Y1', 1, '58749612B');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (9, 'pagada', 'web', TO_DATE('03/01/2024 11:00', 'DD/MM/YYYY HH24:MI'), 6, 'Estación de tren de Ourense', 'inglés', 660, '4042945814784748', '01/2033', '726', 9, TO_DATE('09/05/2024 11:00', 'DD/MM/YYYY HH24:MI'), 'F347B8', 5, '71984623F');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (10, 'pagada', 'app', TO_DATE('27/11/2023 11:30', 'DD/MM/YYYY HH24:MI'), 3, 'NH Ourense', 'español', 450, '4654597816336164', '05/2032', '176', 10, TO_DATE('11/05/2024 11:30', 'DD/MM/YYYY HH24:MI'), '23456789C', 4, '63095287P');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador, peticiones) 
VALUES (11, 'pagada', 'app', TO_DATE('01/02/2024 11:30', 'DD/MM/YYYY HH24:MI'), 4, 'Gandarela Turismo Rural', 'español', 600, '4552026820746518', '07/2032', '876', 10, TO_DATE('27/04/2024 11:30', 'DD/MM/YYYY HH24:MI'), '45679139T', 3, '50789634R', 'Viajamos con una perrita');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (12, 'pagada', 'web', TO_DATE('30/01/2024 10:00', 'DD/MM/YYYY HH24:MI'), 6, 'Pazo da Pena', 'italiano', 480, '4781415832966920', '04/2029', '934', 11, TO_DATE('20/04/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'B902L3', 2, '84920563E');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (13, 'pagada', 'tlf', TO_DATE('15/03/2024 10:00', 'DD/MM/YYYY HH24:MI'), 7, 'Pazo do Castro', 'inglés', 560, '4606954242817508', '08/2032', '572', 11, TO_DATE('04/05/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'Y654H1', 5, '71984623F');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (14, 'pagada', 'web', TO_DATE('01/03/2024 10:30', 'DD/MM/YYYY HH24:MI'), 8, 'Casa rural A Curuxa', 'español', 800, '4783484799582052', '09/2030', '597', 12, TO_DATE('12/05/2024 10:30', 'DD/MM/YYYY HH24:MI'), '34812399L', 4, '63095287P');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (15, 'cancelada', 'app', TO_DATE('02/12/2023 10:00', 'DD/MM/YYYY HH24:MI'), 5, 'O Retiro dos Condes', 'español', 350, '4783484799582052', '09/2030', '597', 1, TO_DATE('11/05/2024 10:00', 'DD/MM/YYYY HH24:MI'), '23456789C', 4, '63095287P');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (16, 'cancelada', 'web', TO_DATE('24/01/2024 10:30', 'DD/MM/YYYY HH24:MI'), 7, 'Aeropuerto de Lavacolla', 'inglés', 900, '4894574635274215', '05/2025', '761', 5, TO_DATE('28/04/2024 10:30', 'DD/MM/YYYY HH24:MI'), '44321677N', 1, '58749612B');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (17, 'cancelada', 'tlf', TO_DATE('01/02/2024 11:30', 'DD/MM/YYYY HH24:MI'), 3, 'A Morada do Cigarrón', 'español', 450, '4894574635274215', '05/2025', '761', 10, TO_DATE('12/05/2024 11:30', 'DD/MM/YYYY HH24:MI'), '87654321B', 2, '84920563E');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador, peticiones) 
VALUES (18, 'confirmada', 'web', TO_DATE('18/01/2024 09:35', 'DD/MM/YYYY HH24:MI'), 4, 'Parador de Verín', 'inglés', 280, '4458256541004468', '12/2024', '837', 1, TO_DATE('18/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'P987A3', 1, '58749612B', 'We need a child car seat, please');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (19, 'pagada', 'app', TO_DATE('09/01/2024 13:42', 'DD/MM/YYYY HH24:MI'), 5, 'Estación de tren de Pontevedra', 'francés', 750, '4552501361487102', '03/2027', '867', 5, TO_DATE('19/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'X764Y2', 5, '71984623F');
INSERT INTO reservas (id, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador, peticiones) 
VALUES (20, 'app', TO_DATE('08/02/2024 20:31', 'DD/MM/YYYY HH24:MI'), 6, 'Casa Solveira', 'francés', 810, '4308314332881883', '08/2030', '760', 7, TO_DATE('20/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'W76Z12', 2, '84920563E', 'Preferencia por guía turístico bilingüe');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (21, 'cancelada', 'web', TO_DATE('01/01/2024 10:02', 'DD/MM/YYYY HH24:MI'), 3, 'Estación de tren de Ourense', 'inglés', 450, '5129776772774907', '03/2034', '643', 10, TO_DATE('19/06/2024 11:00', 'DD/MM/YYYY HH24:MI'), 'Y654H1', 2, '84920563E');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador, peticiones) 
VALUES (22, 'confirmada', 'app', TO_DATE('01/03/2024 22:45', 'DD/MM/YYYY HH24:MI'), 4, 'Pazo Paradela', 'español', 320, '4402965411350754', '11/2028', '503', 11, TO_DATE('20/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), '21449157C', 4, '63095287P', 'Maridaje vegano');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador, peticiones) 
VALUES (23, 'confirmada', 'web', TO_DATE('17/04/2024 18:43', 'DD/MM/YYYY HH24:MI'), 6, 'CAsa dos Ulloa', 'español', 660, '4966279143878381', '05/2025', '851', 9, TO_DATE('19/06/2024 11:00', 'DD/MM/YYYY HH24:MI'), '23456789C', 5, '71984623F', 'Puede que seamos una persona más');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (24, 'cancelada', 'tlf', TO_DATE('01/02/2024 07:32', 'DD/MM/YYYY HH24:MI'), 5, 'Estación de tren', 'italiano', 400, '4727314477824840', '04/2027', '048', 11, TO_DATE('20/06/2024 10:00', 'DD/MM/YYYY HH24:MI'), 'B902L3', 3, '50789634R');
INSERT INTO reservas (id, estado, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador, peticiones) 
VALUES (25, 'confirmada', 'web', TO_DATE('21/02/2024 23:57', 'DD/MM/YYYY HH24:MI'), 6, 'Casa Alicia', 'español', 900, '4345470349441940', '12/2032', '343', 5, TO_DATE('07/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), '12443821O', 1, '58749612B', 'Viajamos con una persona con movilidad reducida');
INSERT INTO reservas (id, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (26, 'app', TO_DATE('25/04/2024 09:13', 'DD/MM/YYYY HH24:MI'), 7, 'Pazo Costa Vella', 'español', 840, '94438649024309559', '10/2031', '726', 8, TO_DATE('27/07/2024 10:00', 'DD/MM/YYYY HH24:MI'), '12345678A', 5, '71984623F');
INSERT INTO reservas (id, medio, fecha_hora, num_personas, pto_recogida, idioma, importe, num_tarjeta, fecha_tarjeta, cvc_tarjeta, id_ruta, fecha_hora_ruta, id_cliente, id_coordinador, nif_coordinador) 
VALUES (27, 'web', TO_DATE('02/03/2024 19:21', 'DD/MM/YYYY HH24:MI'), 8, 'Casa A Curuxa', 'español', 800, '4552540246645898', '07/2027', '787', 12, TO_DATE('20/07/2024 10:30', 'DD/MM/YYYY HH24:MI'), '34812399L', 5, '71984623F');



-- Drop table si existe BODEGAS
-- DROP TABLE bodegas;
-- Creación de la tabla BODEGAS
CREATE TABLE bodegas (
    cif       VARCHAR2(10),
    nombre    VARCHAR2(50) NOT NULL,
    telefono  VARCHAR2(20) NOT NULL,
    email     VARCHAR2(255) NOT NULL,
    direccion VARCHAR2(200) NOT NULL,
    CONSTRAINT pk_bodegas PRIMARY KEY ( cif )
);

--Inseción de 12 filas en la tabla BODEGAS
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('D45678901', 'Bodegas Triay', '986543210', 'info@bodegastriay.com', 'Rúa Ladairo, 36, 32613 O Rosal, Ourense');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('K78551945', 'Castro de Lobarzan', '986543210', 'info@castrodelobarzan.com', 'Rúa Requeixo, 51, 32618 Vilaza, Ourense');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('L33754852', 'Pazo Baion', '986123456', 'info@pazobaion.com', '4-6, 36614 A Abelleira, Pontevedra');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('D85997664', 'Pazo Quinteiro da Cruz', '986654321', 'info@pazoquinteirodacruz.com', 'Rúa Cruz, 88, 36635 Ribadumia, Pontevedra');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('T62887345', 'Martín Códax', '986789012', 'info@martincodax.com', 'Burgáns, 91, 36633 Vilariño, Cambados, Pontevedra, Pontevedra');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('G71449832', 'Finca Millara', '982345678', 'info@finca-millara.com', 'Lugar de, S/N, 27439 A Míllara, Lugo');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('Z66723519', 'Adega Algueira', '982456789', 'info@radegaalgueira.com', 'Carretera Francos doade s/n, 27424 Doade, Lugo');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('F62711982', 'Vía Romana', '982567890', 'info@viaromana.com', 'A Ermida - BELESAR, 27514 Chantada, Lugo');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('C83512439', 'Priorato de Razamonde', '988123456', 'info@prioratoderazamonde.com', 'Al Lameiro Monte, 64, 32459, Ourense');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('D93118728', 'Ramon do Casar', '988654321', 'info@ramondocasar.com', 'OU-402, Km. 18, 32430 O Prado, Ourense');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('R29937181', 'Alan de Val', '988789012', 'info@alandeval.com', 'Lugar de Pedrazáis, s/n, 32350 A Rúa, Province of Ourense');
INSERT INTO bodegas (cif, nombre, telefono, email, direccion) 
VALUES ('B618132993', 'Adega da Pinguela', '988901234', 'info@adegadapinguela.com', 'Lugar, Travesía Carballal, 2, 32357 Petín, Province of Ourense');


-- Drop table si existe
-- DROP TABLE actividades;

-- Creación de la tabla ACTIVIDADES
CREATE TABLE actividades (
    id          NUMBER(10),
    nombre      VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(1000) NOT NULL,
    duracion    VARCHAR2(6) NOT NULL,
    precio      NUMBER(6, 2) NOT NULL,
    cif_bodega  VARCHAR2(10) NOT NULL,
    CONSTRAINT pk_actividades PRIMARY KEY ( id ),
    CONSTRAINT fk_actividades_bodega FOREIGN KEY ( cif_bodega )
        REFERENCES bodegas ( cif )
);

-- Inserción de 18 filas en tabla ACTIVIDADES
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (1, 'Visita a lagares rupestres y viñedos', 'Explora la historia vitivinícola de nuestra región en una visita guiada única. Descubre lagares rupestres y nuestra bodega-lagar del siglo XVII mientras paseas por nuestros viñedos. Conoce la evolución de los procesos de elaboración del vino a lo largo de 2.000 años y explora diferencias entre métodos actuales y tradicionales. Detalles sobre elaboración de vinos, tareas en el viñedo y variedades de uva como Triay Godello y Mencía. Culmina con degustación de dos vinos, maridados con productos típicos gallegos.', '3h30m', 25.00, 'D45678901');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (2, 'Experiencia enoturística maridada', 'Disfruta de nuestra experiencia enoturística con visita a bodega familiar y viñedos. Degusta 2 vinos mientras explicamos nuestro proceso de elaboración y tareas en el viñedo. Finaliza con degustación maridada.', '2h', 15.00, 'D45678901');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (3, 'Cata de vinos autóctonos y visita de viñedos', 'Descubre la pasión por la viticultura y elaboración de vinos naturales en bodega familiar Castro de Lobarzán, ubicada en pintoresco pueblo de Villaza, en Monterrei. Experiencia única explorando nuestras 5,2 hectáreas de viñedo propio en laderas de suelos arenosos. Aprende sobre nuestra misión de recuperar y preservar variedades autóctonas de la zona. Conoce nuestro proceso de trabajo manual, desde poda hasta vendimia, y dedicación a elaborar vinos blancos y tintos auténticos como Godello, Treixadura, Mencía, Araúxa y Bastardo. Visita culmina con cata de nuestras marcas comerciales, incluyendo emblemático Castro de Lobarzán Blanco (Godello y Treixadura) y Tinto (Mencía Araúxa y Bastardo)', '2h', 20.50, 'K78551945');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (4, 'Visita a Finca Millara y cata panorámica', 'Únete a nosotros en una fascinante visita a Finca Millara, un proyecto dedicado a la recuperación de antiguas viñas centenarias en A Míllara, en pleno corazón de la Ribeira Sacra. Conoce nuestra bodega artesanal, rodeada de 11 hectáreas de viñedos donde cultivamos cuidadosamente Mencía, Sousón, Garnacha y Tempranillo. Explora nuestra historia, procesos de elaboración y maravíllate con el paisaje. Culmina con degustación de nuestros vinos, incluyendo un Lagariza, un Finca Millara y un Cuesta de los Olivos Godello.', '1h', 15.00, 'G71449832');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (5, 'Visita Vía Romana 5 Sentidos', 'Sumérgete en nuestra historia y tradición vitivinícola en una visita guiada por nuestras instalaciones, rodeadas de viñedos en las laderas del río Miño. Conoce nuestra bodega ubicada en una casa solariega del siglo XVI y aprende sobre nuestra pasión por el vino. Disfruta de una cata de tres de nuestros vinos más emblemáticos: un mencía, un godello y un sousón.', '1h10m', 18.00, 'F62711982');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (6, 'Visita Heroica', 'Recorre nuestros viñedos en las laderas del río Miño y descubre los secretos de la viticultura heroica en la D.O. Ribeira Sacra. Al finalizar el recorrido, disfruta de una degustación de 3 de nuestros vinos, dos mencía y un godello, incluyendo una selección de variedades típicas de la región.', '1h30m', 20.00, 'F62711982');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (7, 'Ruta en barco y visita a Viña Algueira', 'Embárcate en un impresionante viaje a bordo del barco Brandan, mientras navegas por el río Sil y te sumerges en la impresionante belleza de los viñedos. Profundiza en la rica historia y maravillas naturales de la zona con una visita guiada de una hora y media en Viña Algueira. Conoce nuestra pasión por la producción de vinos de primer nivel, especializados en variedades como Godello, Albariño, Treixadura, Mencía y más. Finaliza tu experiencia con una cata a bordo de nuestros vinos mientras disfrutas del paisaje único de la Ribeira Sacra.', '3h', 70.00, 'Z66723519');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (8, 'Visita a bodega y comida panorámica', 'Disfruta de una experiencia completa en Viña Algueira con nuestra visita a bodega seguida de una comida en nuestro restaurante. Durante la visita, recorre nuestras instalaciones, degusta nuestros vinos y aprende sobre viticultura y elaboraciones en un recorrido que incluye la cata de dos vinos: un blanco a base de treixadura y godello y un tinto mencía. Precio incluye comida en nuestro restaurante.', '3h30m', 50.00, 'Z66723519');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (9, 'El Alma de los Albariños en Pazo Baión', 'Descubre la magia de Pazo Baión a través de "El Alma de los Albariños", una experiencia de enoturismo que incluye un recorrido por nuestros viñedos y bodegas. Déjate sorprender por la belleza de nuestros paisajes y descubre los rincones más encantadores de la finca en una experiencia única en Galicia. Durante el recorrido, explorarás la parte histórica con visita a la vaquería y palomar, además de disfrutar de una cata comentada de cinco albariños D.O. Rías Baixas. Degustación acompañada de maridaje.', '2h', 50.00, 'L33754852');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (10, 'Vinos de Pago en Pazo Baión', 'Explora la excelencia de los vinos de Pago en Pazo Baión con esta experiencia única. Durante el recorrido por los viñedos y la bodega, también visitarás la parte histórica con una visita a la vaquería y palomar. Disfruta de una cata comentada de los exclusivos albariños de Pazo Baión. Degustación acompañada de maridaje.', '1h30m', 30.00, 'L33754852');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (11, 'Visita a Pazo Quinteiro da Cruz', 'Sumérgete en el encanto de Pazo Quinteiro da Cruz con nuestra visita guiada a nuestras bodegas. Descubre nuestros viñedos de albariño, rodeados de bosques, frutales y jardines con camelias que infunden notas afrutadas y florales a nuestros vinos. Disfruta de catas y degustaciones de nuestros caldos, incluyendo nuestra prestigiosa marca "Quinteiro da Cruz".', '1h30m', 25.00, 'D85997664');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (12, 'Visita el Jardín y Cata en Pazo Quinteiro da Cruz', 'Disfruta de una experiencia sensorial en Pazo Quinteiro da Cruz con nuestra visita guiada a los jardines. Sumérgete en un agradable paseo donde se combinan contenidos botánicos generales, curiosidades, historia y singularidad de los ejemplares. Podrás observar más de 500 especies diferentes de árboles y arbustos autóctonos y foráneos, así como una amplia variedad de camelias y una pequeña plantación de té. Después de la visita, tendrás la oportunidad de degustar los albariños de Quinteiro da Cruz.', '2h', 45.00, 'D85997664');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (13, 'ORIXE en Martin Codax', 'Descubre el origen de nuestros vinos D.O. Rías Baixas 100% albariño en una experiencia de enoturismo guiada por uno de nuestros expertos. Conoce los secretos de la elaboración de nuestros vinos mientras disfrutas de una cata maridaje comentada por nuestro sumiller. Degustarás 2 de nuestros vinos acompañados por 2 quesos gallegos de denominación de origen.', '55m', 20.00, 'T62887345');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (14, 'ONDAS DO MAR en Martin Codax', 'Embárcate en un recorrido por Bodegas Martín Códax y descubre nuestro origen y la elaboración de nuestros vinos D.O. Rías Baixas 100% albariño. En nuestra terraza, con vistas panorámicas de la Ría de Arousa, disfruta de una cata maridaje comentada por nuestro sumiller con 3 de nuestros vinos acompañados de 3 elaboraciones con conservas gourmet.', '1h10m', 25.00, 'T62887345');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (15, 'Visita a Ramón do Casar', 'Descubre la magia de Ramón do Casar, una bodega situada en una terraza a los pies del embalse de Castrelo de Miño, en Prado (Ourense). Admira las impresionantes vistas del valle mientras recorres nuestras instalaciones y aprendes sobre nuestro proceso de elaboración del vino. Especializados en las variedades Treixadura, Albariño y Godello, te ofrecemos una experiencia única enológica y paisajística con una cata de 5 vinos. ¡No te lo pierdas!', '2h', 25.00, 'D93118728');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (16, 'Picnic en viñedos de Priorato de Razamonde', 'Visita el Priorato de Razamonde, donde descubrirás la historia del Ribeiro y de nuestra bodega mientras recorres nuestros viñedos. Durante el recorrido de 2 horas, nuestro guía te llevará a través de todo el proceso de elaboración de nuestros vinos. Disfruta de una comida con vistas al río Miño y los viñedos, seguida de una degustación de dos de nuestros exquisitos vinos.', '2h', 30.00, 'C83512439');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (17, 'Paseo por los viñedos y cata en Adega Alan de Val', 'Únete a nosotros en una experiencia única en Alan de Val, donde te sumergirás en el apasionante mundo del vino. Durante la visita guiada, uno de los hermanos Sánchez Rodríguez te llevará a través del proceso de elaboración del vino, desde el despalillado hasta la fermentación en depósitos de acero y la sala de barricas. Además, daremos un paseo por los viñedos de la finca Pedrazais, de donde provienen nuestras uvas Godello y Mencía. Finalizaremos en nuestro salón o en la terraza, donde disfrutaremos de una cata de nuestros vinos Pedrazais, acompañados de un delicioso aperitivo.', '2h', 35.00, 'R29937181');
INSERT INTO actividades (id, nombre, descripcion, duracion, precio, cif_bodega) 
VALUES (18, 'Visita a bodega y viñedos en Adega Pinguela', 'Ven a descubrir la belleza y el encanto de Adega Pinguela, ubicada en el pintoresco lugar de Carballal, en Petín de Valdeorras. Disfruta de unas vistas privilegiadas del valle, con el embalse de San Martiño en el centro y rodeado de nuestros viñedos. Disfrutarás de una cata comentada de nuestros vinos y de un agradable paseo por los viñedos donde cultivamos nuestras uvas. Conoce nuestras variedades de vinos, incluyendo el Trebón, un tinto de finca elegante elaborado con castas nobles sousón y brancellao, y el Memoria de Ventura, un godello graso y fresco elaborado con uvas de nuestros viñedos en A Rúa y Petín.', '2h30m', 30.00, 'B618132993');


-- Drop tabla rutas_actividades si existe
-- DROP TABLE rutas_actividades;

--Creación tabla RUTAS_ACTIVIDADES
CREATE TABLE rutas_actividades (
    id_ruta      NUMBER(10),
    id_actividad NUMBER(10),
    orden        NUMBER(2),
    CONSTRAINT pk_rutas_act_id_ruta PRIMARY KEY ( id_ruta,
                                                  id_actividad,
                                                  orden ),
    CONSTRAINT fk_rutas_act_id_ruta FOREIGN KEY ( id_ruta )
        REFERENCES rutas ( id ),
    CONSTRAINT fk_rutas_act_id_actividad FOREIGN KEY ( id_actividad )
        REFERENCES actividades ( id )
);

-- Inserción de 25 filas en la tabla rutas_actividades

INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (1, 2, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (1, 3, 2);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (2, 1, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (3, 11, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (3, 10, 2);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (3, 13, 3);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (4, 12, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (4, 9, 2);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (5, 13, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (6, 4, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (6, 5, 2);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (6, 8, 3);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (7, 4, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (7, 6, 2);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (7, 7, 3);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (8, 5, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (8, 7, 2);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (9, 15, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (9, 16, 2);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (10, 15, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (10, 16, 2);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (11, 17, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (11, 18, 2);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (12, 15, 1);
INSERT INTO rutas_actividades (id_ruta, id_actividad, orden) 
VALUES (12, 16, 2);


-- Drop tabla VARIEDADES_UVA_BODEGAS si existe
-- DROP TABLE VARIEDADES_UVA_BODEGAS;

-- Creación tabla VARIEDADES_UVA_BODEGAS
CREATE TABLE variedades_uva_bodegas (
    cif_bodega VARCHAR2(10),
    variedad   VARCHAR2(20),
    CONSTRAINT pk_variedades_uva_bodegas PRIMARY KEY ( cif_bodega,
                                                        variedad ),
    CONSTRAINT fk_vari_uva_bodegas_cif FOREIGN KEY ( cif_bodega )
        REFERENCES bodegas ( cif )
);

-- Inserción de 48 filas en tabla VARIEDADES_UVA_BODEGAS
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('D45678901', 'sousón');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('D45678901', 'brancellao');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('D45678901', 'godello');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('D45678901', 'mencía');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('K78551945', 'godello');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('K78551945', 'treixadura');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('K78551945', 'mencía');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('K78551945', 'araúxa');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('K78551945', 'bastardo');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('L33754852', 'albariño');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('L33754852', 'treixadura');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('D85997664', 'albariño');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('G71449832', 'godello');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('G71449832', 'mencía');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('G71449832', 'sousón');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('G71449832', 'garnacha');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('G71449832', 'tempranillo');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('Z66723519', 'godello');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('Z66723519', 'albariño');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('Z66723519', 'treixadura');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('Z66723519', 'mencía');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('Z66723519', 'caiño');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('Z66723519', 'sousón');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('Z66723519', 'brancellao');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('Z66723519', 'merenzao');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('F62711982', 'mencía');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('F62711982', 'godello');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('F62711982', 'sousón');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('C83512439', 'mencía');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('C83512439', 'sousón');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('C83512439', 'treixadura');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('C83512439', 'godello');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('C83512439', 'loureira');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('C83512439', 'brancellao');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('D93118728', 'treixadura');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('D93118728', 'albariño');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('D93118728', 'godello');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('R29937181', 'mencía');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('R29937181', 'godello');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('R29937181', 'garnacha');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('R29937181', 'brancellao');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('R29937181', 'caiño');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('R29937181', 'sousón');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('B618132993', 'sousón');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('B618132993', 'brancellao');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('B618132993', 'godello');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('B618132993', 'mencía');
INSERT INTO variedades_uva_bodegas (cif_bodega, variedad) 
VALUES ('B618132993', 'garnacha');

-- Drop table si existe IDIOMAS_CHOFER
-- DROP TABLE idiomas_chofer;

--Creación tabla IDIOMAS_CHOFER
CREATE TABLE idiomas_chofer (
    id_chofer  NUMBER(10),
    nif_chofer VARCHAR2(20),
    idioma     VARCHAR2(10),
    CONSTRAINT pk_idiomas_chofer PRIMARY KEY ( id_chofer,
                                               nif_chofer,
                                               idioma ),
    CONSTRAINT fk_idiomas_chofer_choferes FOREIGN KEY ( id_chofer,
                                                        nif_chofer )
        REFERENCES chofers ( id,
                            nif )
);

-- inserciónón de 20 filas para la tabla IDIOMAS_CHOFER
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (1, '23870561J', 'español');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (1, '23870561J', 'inglés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (2, '54680923B', 'español');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (2, '54680923B', 'inglés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (2, '54680923B', 'francés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (3, '79014628N', 'español');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (3, '79014628N', 'inglés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (3, '79014628N', 'italiano');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (4, '42960817J', 'español');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (4, '42960817J', 'inglés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (5, '10372596Z', 'español');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (5, '10372596Z', 'inglés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (6, '25641803A', 'español');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (6, '25641803A', 'inglés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (6, '25641803A', 'francés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (7, '63792410G', 'español');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (7, '63792410G', 'inglés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (8, '87409351L', 'español');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (8, '87409351L', 'inglés');
INSERT INTO idiomas_chofer (id_chofer, nif_chofer, idioma) 
VALUES (8, '87409351L', 'italiano');


-- Drop table si existe CARNETS_CHOFER
-- DROP TABLE carnets_chofer;

--Creación tabla CARNETS_CHOFER
CREATE TABLE carnets_chofer (
    id_chofer  NUMBER(10),
    nif_chofer VARCHAR2(20),
    carnet     VARCHAR2(3),
    CONSTRAINT pk_carnets_chofer PRIMARY KEY ( id_chofer,
                                               nif_chofer,
                                               carnet ),
    CONSTRAINT fk_carnets_chofer_choferes FOREIGN KEY ( id_chofer,
                                                        nif_chofer )
        REFERENCES chofers ( id,
                            nif )
);

-- Inserciónón de 13 filas para la tabla CARNETS_CHOFER
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (1, '23870561J', 'B');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (2, '54680923B', 'B');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (2, '54680923B', 'D1');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (3, '79014628N', 'B');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (4, '42960817J', 'B');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (4, '42960817J', 'D1');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (5, '10372596Z', 'B');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (5, '10372596Z', 'D1');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (6, '25641803A', 'B');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (6, '25641803A', 'D');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (7, '63792410G', 'B');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (8, '87409351L', 'B');
INSERT INTO carnets_chofer (id_chofer, nif_chofer, carnet) 
VALUES (8, '87409351L', 'D1');

--Drop table si existe EMPRESAS_ALQUILER
-- DROP TABLE empresas_alquiler;

-- Creación de tabla EMPRESAS_ALQUILER
CREATE TABLE empresas_alquiler (
    cif       VARCHAR(10),
    nombre    VARCHAR2(50) NOT NULL,
    telefono  VARCHAR2(20) NOT NULL,
    email     VARCHAR2(255) NOT NULL,
    direccion VARCHAR2(200) NOT NULL,
    CONSTRAINT pk_empresas_alquiler PRIMARY KEY ( cif )
);

-- Inserción de 7 filas en la tabla EMPRESA_ALQUILER
INSERT INTO empresas_alquiler (cif, nombre, telefono, email, direccion) 
VALUES ('G31667181', 'Galirent', '981937010', 'info@galirent.com', 'Rúa do Valiño, 2, 15703 Santiago de Compostela, A Coruña');
INSERT INTO empresas_alquiler (cif, nombre, telefono, email, direccion) 
VALUES ('L92821103', 'Enterprise Pontevedra', '986842815', 'info@enterprise.com', 'Estacion De Tren Ave Calvo Sotelo S N, 36003 Pontevedra');
INSERT INTO empresas_alquiler (cif, nombre, telefono, email, direccion) 
VALUES ('C33718239', 'Blendio Rent Ourense', '988 715 890', 'info@blendio.com', 'RUA DE SEIXALVO, N 4, 32005 Ourense, Ourense');
INSERT INTO empresas_alquiler (cif, nombre, telefono, email, direccion) 
VALUES ('D13579240', 'Rapirent', '6982 066 671', 'info@rapirent.com', 'Rúa do Caneiro, 8, 27400 Monforte de Lemos, Lugo');
INSERT INTO empresas_alquiler (cif, nombre, telefono, email, direccion) 
VALUES ('E36925812', 'OneFurgo Pontevedra', '986 581 231', 'info@onefurgo.com', 'Frente Finca Batacos, A Carballeira, 14A, 36143 Salcedo, Pontevedra');
INSERT INTO empresas_alquiler (cif, nombre, telefono, email, direccion) 
VALUES ('F38655912', 'Enterprise Ourense', '988 375 884', 'info@enterprise.com', 'Estacion Tren Ourense, Rúa Eulogio Gómez Franqueira, 32001 Ourense');
INSERT INTO empresas_alquiler (cif, nombre, telefono, email, direccion) 
VALUES ('H33728341', 'Alquidobao', '988 556 878', 'info@alquidobao.com', 'Rúa de San Tirso, 3, 32300 O Barco, Ourense');

-- Drop table VEHICULOS si existe
-- DROP TABLE vehiculos;

-- Creación de tabla VEHICULOS
CREATE TABLE vehiculos (
    matricula            VARCHAR2(7),
    marca                VARCHAR2(20) NOT NULL,
    modelo               VARCHAR2(50) NOT NULL,
    precio               NUMBER(7, 2) NOT NULL,
    cif_empresa_alquiler VARCHAR2(10) NOT NULL,
    CONSTRAINT pk_vehiculo PRIMARY KEY ( matricula ),
    CONSTRAINT f_k_vehiculos_empres_alquiler FOREIGN KEY ( cif_empresa_alquiler )
        REFERENCES empresas_alquiler ( cif )
);

-- Inserción de 12 filas en la tabla VEHICULOS
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('RTD8874', 'Mercedes-Benz', 'Sprinter', 80.00, 'C33718239');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('NDS2341', 'Volkswagen', 'Transporter', 65.00, 'C33718239');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('JTR6312', 'Ford', 'Transit', 65.00, 'D13579240');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('MBS9655', 'Volkswagen', 'Transporter', 75.00, 'D13579240');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('FSL3434', 'Peugeot', 'Boxer', 50.00, 'E36925812');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('KVD6737', 'Volkswagen', 'Transporter', 65.00, 'E36925812');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('FFD5724', 'Fiat', 'Ducato', 60.00, 'F38655912');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('GND2451', 'Volkswagen', 'Transporter', 65.00, 'F38655912');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('NPC6544', 'Nissan', 'NV400', 65.00, 'G31667181');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('SRF5472', 'Volkswagen', 'Transporter', 70.00, 'G31667181');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('PDR3255', 'Volkswagen', 'Transporter', 70.00, 'L92821103');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('MGT2283', 'Ford', 'Tourneo', 65.00, 'L92821103');
INSERT INTO vehiculos (matricula, marca, modelo, precio, cif_empresa_alquiler)
VALUES ('FRT3255', 'Volkswagen', 'Transporter', 65.00, 'H33728341');

-- Drop table si existe ALQUILER_VEHICULOS
-- DROP TABLE alquiler_vehiculos;

-- Creación tabla ALQUILER_VEHICULOS
CREATE TABLE alquiler_vehiculos (
    matricula       VARCHAR2(7),
    id_coordinador  NUMBER(10),
    nif_coordinador VARCHAR2(20),
    fecha           DATE,
    km              NUMBER(4) DEFAULT NULL,
    coste           NUMBER(6, 2) DEFAULT NULL,
    id_reserva      NUMBER(10) NOT NULL,
    CONSTRAINT pk_alquiler_vehiculos PRIMARY KEY ( matricula,
                                                   id_coordinador,
                                                   nif_coordinador,
                                                   fecha ),
    CONSTRAINT fk_alquiler_vehiculos_matricula FOREIGN KEY ( matricula )
        REFERENCES vehiculos ( matricula ),
    CONSTRAINT fk_alquiler_vehiculos_coordinador FOREIGN KEY ( id_coordinador,
                                                               nif_coordinador )
        REFERENCES coordinadores ( id,
                                   nif ),
    CONSTRAINT fk_alquiler_vehiculos_reserva FOREIGN KEY ( id_reserva )
        REFERENCES reservas ( id )
);

-- Inserción de 18 filas para la tabla ALQUILER_VEHICULOS
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('FFD5724', 1, '58749612B', TO_DATE('15 / 12 / 2023', 'DD/MM/YYYY'), 160, 35.20, 1);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('RTD8874', 1, '58749612B', TO_DATE('11 / 01 / 2024', 'DD/MM/YYYY'), 170, 40, 2);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('FSL3434', 1, '58749612B', TO_DATE('22 / 03 / 2024', 'DD/MM/YYYY'), 75, 22, 3);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('MGT2283', 1, '58749612B', TO_DATE('11/02/2024', 'DD/MM/YYYY'), 85, 28.50, 4);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('MGT2283', 2, '84920563E', TO_DATE('13/12/2023', 'DD/MM/YYYY'), 70, 20.60, 5);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('NPC6544', 1, '58749612B', TO_DATE('22/01/2024', 'DD/MM/YYYY'), 86, 22.60, 6);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('JTR6312', 3, '50789634R', TO_DATE('08/03/2024', 'DD/MM/YYYY'), 230, 50.60, 7);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('MBS9655', 1, '58749612B', TO_DATE('06/12/2023', 'DD/MM/YYYY'), 190, 45.60, 8);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('RTD8874', 5, '71984623F', TO_DATE('10/01/2024', 'DD/MM/YYYY'), 65, 18.13, 9);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('GND2451', 4, '63095287P', TO_DATE('01/12/2023', 'DD/MM/YYYY'), 90, 19.80, 10);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('GND2451', 3, '50789634R', TO_DATE('02/02/2024', 'DD/MM/YYYY'), 125, 27.50, 11);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('FRT3255', 2, '84920563E', TO_DATE('01/02/2024', 'DD/MM/YYYY'), 65, 18.3, 12);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('FRT3255', 5, '71984623F', TO_DATE('16/03/2024', 'DD/MM/YYYY'), 70, 21.3, 13);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('FRT3255', 4, '63095287P', TO_DATE('02/03/2024', 'DD/MM/YYYY'), 55, 12.10, 14);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, id_reserva)
VALUES ('RTD8874', 1, '58749612B', TO_DATE('19/01/2024', 'DD/MM/YYYY'), 18);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, id_reserva)
VALUES ('PDR3255', 5, '71984623F', TO_DATE('10/01/2024', 'DD/MM/YYYY'), 19);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, id_reserva)
VALUES ('FRT3255', 4, '63095287P', TO_DATE('18/04/2024', 'DD/MM/YYYY'), 22);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, id_reserva)
VALUES ('KVD6737', 1, '58749612B', TO_DATE('22/02/2024', 'DD/MM/YYYY'), 25);
INSERT INTO alquiler_vehiculos (matricula, id_coordinador, nif_coordinador, fecha, km, coste, id_reserva)
VALUES ('NDS2341', 5, '71984623F', TO_DATE('18/04/2024', 'DD/MM/YYYY'), 23, 65, 23);
