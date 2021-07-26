-- Table: Corridas
CREATE TABLE Corridas (
idCorrida INT NOT NULL,
cpfUsuarioCorr VARCHAR(11) NOT NULL,
codExpedienteCorr INT NOT NULL,
valorCorr FLOAT NOT NULL,
ptPartidaCorr VARCHAR(45) NOT NULL,
ptChegadaCorr VARCHAR(45) NOT NULL,
dtHrInicioCorr DATETIME NOT NULL,
dtHrFimCorr DATETIME NOT NULL,
tipoPagamentoCorr INT NOT NULL,
kmCorr FLOAT NOT NULL,
PRIMARY KEY (idCorrida),
CONSTRAINT fk_Corridas_Usuarios1
FOREIGN KEY (cpfUsuarioCorr) 
REFERENCES Usuarios (cpfUsuario) ON UPDATE CASCADE ON DELETE CASCADE
CONSTRAINT fk_Corridas_Expedientes1
FOREIGN KEY (codExpedienteCorr)
REFERENCES Expedientes (codExp) ON UPDATE CASCADE ON DELETE CASCADE);
INSERT INTO Corridas (idCorrida, cpfUsuarioCorr, codExpedienteCorr, valorCorr, ptPartidaCorr, ptChegadaCorr, dtHrInicioCorr, dtHrFimCorr, tipoPagamentoCorr, kmCorr) VALUES (69926992, '05660493416', 6319, 12.47, 'local11', 'local12', '2007-01-01 13:10:10', '2007-01-02 13:23:10', 0, 9.933);
INSERT INTO Corridas (idCorrida, cpfUsuarioCorr, codExpedienteCorr, valorCorr, ptPartidaCorr, ptChegadaCorr, dtHrInicioCorr, dtHrFimCorr, tipoPagamentoCorr, kmCorr) VALUES (44826992, '03702072462', 8766, 33.47, 'local21', 'local22', '2008-02-01 19:15:56', '2008-02-01 19:51:19', 1, 26.535);
INSERT INTO Corridas (idCorrida, cpfUsuarioCorr, codExpedienteCorr, valorCorr, ptPartidaCorr, ptChegadaCorr, dtHrInicioCorr, dtHrFimCorr, tipoPagamentoCorr, kmCorr) VALUES (81646992, '04114751424', 8160, 8.63, 'local31', 'local32', '2020-08-18 15:26:47', '2020-08-18 15:35:10', 3, 7.996);
INSERT INTO Corridas (idCorrida, cpfUsuarioCorr, codExpedienteCorr, valorCorr, ptPartidaCorr, ptChegadaCorr, dtHrInicioCorr, dtHrFimCorr, tipoPagamentoCorr, kmCorr) VALUES (61196992, '05380541402', 9745, 19.18, 'local41', 'local42', '2015-03-08 14:06:23', '2015-03-08 14:26:10', 2, 15.273);

-- Table: Expedientes
CREATE TABLE Expedientes (
codExp INT NOT NULL,
cpfMotoristaExp VARCHAR(11) NOT NULL,
placaVeiculoExp CHAR(7) NOT NULL,
dtHrInicioExp DATETIME NOT NULL,
dtHrFimExp DATETIME NOT NULL,
PRIMARY KEY (codExp),
CONSTRAINT fk_Expedientes_Motoristas
FOREIGN KEY (cpfMotoristaExp)
REFERENCES Motoristas (cpfMotorista) ON UPDATE CASCADE ON DELETE CASCADE
CONSTRAINT fk_Expedientes_Veiculos1
FOREIGN KEY (placaVeiculoExp)
REFERENCES Veiculos (placaVeiculo) ON UPDATE CASCADE ON DELETE CASCADE);
INSERT INTO Expedientes (codExp, cpfMotoristaExp, placaVeiculoExp, dtHrInicioExp, dtHrFimExp) VALUES (6319, '04227076439', 'ABC0120', '2020-10-02 10:42:22', '2020-10-02 23:50:02');
INSERT INTO Expedientes (codExp, cpfMotoristaExp, placaVeiculoExp, dtHrInicioExp, dtHrFimExp) VALUES (8766, '00763114499', 'DEF3451', '2020-10-02 16:04:41', '2020-10-03 06:52:02');
INSERT INTO Expedientes (codExp, cpfMotoristaExp, placaVeiculoExp, dtHrInicioExp, dtHrFimExp) VALUES (8160, '60703148400', 'GHI6782', '2020-10-02 01:16:52', '2020-10-02 16:12:02');
INSERT INTO Expedientes (codExp, cpfMotoristaExp, placaVeiculoExp, dtHrInicioExp, dtHrFimExp) VALUES (9745, '78656125400', 'JKL9103', '2020-10-02 10:23:12', '2020-10-03 20:04:02');

