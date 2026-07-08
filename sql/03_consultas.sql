-- =====================================================
-- Quais produtos foram cadastrados por cada usuário?
-- =====================================================
SELECT
    u.prenome,
    u.sobrenome,
    p.nome AS produto,
    p.variedade
FROM usuario u
JOIN produto p
    ON u.id = p.id_usuario
ORDER BY u.prenome;

-- =====================================================
-- Quantos lotes existem por produto?
-- =====================================================
SELECT
    p.nome,
    COUNT(l.numero_lote) AS quantidade_lotes
FROM produto p
LEFT JOIN lote l
    ON p.id = l.id_produto
GROUP BY p.id,p.nome
ORDER BY quantidade_lotes DESC;

-- ====================================================
-- Qual a produção total por produto?
-- =====================================================
SELECT
    p.nome,
    SUM(l.total_produzido) AS total_producao
FROM produto p
JOIN lote l
    ON p.id = l.id_produto
GROUP BY p.id,p.nome
ORDER BY total_producao DESC;

-- =====================================================
-- Quais lotes receberam fertilizantes?
-- =====================================================
SELECT
    l.numero_lote,
    p.nome AS produto,
    li.quantidade,
    li.data_aplicacao
FROM lote l
JOIN produto p
ON l.id_produto = p.id
JOIN lote_insumo li
ON l.id_produto=li.id_produto
AND l.numero_lote=li.numero_lote
JOIN fertilizante f
ON li.id_insumo=f.id_insumo;

-- =====================================================
-- Quais compradores receberam mais movimentações?
-- =====================================================
SELECT
    c.prenome,
    c.sobrenome,
    COUNT(m.id) AS total_movimentacoes
FROM comprador c
JOIN movimentacao m
ON c.documento_identificador=
m.documento_identificador
GROUP BY
c.documento_identificador,
c.prenome,
c.sobrenome
ORDER BY total_movimentacoes DESC;

-- =====================================================
-- Qual histórico de movimentação de um lote?
-- =====================================================
SELECT
    p.nome,
    l.numero_lote,
    m.localizacao_atual,
    m.data_movimentacao
FROM lote l
JOIN movimentacao m
ON l.id_produto=m.id_produto
AND l.numero_lote=m.numero_lote
JOIN produto p
ON p.id=l.id_produto
WHERE l.numero_lote=101
ORDER BY m.data_movimentacao;

-- =====================================================
-- Qual a média de produção dos lotes por produto?
-- =====================================================
SELECT
    p.nome,
    ROUND(
        AVG(l.total_produzido),
        2
    ) AS media_producao
FROM produto p
JOIN lote l
ON p.id=l.id_produto
GROUP BY p.id,p.nome;

-- =====================================================
-- Quais usuários registraram mais movimentações?
-- =====================================================
SELECT
    u.prenome,
    u.sobrenome,
    COUNT(m.id) AS quantidade
FROM usuario u
LEFT JOIN movimentacao m
ON u.id=m.id_usuario
GROUP BY
u.id,
u.prenome,
u.sobrenome
ORDER BY quantidade DESC;

-- =====================================================
-- Quantos insumos cada lote recebeu?
-- =====================================================
SELECT
    l.numero_lote,
    p.nome,
    COUNT(li.id_insumo)
    AS quantidade_insumos
FROM lote l
JOIN produto p
ON l.id_produto=p.id
LEFT JOIN lote_insumo li
ON l.id_produto=li.id_produto
AND l.numero_lote=li.numero_lote
GROUP BY
l.numero_lote,
p.nome
ORDER BY quantidade_insumos DESC;

-- ====================================================
-- Quais produtos ainda não possuem movimentações?
-- =====================================================
SELECT
    nome
FROM produto
WHERE id NOT IN(
    SELECT DISTINCT
        id_produto
    FROM movimentacao
);

-- =====================================================
-- Qual lote possui a maior produção?
-- =====================================================
SELECT
    numero_lote,
    total_produzido
FROM lote
WHERE total_produzido=(
    SELECT
        MAX(total_produzido)
    FROM lote
);

-- =====================================================
-- Quantidade de movimentações por cidade/local
-- =====================================================
SELECT
    localizacao_atual,
    COUNT(*) AS total
FROM movimentacao
GROUP BY localizacao_atual
ORDER BY total DESC;