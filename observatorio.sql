DROP TABLE IF EXISTS records CASCADE;
DROP TABLE IF EXISTS zones CASCADE;
DROP TABLE IF EXISTS indicators CASCADE;
DROP TABLE IF EXISTS categories CASCADE;

CREATE TABLE categories
(
	id int not null primary key auto_increment,
	name character varying (255) not null
);

INSERT INTO categories (name) VALUES ('Salud');
INSERT INTO categories (name) VALUES ('Educación');
INSERT INTO categories (name) VALUES ('Transporte');

CREATE TABLE indicators
(
	id int not null primary key auto_increment,
	name character varying (255) not null,
	value float not null,
	category_id integer not null,
	
	foreign key (category_id) references categories (id)
);

CREATE TABLE zones
(
	id int not null primary key auto_increment,
	name character varying (255) not null,
	lft int not null,
	rgt int not null,
	parent int not null
);

INSERT INTO zones (name, lft, rgt, parent) VALUES
	('Chile', 1, 32, 0),
	('Región de Tarapacá', 2, 3, 1),
	('Región de Antofagasta', 4, 5, 1),
	('Región de Atacama', 6, 7, 1),
	('Región de Coquimbo', 8, 9, 1),
	('Región de Valparaíso', 10, 11, 1),
	('Región del Libertador General Bernardo O Higgins', 12, 13, 1),
	('Región del Maule', 14, 15, 1),
	('Región del Bío-Bío', 16, 17, 1),
	('Región de la Araucanía', 18, 19, 1),
	('Región de Los Lagos', 20, 21, 1),
	('Región de Aysén del General Carlos Ibáñez del Campo', 22, 23, 1),
	('Región de Magallanes y la Antártica Chilena', 24, 25, 1),
	('Región Metropolitana de Santiago', 26, 140, 1),
	('Región de Los Ríos', 141, 142, 1),
	('Región de Arica-Parinacota', 143, 144, 1),
	('ALHUE', 32, 33, 14),       
	('ÑUÑOA', 34, 35, 14),       
	('BUIN', 36, 37, 14),        
	('CALERA DE TANGO', 38, 39, 14),               
	('CERRILLOS', 40, 41, 14),   
	('CERRO NAVIA', 42, 43, 14), 
	('COLINA', 44, 45, 14),        
	('CONCHALI', 46, 47, 14),      
	('CURACAVI', 48, 49, 14),     
	('EL BOSQUE', 50, 51, 14),   
	('EL MONTE', 52, 53, 14),    
	('ESTACION CENTRAL', 54, 55, 14),              
	('HUECHURABA', 56, 57, 14),  
	('INDEPENDENCIA', 58, 59, 14),                 
	('ISLA DE MAIPO', 60, 61, 14),                 
	('LA CISTERNA', 62, 63, 14), 
	('LA FLORIDA', 64, 65, 14),  
	('LA GRANJA', 66, 67, 14),   
	('LA PINTANA', 68, 69, 14),  
	('LA REINA', 70, 71, 14),    
	('LAMPA', 72, 73, 14),         
	('LAS CONDES', 74, 75, 14),    
	('LO BARNECHEA', 76, 77, 14),
	('LO ESPEJO', 78, 79, 14),   
	('LO PRADO', 80, 81, 14),    
	('MACUL', 82, 83, 14),       
	('MAIPU', 84, 85, 14),       
	('MARIA PINTO', 86, 87, 14), 
	('MELIPILLA', 88, 89, 14),   
	('PADRE HURTADO', 90, 91, 14),                 
	('PAINE', 92, 93, 14),       
	('PEÑAFLOR', 94, 95, 14),    
	('PEÑALOLEN', 96, 97, 14),   
	('PEDRO AGUIRRE CERDA', 98, 99, 14),           
	('PIRQUE', 100, 101, 14),      
	('PROVIDENCIA', 102, 103, 14),   
	('PUDAHUEL', 104, 105, 14),      
	('PUENTE ALTO', 106, 107, 14), 
	('QUILICURA', 108, 109, 14),     
	('QUINTA NORMAL', 110, 111, 14), 
	('RECOLETA', 112, 113, 14),    
	('RENCA', 114, 115, 14),         
	('SAN BERNARDO', 116, 117, 14),
	('SAN JOAQUIN', 118, 119, 14), 
	('SAN JOSE DE MAIPO', 120, 121, 14),
	('SAN MIGUEL', 122, 123, 14),  
	('SAN PEDRO', 124, 125, 14),   
	('SAN RAMON', 126, 127, 14),   
	('SANTIAGO CENTRO', 128, 129, 14),                 
	('SANTIAGO OESTE', 130, 131, 14),
	('SANTIAGO SUR', 132, 133, 14),
	('TALAGANTE', 134, 135, 14),
	('TIL-TIL', 136, 137, 14),       
	('VITACURA', 138, 139, 14);

CREATE TABLE records
(
	id int not null primary key auto_increment,
	indicator_id int not null,
	zone_id int not null,
	value float not null,
	created_at timestamp not null default now(),
	
	foreign key (indicator_id) references indicators (id),
	foreign key (zone_id) references zones (id)
);