-- Table: Motoristas
CREATE TABLE Motoristas (
cpfMotorista VARCHAR(11) NOT NULL,
nomeMotorista VARCHAR(45) NOT NULL,
dtNascMotorista DATE NOT NULL,
cnhMotorista VARCHAR(11) NOT NULL,
contaBancMotorista VARCHAR(45) NOT NULL,
PRIMARY KEY (cpfMotorista));
INSERT INTO Motoristas (cpfMotorista, nomeMotorista, dtNascMotorista, cnhMotorista, contaBancMotorista) VALUES ('04227076439', 'Jose da Silva', '1978-02-21', '62592368402', 'B001Cc0204737-3Ag1709');
INSERT INTO Motoristas (cpfMotorista, nomeMotorista, dtNascMotorista, cnhMotorista, contaBancMotorista) VALUES ('00763114499', 'Fulana de Tal', '2000-08-27', '65080327094', 'B104Cc0287247-1Ag1569');
INSERT INTO Motoristas (cpfMotorista, nomeMotorista, dtNascMotorista, cnhMotorista, contaBancMotorista) VALUES ('60703148400', 'Ciclano de Oliveira', '1993-08-27', '18977547061', 'B341Cc1912323-5Ag0718');
INSERT INTO Motoristas (cpfMotorista, nomeMotorista, dtNascMotorista, cnhMotorista, contaBancMotorista) VALUES ('78656125400', 'Maria Conceiçao', '2002-01-27', '62746020584', 'B237Cc0157853-7Ag6933');

-- Table: Usuarios
CREATE TABLE Usuarios (
cpfUsuario VARCHAR(11) NOT NULL,
nomeUsuario VARCHAR(45) NOT NULL,
dtNascUsuario DATE NOT NULL,
telefoneUsuario VARCHAR(45) NOT NULL,
numCartaoCredUsuario VARCHAR(16) NULL,
PRIMARY KEY (cpfUsuario));
INSERT INTO Usuarios (cpfUsuario, nomeUsuario, dtNascUsuario, telefoneUsuario, numCartaoCredUsuario) VALUES ('05660493416', 'Benjamin Nicolas da Cunha', '1993-02-23', '(81) 98594-8991', '4532743906792613');
INSERT INTO Usuarios (cpfUsuario, nomeUsuario, dtNascUsuario, telefoneUsuario, numCartaoCredUsuario) VALUES ('03702072462', 'João Arthur da Rosa', '1973-12-02', '(61) 98814-8483', '4532668100981367');
INSERT INTO Usuarios (cpfUsuario, nomeUsuario, dtNascUsuario, telefoneUsuario, numCartaoCredUsuario) VALUES ('04114751424', 'Luna Mariane', '1991-06-01', '(65) 99206-6496', '4817598013071129');
INSERT INTO Usuarios (cpfUsuario, nomeUsuario, dtNascUsuario, telefoneUsuario, numCartaoCredUsuario) VALUES ('05380541402', 'Rafael Raimundo Carvalho', '2000-03-01', '(88) 98538-9542', '4929254747399759');

-- Table: Veiculos
CREATE TABLE Veiculos (
placaVeiculo CHAR(7) NOT NULL,
modeloVeiculo VARCHAR(45) NOT NULL,
fabricanteVeiculo VARCHAR(45) NOT NULL,
chassiVeiculo VARCHAR(45) NOT NULL,
anoFabVeiculo YEAR(4) NOT NULL,
lugaresVeiculo INT NOT NULL,
tipoVeiculo TINYINT NOT NULL,
PRIMARY KEY (placaVeiculo));
INSERT INTO Veiculos (placaVeiculo, modeloVeiculo, fabricanteVeiculo, chassiVeiculo, anoFabVeiculo, lugaresVeiculo, tipoVeiculo) VALUES ('ABC0120', 'Honda Civic', 'Honda', '9UK64ED50D0015277', 1973, 5, 1);
INSERT INTO Veiculos (placaVeiculo, modeloVeiculo, fabricanteVeiculo, chassiVeiculo, anoFabVeiculo, lugaresVeiculo, tipoVeiculo) VALUES ('DEF3451', 'Chevrolet Onix', 'Chevrolet', '9UK64ED50D0015280', 2013, 5, 0);
INSERT INTO Veiculos (placaVeiculo, modeloVeiculo, fabricanteVeiculo, chassiVeiculo, anoFabVeiculo, lugaresVeiculo, tipoVeiculo) VALUES ('GHI6782', 'Ford Ka', 'Ford', '9UK64ED50D0015313', 1994, 5, 0);
INSERT INTO Veiculos (placaVeiculo, modeloVeiculo, fabricanteVeiculo, chassiVeiculo, anoFabVeiculo, lugaresVeiculo, tipoVeiculo) VALUES ('JKL9103', 'Renault Kwid', 'Renault', '9UK64ED50D0015294', 2015, 5, 0);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
