CREATE TABLE aluno (
    id_aluno serial, --Essa será a chave primária/principal da tabela 
    --Serial é para sequencial
    nome_aluno VARCHAR(100), --Capacidade de 100 caracteres no nome do aluno
    email_aluno VARCHAR(100), --Capacidade de 100 caracteres no email do aluno
)

CREATE TABLE avaliacao_aluno (
    id_avaliacao int, --Essa será a chave primária/principal
    id_aluno int, --Variável que vai ser puxada 
    conteudo_avaliacao_aluno VARCHAR(100), --Capacidade de 100 carcteres no conteúdo da avaliação
    data_de_inicio DATETIME, --O "DATETIME" serve para dizer que tem uma data
    data_de_fim DATETIME, --O "DATETIME" serve para dizer que tem uma data
)

CREATE TABLE avaliacao (
    id_avaliacao int, --Variável que vai ser puxada
    ds_avaliacao VARCHAR(100), --Capacidade de 100 caracteres no ds_avaliacao
    data_da_abertura_da_prova DATETIME, --O "DATETIME" serve para dizer que tem uma data
    data_do_fechamento_da_prova DATETIME, --O "DATETIME" serve para dizer que tem uma data
)

CREATE TABLE questao (
    id_questao int, --Essa será a chave primária/principal
    id_avaliacao int, --Variável que vai ser puxada
    carcter_questao VARCHAR(MAX), --Máximo de caracteres 4000 (quatro mil)
    tp_questao int,
)

CREATE TABLE reposta_aberta (
    id_avaliacao int, --Variável que vai ser puxada
    id_aluno int, --Variável que vai ser puxada
    id_questao int, --Variável que vai ser puxada
    ds_resposta_aberta VARCHAR(MAX),
    data_da_reposta DATETIME,
)

/* Comando */
ALTER TABLE aluno add constraint pk_aluno PRIMARY KEY (id_aluno)
/* Comando */
ALTER TABLE avaliacao_aluno add constraint fk_avaliacao_aluno FOREIGN KEY (id_aluno) REFERENCES aluno (id_aluno)
/* Comando */
ALTER TABLE avaliacao add constraint fk_avaliacao__avaliacao_aluno FOREIGN KEY (id_avaliacao) REFERENCES avaliacao_aluno (id_avaliacao)
/* Comando */
ALTER TABLE questao add constraint pk_id_questao PRIMARY KEY (id_questao)
/* Comando */
ALTER TABLE questao add constraint fk_id_avaliacao FOREIGN KEY (id_avaliacao) REFERENCES (id_avaliacao)
/* Comando */
ALTER TABLE resposta_aberta add constraint fk_questao__resposta_aberta FOREIGN KEY (id_avaliacao, id_aluno) REFERENCES (id_avaliacao, id_aluno)
/* Comando */
ALTER TABLE resposta_aberta add constraint fk_questao__aberta FOREIGN KEY (id_questao)  