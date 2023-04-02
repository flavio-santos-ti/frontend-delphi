/*
***************************************************************
*
*  Data: 02/04/2023
*  Auto: Flávio dos Santos
*  Objetivo: Script para a criação de banco de dados de testes
*
***************************************************************
*/

CREATE DATABASE delphi
TEMPLATE=template0
LC_CTYPE="pt_BR.UTF-8"
LC_COLLATE="pt_BR.UTF-8";

-- Pessoa

CREATE TABLE IF NOT EXISTS public.pessoa 
(
	id BIGSERIAL NOT NULL,
	nome CHARACTER VARYING(30) NOT NULL,
	sobrenome CHARACTER VARYING(40),
	cep CHARACTER VARYING(9),
	logradouro CHARACTER VARYING(40) NOT NULL,
	numero CHARACTER VARYING(15) NOT NULL,
	complemento CHARACTER VARYING(30),
	bairro CHARACTER VARYING(40) NOT NULL,
	municipio CHARACTER VARYING(40) NOT NULL,
	uf CHAR(2) NOT NULL,
	dt_inclusao TIMESTAMP NOT NULL,
	dt_alteracao TIMESTAMP NOT NULL,
	CONSTRAINT pk_pessoa PRIMARY KEY(id)
);
