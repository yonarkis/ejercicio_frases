-- CREATE DATABASE IF NOT EXISTS reservas;

-- USE reservas;

-- CREATE TABLE empresas(
--     idEmpresa INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     nombreEmpresa VARCHAR(180),
--     direccionEmpresa VARCHAR(255),
--     rucEmpresa VARCHAR(200),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE dispositivos(
--     idDispositivo INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idEmpresa INT(11) ,
--     idLocal INT(11),
--     nombreDispositivo VARCHAR(200),
--     caracteristicasDispositivo VARCHAR(255),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- CREATE TABLE locals(
--     idLocal INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idEmpresa INT(11) ,
--     nombreLocal VARCHAR(200),
--     direccionLocal VARCHAR(200),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- CREATE TABLE estacionamientos(
--     idEstacionamiento INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idEmpresa INT(11),
--     idLocal INT(11) ,
--     nombreEstacionamiento VARCHAR(200),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE,
--     FOREIGN KEY (idLocal) REFERENCES locals(idLocal) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- CREATE TABLE organizacions(
--     idOrganizacion INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idEmpresa INT(11),
--     idLocal INT(11) ,
--     descripcionOrganizacion VARCHAR(200),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- CREATE TABLE usuarios(
--     idUsuario INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idEmpresa INT(11),
--     idLocal INT(11),
--     idArea INT(11),
--     idOrganizacion INT(11),
--     nombreUsuario VARCHAR(200),
--     correoUsuario VARCHAR(200),
--     password VARCHAR(200),
--     tipoDocumentoUsuario VARCHAR(200),
--     numeroDocumentoUsuario VARCHAR(200),
--     tipoUsuario VARCHAR(200),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE,
-- 	   FOREIGN KEY (idLocal) REFERENCES locals(idLocal) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- CREATE TABLE areas(
--     idArea INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idLocal INT(11),
--     nombreArea VARCHAR(200),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
--     FOREIGN KEY (idLocal) REFERENCES locals(idLocal) ON UPDATE CASCADE ON DELETE CASCADE

-- );

-- CREATE TABLE salas(
--     idSala INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- 	   idEmpresa INT(11),
--     idLocal INT(11),
--     nombreSala VARCHAR(200),
--     capacidadSala VARCHAR(200),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE,
-- 	   FOREIGN KEY (idLocal) REFERENCES locals(idLocal) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- CREATE TABLE agendas(
--     idAgenda INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idEmpresa INT(11),
--     idLocal INT(11),
--     idArea INT(11),
--     idUsuarioOrganizador INT(11),
--     asuntoAgenda VARCHAR(200),
--     idSala INT(11),
--     fechaInicio DATE NOT NULL,
--     fechaFin DATE,
--     horaInicio TIME NOT NULL,
--     horaFin TIME,
--     descripcionAgenda VARCHAR(200),
--     estadoAgenda VARCHAR(200),
--     fechaProgramacion DATE,
--     horaProgramacion TIME,
--     fechaReprogramacion DATE,
--     horaReprogramacion TIME,
--     fechaCancelacion DATE,
--     horaCancelacion TIME,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE,
-- 	FOREIGN KEY (idLocal) REFERENCES locals(idLocal) ON UPDATE CASCADE ON DELETE CASCADE,
--     FOREIGN KEY (idUsuarioOrganizador) REFERENCES usuarios(idUsuario) ON UPDATE CASCADE ON DELETE CASCADE,
--     FOREIGN KEY (idSala) REFERENCES salas(idSala) ON UPDATE CASCADE ON DELETE CASCADE
-- );

--  CREATE TABLE invitadoAgendas(
-- 	 id INT (11) NOT NULL auto_increment primary key,
--      idAgenda INT(11) NOT NULL,
--      idEmpresa INT(11) NOT NULL,
--      idUsuarioOrganizador INT(11) NOT NULL,
--      correoInvitado VARCHAR(200),
--      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
--      FOREIGN KEY (idAgenda) REFERENCES agendas(idAgenda) ON UPDATE CASCADE ON DELETE CASCADE,
--      FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE,
--      FOREIGN KEY (idUsuarioOrganizador) REFERENCES usuarios(idUsuario) ON UPDATE CASCADE ON DELETE CASCADE

--  );

-- CREATE TABLE proveedores(
--     idProveedor INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idEmpresa INT(11),
--     idArea INT(11),
--     nombreProveedor VARCHAR(180),
--     direccionProveedor VARCHAR(255),
--     rucProveedor VARCHAR(200),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE,
--     FOREIGN KEY (idArea) REFERENCES areas(idArea) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- CREATE TABLE areaAgendas(
--     id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idEmpresa INT(11),
--     idLocal INT(11),
--     idArea INT(11),
--     idProveedor INT(11),
--     idUsuarioOrganizador INT(11),
--     asuntoAreaAgenda VARCHAR(200),
--     fechaInicio DATE NOT NULL,
--     fechaFin DATE,
--     descripcionAreaAgenda VARCHAR(200),
--     estado VARCHAR(200),
--     invitadosArea JSON
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa) ON UPDATE CASCADE ON DELETE CASCADE,
-- 	FOREIGN KEY (idLocal) REFERENCES locals(idLocal) ON UPDATE CASCADE ON DELETE CASCADE,
--     FOREIGN KEY (idArea) REFERENCES areas(idArea) ON UPDATE CASCADE ON DELETE CASCADE,
--     FOREIGN KEY (idUsuarioOrganizador) REFERENCES usuarios(idUsuario) ON UPDATE CASCADE ON DELETE CASCADE,
--     FOREIGN KEY (idProveedor) REFERENCES proveedores(idProveedor) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- CREATE TABLE usuarioProveedor(
--     idUsuarioProveedor INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     idProveedor INT(11),
--     nombre VARCHAR(200),
--     apellido VARCHAR(200),
--     correoUsuarioProveedor VARCHAR(200),
--     tipoDocumentoUsuarioProveedor VARCHAR(200),
--     numeroDocumentoUsuarioProveedor INT(11),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (idProveedor) REFERENCES proveedores(idProveedor) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- CREATE TABLE tipoUsuario(
--     idTipoUsuario INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     descripcion VARCHAR(200),
--     created_at timestamp default current_timestamp
-- );

-- CREATE TABLE personas(
--     idPersona INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     nombre VARCHAR(200),
--     apellido VARCHAR(200),
--     correoElectronico VARCHAR(200),
--     tipoDocumento VARCHAR(200),
--     numeroDocumento VARCHAR(200),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );