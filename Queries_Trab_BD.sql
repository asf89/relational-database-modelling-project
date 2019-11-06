USE odin;

SELECT * FROM Personagem;
SELECT * FROM Jogador;
SELECT * FROM Habilidade;
SELECT * FROM Classe;
SELECT * FROM Ataque;
SELECT * FROM Raca;
SELECT * FROM E__Assoc__1_Aprende;
SELECT * FROM E__Assoc__2_Utiliza;

# query 1: uso de BETWEEN
SELECT Nome, Nivel FROM Personagem WHERE Altura BETWEEN 50 AND 200;

# query 2: uso de LIKE/NOT LIKE com tokens (% ou _)
SELECT Nome, Nivel, Idade, Altura FROM Personagem WHERE Nome LIKE '%s';
SELECT Nome, Nivel, Idade, Altura FROM Personagem WHERE Nome NOT LIKE 'F__%';

# query 3: uso de IN com subconsulta
SELECT Nome, Nivel, Idade, Velocidade FROM Personagem WHERE Velocidade IN (SELECT Pontos_de_Ataque FROM Personagem WHERE Iniciativa BETWEEN 2 AND 6);

# query 4: uso de IS NULL/IS NOT NULL
SELECT nome FROM Jogador WHERE email IS NULL; 
SELECT nome FROM Jogador WHERE email IS NOT NULL;

# query 5: uso de ORDER BY
SELECT Nome, Nivel FROM Personagem WHERE Idade > 50 ORDER BY Velocidade;

#query 14: uso de INNER JOIN


-- ALTERS -- 

SELECT * FROM Personagem;

ALTER TABLE Personagem ADD Manna INT;

ALTER TABLE Personagem MODIFY COLUMN Manna VARCHAR(30);
describe Personagem;

ALTER TABLE Personagem DROP Manna;

-- Aritimetica no select 
select Iniciativa + Velocidade AS Perigo from Personagem;


show tables; 

-- GROUP BY
select count(Nome), Pontos_de_ataque from Personagem group by Pontos_de_ataque HAVING(Pontos_de_ataque) > 7;



-- DISTINCT
select distinct Nome from Personagem;

-- Juncao 
select p.Nome, r.NomeRaca from Personagem p, Raca r join Raca;


create view Name_with_race as select Nome, Nivel from Personagem where nivel > 10;

select * from Name_with_race;
