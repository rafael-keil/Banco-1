DROP TABLE statusChamado;
DROP TABLE chamado;
DROP TABLE servicoOferecido;
DROP TABLE areaDestino;
DROP TABLE usuario;


CREATE TABLE perfil(
	idPerfil INT NOT NULL PRIMARY KEY,
	nomePerfil VARCHAR(255) NOT NULL
);

CREATE TABLE permissao(
	idpermissao INT NOT NULL PRIMARY KEY,
	nomePermissao VARCHAR(255) NOT NULL
);

CREATE TABLE permissaoPerfil(
	idPermissao INT NOT NULL,
	idPerfil INT NOT NULL,
	FOREIGN KEY (idPermissao) REFERENCES permissao (idPermissao),
	FOREIGN KEY (idPerfil) REFERENCES perfil (idPerfil)
);

CREATE TABLE Usuario (
   IdUsuario INT NOT NULL PRIMARY KEY,
   Nome VARCHAR(255) NOT NULL,
   Email VARCHAR(255) NOT NULL,
   Senha VARCHAR(255) NOT NULL,
   DataNascimento TIMESTAMP NOT NULL,
   Ativo BOOL NOT NULL,
   IdPerfil INT NOT NULL,
   FOREIGN KEY (IdPerfil) REFERENCES Perfil (IdPerfil)
);

CREATE TABLE areaDestino(
	idAreaDestino INT NOT NULL PRIMARY KEY,
	nomeAreaDestino VARCHAR(255) NOT NULL
);

CREATE TABLE servicoOferecido(
	idServicoOferecido INT NOT NULL PRIMARY KEY,
	descricaoServico VARCHAR(1000) NOT NULL,
	idAreaDestino INT NOT NULL,
	FOREIGN KEY (idAreaDestino) REFERENCES areaDestino (idAreaDestino)
);

CREATE TABLE Chamado ( 
   IdChamado INT NOT NULL PRIMARY KEY, 
   Descricao VARCHAR(500) NOT NULL, 
   DataPrevista TIMESTAMP NOT NULL,
   IdServico INT NOT NULL,
   IdPerfil INT NOT NULL, 
   IdUsuarioResponsavel INT NOT NULL, 
   MensagemResponsavel  VARCHAR(500) NOT NULL,
   FOREIGN KEY (IdPerfil) REFERENCES Perfil (IdPerfil),
   FOREIGN KEY (IdServico) REFERENCES Servico (IdServico),
   FOREIGN KEY (IdUsuarioResponsavel) REFERENCES Usuario (IdUsuario)
);

CREATE TABLE statusChamado(
	idStatusChamado INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	status CHAR NOT NULL,
	horarioInicio TIMESTAMP NOT NULL,
	horarioTermino TIMESTAMP,
	idChamado INT NOT NUll,
	FOREIGN KEY (idChamado) REFERENCES chamado (idChamado)
);