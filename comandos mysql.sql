-- 1. Construindo uma base de dados:
create database supermercado;

-- 2. Construindo tabelas para base de dados:
create table fornecedores(
cod_fornec smallint primary key,
nome_fornec varchar(50));

create table produtos (
id_prod smallint primary key,
nome_prod varchar (50) not null,
quant_prod smallint not null, 
preço_prod decimal(10,2),
cod_fornec smallint,
constraint fk_cod_fornec foreign key (cod_fornec)
references fornecedores(cod_fornec));

-- 3. Inserindo dados nas tabelas:
insert into fornecedores (cod_fornec, nome_fornec)
values(1, "ACME");

insert into produtos
values (100, "Monitor de LCD", 12, 550.50, 1),
(101, "Roteador banda larga", 8, 130.00, 1 ),
(103, "Pendrive 64GB", 22, 48.00, 1),
(104, "webcam", 6, 170.00, 1);

-- Este foi um produto que eu adicionei a mais para servir de exemplo de como o comando "ORDER BY" funciona Não se preocupe com isso ainda. 
insert into produtos
values(105, "teclado", 32, 40.00, 1);


-- 4. Efetuar consultas trazendo colunas específicas:
select nome_fornec from fornecedores; 
select nome_prod, preço_prod from produtos;
select * from produtos;

-- 5. Consultando uma tabela com filtros de dados específicos:
select nome_prod from produtos
where id_prod = 101;
select nome_prod from produtos
where quant_prod = 22;

-- 6. Alterar um registro na tabela: UPDATE /// OBS: NUNCA ESQUECER DE COLOCAR A CLAUSULA "WHERE", pois uma vez dada o update sem o where, sera alterado todos os registros da tabela...
update produtos
set preço_prod = 630.00
where id_prod = 100;
update produtos
set quant_prod = 25
where id_prod = 103;

-- 7. Excliur registros de uma tabela: DELETE FROM
delete from produtos
where id_prod = 101;
select nome_prod from produtos
where id_prod = 101;

-- 8 Trazer dados de duas tabelas ou mais relacionadas:
select nome_prod, nome_fornec 
from fornecedores
inner join produtos
on fornecedores.cod_fornec = produtos.cod_fornec;

-- 9. Retornar resultados ordenados em uma consulta: 
select nome_prod, preço_prod
from produtos
order by nome_prod;

-- 10. Apagar todos os dados de uma tabela. Muito cuidado com esse comando KKKKKKK. 
truncate table produtos;
