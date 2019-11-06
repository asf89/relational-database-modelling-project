/* Lógico_2: */
drop database if exists odin;

create database odin;
use odin;

drop table if exists Jogador;
drop table if exists Personagem;
drop table if exists Raca;
drop table if exists Classe;
drop table if exists Habilidades;
drop table if exists Ataque;
drop table if exists E__Assoc__1_Aprende;
drop table if exists E__Assoc__2_Utiliza;

CREATE TABLE Jogador (
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(80) PRIMARY KEY NOT NULL,
    idade INT
);

CREATE TABLE Personagem (
    Nome VARCHAR(80),
    Nivel INTEGER,
    Idade INTEGER,
    Altura INTEGER,
    Iniciativa INTEGER,
    Velocidade INTEGER,
    Pontos_de_ataque INTEGER,
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_Jogador_email VARCHAR(80),
    fk_Raca_ID INTEGER,
    fk_Classe_ID INTEGER
);

CREATE TABLE Raca (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nomeRaca VARCHAR(80)
);

CREATE TABLE Classe (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nomeClasse VARCHAR(80)
);

CREATE TABLE Habilidade (
    tipoHabilidade VARCHAR(80),
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL
);

CREATE TABLE Ataque (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(80),
    dano INTEGER
);

CREATE TABLE E__Assoc__1_Aprende (
    valor INTEGER,
    modificador INTEGER,
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_Habilidade_ID INTEGER,
    fk_Personagem_ID INTEGER
);

CREATE TABLE E__Assoc__2_Utiliza (
    modificadorAtaque INTEGER,
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    fk_Ataque_ID INTEGER,
    fk_Personagem_ID INTEGER
);
 
ALTER TABLE Personagem ADD CONSTRAINT FK_Personagem_2
    FOREIGN KEY (fk_Jogador_email)
    REFERENCES Jogador (email)
    ON DELETE RESTRICT;
 
ALTER TABLE Personagem ADD CONSTRAINT FK_Personagem_3
    FOREIGN KEY (fk_Raca_ID)
    REFERENCES Raca (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Personagem ADD CONSTRAINT FK_Personagem_4
    FOREIGN KEY (fk_Classe_ID)
    REFERENCES Classe (ID)
    ON DELETE CASCADE;
 
ALTER TABLE E__Assoc__1_Aprende ADD CONSTRAINT FK_E__Assoc__1_Aprende_2
    FOREIGN KEY (fk_Habilidade_ID)
    REFERENCES Habilidade (ID);
 
ALTER TABLE E__Assoc__1_Aprende ADD CONSTRAINT FK_E__Assoc__1_Aprende_3
    FOREIGN KEY (fk_Personagem_ID)
    REFERENCES Personagem (ID);
 
ALTER TABLE E__Assoc__2_Utiliza ADD CONSTRAINT FK_E__Assoc__2_Utiliza_2
    FOREIGN KEY (fk_Ataque_ID)
    REFERENCES Ataque (ID);
 
ALTER TABLE E__Assoc__2_Utiliza ADD CONSTRAINT FK_E__Assoc__2_Utiliza_3
    FOREIGN KEY (fk_Personagem_ID)
    REFERENCES Personagem (ID);
