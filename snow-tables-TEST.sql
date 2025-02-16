create database snow;
use snow;
drop database snow;


CREATE TABLE marital_status (
    id_marital_status INT AUTO_INCREMENT PRIMARY KEY,
    description_marital_status VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE birthplace (
    id_birthplace INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255) NOT NULL,
    CONSTRAINT unique_birthplace UNIQUE (city, state, country)
);

CREATE TABLE gender (
    id_gender INT AUTO_INCREMENT PRIMARY KEY,
    description_gender VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE DatosCliente (
    ID_Cliente INT PRIMARY KEY,
    NumeroPasaporte VARCHAR(50),
    CorreoElectronico VARCHAR(255),
    HaveYouEverUsedOtherNames BOOLEAN NOT NULL,
    OtraNacionalidad VARCHAR(255),
    US_SocialSecurityNumber VARCHAR(50),
    TaxpayerID VARCHAR(50),
    TipoVisa VARCHAR(50),
    FotoPasaporte BLOB,
    Memo TEXT,
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Viaje (
    ID_Viaje INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    FechaLlegada DATE NOT NULL,
    CiudadLlegada VARCHAR(255) NOT NULL,
    FechaSalida DATE NOT NULL,
    CiudadSalida VARCHAR(255) NOT NULL,
    QuienPagaViaje VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE LugaresVisitar (
    ID_Lugar INT AUTO_INCREMENT PRIMARY KEY,
    ID_Viaje INT,
    Lugar VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Viaje) REFERENCES Viaje(ID_Viaje) ON DELETE CASCADE
);

CREATE TABLE LugarEstancia (
    ID_Estancia INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Calle VARCHAR(255) NOT NULL,
    Ciudad VARCHAR(255) NOT NULL,
    Estado VARCHAR(255) NOT NULL,
    ZIP VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE Acompanantes (
    ID_Acompanante INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Relacion VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE ViajesPreviosUSA (
    ID_ViajePrevio INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    HaEstadoEnUSA BOOLEAN,
    HaTenidoVisaUSA BOOLEAN,
    HaSidoRechazadaVisa BOOLEAN,
    SeHaArchivadoPeticion BOOLEAN,
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE DireccionCliente (
    ID_Direccion INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Calle VARCHAR(255) NOT NULL,
    Ciudad VARCHAR(255) NOT NULL,
    Estado VARCHAR(255) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL,
    Pais VARCHAR(255) NOT NULL,
    NumeroPrimario VARCHAR(20),
    NumeroSecundario VARCHAR(20),
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE RedesSociales (
    ID_RedSocial INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    RedSocial VARCHAR(255),
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE ContactoUSA (
    ID_Contacto INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Relacion VARCHAR(255) NOT NULL,
    Calle VARCHAR(255) NOT NULL,
    Ciudad VARCHAR(255) NOT NULL,
    Estado VARCHAR(255) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(255),
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE Familiares (
    ID_Familiar INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    ViveEnUSA BOOLEAN NOT NULL,
    Relacion VARCHAR(255) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE Educacion (
    ID_Educacion INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    NombreInstitucion VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255),
    Ciudad VARCHAR(255),
    Estado VARCHAR(255),
    ZipCode VARCHAR(20),
    Pais VARCHAR(255),
    CursoEstudio VARCHAR(255),
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE DS160 (
    ID_DS160 INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    AplicacionID VARCHAR(255) NOT NULL,
    LugarAplicacion VARCHAR(255) NOT NULL,
    FechaAplicacion DATE NOT NULL,
    NombreAbuelaMaterna VARCHAR(255),
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE AIS (
    ID_AIS INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    NumeroDS160 VARCHAR(255) NOT NULL,
    FechaCAS DATE NOT NULL,
    FechaConsulado DATE NOT NULL,
    FechaPago DATE NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE Costos (
    ID_Costo INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Anticipo DECIMAL(10,2) NOT NULL,
    CostoTotal DECIMAL(10,2) NOT NULL,
    Memo TEXT,
    FOREIGN KEY (ID_Cliente) REFERENCES Persona(ID_Cliente) ON DELETE CASCADE
);
