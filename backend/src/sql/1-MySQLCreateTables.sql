-- noinspection SqlNoDataSourceInspectionForFile
DROP TABLE PlanHorarios;
DROP TABLE AsistenciaMecanico;
DROP TABLE Asistencia;
DROP TABLE EstadosAsistencias;
DROP TABLE TiposAsistencias;
DROP TABLE Horarios;
DROP TABLE Trabajo;
DROP TABLE Vehiculo;
DROP TABLE Flota;
DROP TABLE Modelo;
DROP TABLE Marca;
DROP TABLE Usuario;
DROP TABLE Documento;
DROP TABLE PuestoTaller;

CREATE TABLE Usuario(
    idUsuario BIGINT NOT NULL AUTO_INCREMENT,
    nombreUsuario VARCHAR(50),
    nombrePilaUsuario VARCHAR(50),
    apellidosUsuario VARCHAR(100),
    correoElectronicoUsuario VARCHAR(90) UNIQUE,
    contrasenaUsuario VARCHAR(100),
    lenguaje int,
    rolUsuarioSistema int,
    cuentaEliminada TINYINT,
    CONSTRAINT Usuario_pk PRIMARY KEY(idUsuario),
    CONSTRAINT Nombre_usuario_unique UNIQUE(nombreUsuario)
);

CREATE TABLE Marca(
  idMarca BIGINT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  CONSTRAINT Marca_pk PRIMARY KEY(idMarca)
);

CREATE TABLE Documento(
  idDocumento BIGINT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  localizacion VARCHAR(255),
  CONSTRAINT Documento_pk PRIMARY KEY(idDocumento)
);

CREATE TABLE Modelo(
   idModelo BIGINT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(255),
   descripcion VARCHAR(255),
   idMarca BIGINT,
   idDocumento BIGINT,
   CONSTRAINT Modelo_pk PRIMARY KEY(idModelo),
   CONSTRAINT Modelo_fk_marca FOREIGN KEY(idMarca) REFERENCES Marca(idMarca),
   CONSTRAINT Modelo_fk_doc FOREIGN KEY(idDocumento) REFERENCES Documento(idDocumento)
);

CREATE TABLE Flota(
  idFlota BIGINT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  CONSTRAINT Modelo_pk PRIMARY KEY(idFlota)
);

CREATE TABLE Vehiculo(
    idVehiculo BIGINT NOT NULL AUTO_INCREMENT,
    idUsuario BIGINT NOT NULL,
    numBastidor VARCHAR(255) NOT NULL,
    matricula VARCHAR(255) NOT NULL,
    idModelo BIGINT,
    idFlota BIGINT,
    CONSTRAINT Vehiculo_pk PRIMARY KEY(idVehiculo),
    CONSTRAINT usuario_fk FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario),
    CONSTRAINT modelo_fk FOREIGN KEY(idModelo) REFERENCES Modelo(idModelo),
    CONSTRAINT flota_fk FOREIGN KEY(idFlota) REFERENCES Flota(idFlota),
    CONSTRAINT matricula_unique UNIQUE(matricula),
    CONSTRAINT numBastidor_unique UNIQUE(numBastidor)
);

CREATE TABLE PuestoTaller(
    idPuesto BIGINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    CONSTRAINT PuestoTaller_pk PRIMARY KEY(idPuesto)
);

CREATE TABLE Horarios(
    idFranjaHoraria BIGINT NOT NULL AUTO_INCREMENT,
    franjaHoraria VARCHAR(255),
    CONSTRAINT pk_Horarios PRIMARY KEY(idFranjaHoraria)
);

CREATE TABLE TiposAsistencias(
     idTipo BIGINT NOT NULL AUTO_INCREMENT,
     nombre VARCHAR(255),
     descripcion VARCHAR(255),
     CONSTRAINT TiposAsistencias_pk PRIMARY KEY(idTipo)
);

CREATE TABLE EstadosAsistencias(
   idEstado BIGINT NOT NULL AUTO_INCREMENT,
   nombre VARCHAR(255),
   descripcion VARCHAR(255),
   CONSTRAINT EstadosAsistencias_pk PRIMARY KEY(idEstado)
);

CREATE TABLE Trabajo(
	idTrabajo BIGINT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255),
    idVehiculo BIGINT NOT NULL,
    CONSTRAINT Trabajo_pk PRIMARY KEY(idTrabajo),
    CONSTRAINT idVehiculo_fk FOREIGN KEY(idVehiculo) REFERENCES Vehiculo(idVehiculo)
);

CREATE TABLE Asistencia(
    idAsistencia BIGINT NOT NULL AUTO_INCREMENT,
    idTipo BIGINT NOT NULL,
    fecha DATETIME,
    idEstado BIGINT(255),
    idPuesto BIGINT,
    idTrabajo BIGINT,
    precio FLOAT,
    duracionEstimada BIGINT,
    peritaje INT,
    descripcion VARCHAR(500),
    CONSTRAINT asistencia_pk PRIMARY KEY(idAsistencia),
    CONSTRAINT tipoAsistencia_fk FOREIGN KEY(idTipo) REFERENCES TiposAsistencias(idTipo),
    CONSTRAINT idEstado_fk FOREIGN KEY(idEstado) REFERENCES EstadosAsistencias(idEstado),
    CONSTRAINT trabajo_fk FOREIGN KEY(idTrabajo) REFERENCES Trabajo(idTrabajo),
    CONSTRAINT idPuesto_fk FOREIGN KEY(idPuesto) REFERENCES PuestoTaller(idPuesto)
);

CREATE TABLE AsistenciaMecanico(
    idAsistencia BIGINT NOT NULL,
    idMecanico BIGINT NOT NULL,
    CONSTRAINT asistenciamecanico_pk PRIMARY KEY(idAsistencia, idMecanico),
    CONSTRAINT asistenciamecanico_idAsistencia_fk FOREIGN KEY(idAsistencia) REFERENCES Asistencia(idAsistencia),
    CONSTRAINT asistenciamecanico_idMecanico_fk FOREIGN KEY(idMecanico) REFERENCES Usuario(idUsuario)
);

CREATE TABLE PlanHorarios(
    idPlan BIGINT NOT NULL AUTO_INCREMENT,
    asistencia BIGINT NOT NULL,
    franjaHoraria BIGINT NOT NULL,
    CONSTRAINT PlanHorarios_pk PRIMARY KEY(idPlan),
    CONSTRAINT fk_asistencia FOREIGN KEY(asistencia) REFERENCES Asistencia(idAsistencia),
    CONSTRAINT fk_franjaHoraria FOREIGN KEY(franjaHoraria) REFERENCES Horarios(idFranjaHoraria)
);

