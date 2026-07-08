DROP TABLE IF EXISTS historico_movimentacao CASCADE;
DROP TABLE IF EXISTS movimentacao CASCADE;
DROP TABLE IF EXISTS lote_insumo CASCADE;
DROP TABLE IF EXISTS fertilizante CASCADE;
DROP TABLE IF EXISTS contra_pragas CASCADE;
DROP TABLE IF EXISTS insumo CASCADE;
DROP TABLE IF EXISTS lote CASCADE;
DROP TABLE IF EXISTS produto CASCADE;
DROP TABLE IF EXISTS comprador CASCADE;
DROP TABLE IF EXISTS trabalhador CASCADE;
DROP TABLE IF EXISTS pessoa_juridica CASCADE;
DROP TABLE IF EXISTS pessoa_fisica CASCADE;
DROP TABLE IF EXISTS telefone_usuario CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;


CREATE TABLE usuario(
    id SERIAL,
    prenome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(30) NOT NULL CHECK(tipo_usuario IN ('comum','premium')),

    PRIMARY KEY(id)
);

CREATE TABLE telefone_usuario(
    id_usuario INT,
    telefone VARCHAR(20) NOT NULL,

    PRIMARY KEY(id_usuario, telefone),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE pessoa_fisica(
    id_usuario INT,
    cpf VARCHAR(14) UNIQUE NOT NULL,

    PRIMARY KEY(id_usuario),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE pessoa_juridica(
    id_usuario INT,
    cnpj VARCHAR(18) UNIQUE NOT NULL,

    PRIMARY KEY(id_usuario),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id) ON DELETE CASCADE
);


CREATE TABLE trabalhador(
    id_usuario INT,
    nit VARCHAR(20) UNIQUE NOT NULL,

    PRIMARY KEY(id_usuario),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE produto(
    id SERIAL,
    nome VARCHAR(100) NOT NULL,
    variedade VARCHAR(100),
    data_cadastro DATE DEFAULT CURRENT_DATE,
    ultima_atualizacao DATE DEFAULT CURRENT_DATE,
    id_usuario INT NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);

CREATE TABLE lote(
    id_produto INT,
    numero_lote INT NOT NULL CHECK(numero_lote > 0),
    total_produzido NUMERIC(10,2) CHECK(total_produzido > 0),
    data_expedicao DATE,
    id_usuario INT NOT NULL,

    PRIMARY KEY(id_produto, numero_lote),
    FOREIGN KEY(id_produto) REFERENCES produto(id),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);

CREATE TABLE insumo(
    id SERIAL,

    PRIMARY KEY(id)
);


CREATE TABLE fertilizante(
    id_insumo INT NOT NULL,

    PRIMARY KEY(id_insumo),
    FOREIGN KEY(id_insumo) REFERENCES insumo(id) ON DELETE CASCADE
);


CREATE TABLE contra_pragas(
    id_insumo INT NOT NULL,

    PRIMARY KEY(id_insumo),
    FOREIGN KEY(id_insumo) REFERENCES insumo(id) ON DELETE CASCADE
);

CREATE TABLE lote_insumo(
    id_produto INT,
    numero_lote INT,
    id_insumo INT,
    data_aplicacao DATE NOT NULL,
    quantidade NUMERIC(10,2) CHECK(quantidade > 0),

    PRIMARY KEY(id_produto, numero_lote, id_insumo),
    FOREIGN KEY(id_produto, numero_lote) REFERENCES lote(id_produto, numero_lote),
    FOREIGN KEY(id_insumo) REFERENCES insumo(id)
);

CREATE TABLE comprador(
    id SERIAL,
    documento_identificador VARCHAR(20) UNIQUE NOT NULL,
    prenome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,

    PRIMARY KEY(id)
);

CREATE TABLE movimentacao(
    id SERIAL,
    qr_code VARCHAR(100),
    observacao TEXT,
    localizacao_atual VARCHAR(100),
    data_movimentacao DATE DEFAULT CURRENT_DATE,
    id_produto INT,
    numero_lote INT,
    id_comprador INT NOT NULL,
    id_usuario INT NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY(id_produto, numero_lote) REFERENCES lote(id_produto, numero_lote),
    FOREIGN KEY(id_comprador) REFERENCES comprador(id),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);

CREATE TABLE historico_movimentacao(
    id_historico SERIAL,
    id_movimentacao INT NOT NULL,
    id_anterior INT,

    PRIMARY KEY(id_historico, id_movimentacao),
    FOREIGN KEY(id_movimentacao) REFERENCES movimentacao(id),
    FOREIGN KEY(id_anterior) REFERENCES historico_movimentacao(id_historico, id_movimentacao)
);

CREATE INDEX idx_produto_nome
ON produto(nome);

CREATE INDEX idx_movimentacao_data
ON movimentacao(data_movimentacao);

CREATE INDEX idx_lote_data
ON lote(data_expedicao);
