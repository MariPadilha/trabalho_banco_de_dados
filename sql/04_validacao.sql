-- =====================================================
-- TESTE 1 (VÁLIDO)
-- Inserção válida de usuário
-- Deve funcionar normalmente
-- =====================================================
INSERT INTO usuario
(prenome,sobrenome,email,senha,tipo_usuario)
VALUES
('João', 'Silva', 'joao.silva.validacao@email.com', '123456', 'comum');

-- =====================================================
-- TESTE 2 (INVÁLIDO)
-- Violação UNIQUE(email)
-- Deve falhar
-- =====================================================
INSERT INTO usuario
(prenome,sobrenome,email,senha,tipo_usuario)
VALUES
('Maria', 'Santos', 'mariana@email.com', '123456', 'premium');

-- =====================================================
-- TESTE 3 (INVÁLIDO)
-- Violação PRIMARY KEY
-- Deve falhar
-- =====================================================
INSERT INTO comprador (documento_identificador, prenome, sobrenome)
VALUES
('12345678900', 'Pedro', 'Santos');

-- =====================================================
-- TESTE 4 (INVÁLIDO)
-- Violação FOREIGN KEY
-- Produto inexistente
-- Deve falhar
-- =====================================================
INSERT INTO lote
VALUES
(999, 500, 1000, '2026-06-10', 1);

-- =====================================================
-- TESTE 5 (INVÁLIDO)
-- Violação CHECK
-- Produção negativa
-- Deve falhar
-- =====================================================
INSERT INTO lote
VALUES
(1, 999, -500, '2026-06-10', 1);

-- =====================================================
-- TESTE 6 (INVÁLIDO)
-- Violação CHECK
-- Quantidade negativa de insumo
-- Deve falhar
-- =====================================================
INSERT INTO lote_insumo
VALUES
(1, 101, 1, '2026-06-20', -20);

-- =====================================================
-- TESTE 7 (INVÁLIDO)
-- Violação NOT NULL
-- Nome obrigatório
-- Deve falhar
-- =====================================================
INSERT INTO produto
(nome, variedade, id_usuario)
VALUES
(NULL, 'Orgânico', 1);

-- =====================================================
-- TESTE 8 (VÁLIDO)
-- Atualização válida
-- =====================================================
UPDATE produto
SET variedade='Premium'
WHERE id=1;

-- =====================================================
-- TESTE 9 (VÁLIDO)
-- Exclusão válida
-- =====================================================
DELETE FROM telefone_usuario
WHERE id_usuario=5;

-- =====================================================
-- TESTE 10
-- Transação com COMMIT
-- Deve salvar alterações
-- =====================================================
BEGIN;
INSERT INTO comprador (documento_identificador, prenome, sobrenome)
VALUES
('55544433322', 'Ricardo', 'Oliveira');
COMMIT;

-- =====================================================
-- TESTE 11
-- Transação com ROLLBACK
-- Não deve salvar alterações
-- =====================================================
BEGIN;
INSERT INTO comprador (documento_identificador, prenome, sobrenome)
VALUES
('99988877766', 'Teste', 'Rollback');
ROLLBACK;

-- =====================================================
-- TESTE 12
-- Verificar se rollback funcionou
-- Deve retornar vazio
-- =====================================================
SELECT *
FROM comprador
WHERE documento_identificador='99988877766';