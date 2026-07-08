INSERT INTO usuario
(prenome,sobrenome,email,senha,tipo_usuario)
VALUES
('Mariana','Padilha','mariana@email.com','123456','comum'),
('Leonardo','Garcia','leo@email.com','123456','premium'),
('Luis','Calone','luis@email.com','123456','comum'),
('Ana','Souza','ana@email.com','123456','comum'),
('Carlos','Oliveira','carlos@email.com','123456','premium');

INSERT INTO telefone_usuario
VALUES
(1,'55999990001'),
(1,'55999990002'),
(2,'55999990003'),
(3,'55999990004'),
(4,'55999990005'),
(5,'55999990006');

INSERT INTO pessoa_fisica
VALUES
(1,'111.111.111-11'),
(4,'222.222.222-22');

INSERT INTO pessoa_juridica
VALUES
(3,'11.222.333/0001-44');

INSERT INTO trabalhador
VALUES
(2,'11122233344'),
(5,'55566677788');

INSERT INTO produto
(nome,variedade,data_cadastro,ultima_atualizacao,id_usuario)
VALUES
('Soja','RR', CURRENT_DATE, CURRENT_DATE, 1),
('Milho','Doce', CURRENT_DATE, CURRENT_DATE, 3),
('Trigo','Integral', CURRENT_DATE, CURRENT_DATE, 4);

INSERT INTO lote
VALUES
(1,101,1000,'2026-06-01',1),
(1,102,800,'2026-06-05',1),
(2,201,1500,'2026-06-10',3),
(3,301,1200,'2026-06-15',4);

INSERT INTO insumo DEFAULT VALUES;
INSERT INTO insumo DEFAULT VALUES;
INSERT INTO insumo DEFAULT VALUES;
INSERT INTO insumo DEFAULT VALUES;

INSERT INTO fertilizante
VALUES
(1),
(2);

INSERT INTO contra_pragas
VALUES
(3),
(4);

INSERT INTO lote_insumo
VALUES
(1,101,1,'2026-05-15',50),
(1,101,3,'2026-05-18',20),
(2,201,2,'2026-05-22',60),
(3,301,4,'2026-05-25',30);

INSERT INTO comprador (documento_identificador, prenome, sobrenome)
VALUES
('12345678900', 'Pedro', 'Santos'),
('98765432100', 'Juliana', 'Ferreira');

INSERT INTO movimentacao
 (qr_code, observacao, localizacao_atual, data_movimentacao, id_produto, numero_lote, documento_identificador, id_usuario)
VALUES
('QR001', 'Saída da fazenda', 'Alegrete', '2026-06-02', 1, 101, '12345678900', 2),
('QR002', 'Centro de distribuição', 'Uruguaiana', '2026-06-03', 1, 101, '12345678900', 2),
('QR003', 'Entrega final', 'Porto Alegre', '2026-06-04', 2, 201, '98765432100', 5);

INSERT INTO historico_movimentacao (id_movimentacao, id_anterior)
VALUES
(1, NULL),
(2, 1),
(3, 2);