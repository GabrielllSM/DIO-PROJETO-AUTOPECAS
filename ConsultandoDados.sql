-- processo realiza a listagem de todas as ordens de serviço, incluindo os dados do cliente, do veículo e do funcionário responsável
SELECT 
    os.id_os,
    c.nome AS cliente,
    v.placa,
    v.marca,
    os.data_abertura,
    os.status,
    f.nome AS funcionario
FROM ordens_servico os
JOIN veiculos v ON os.id_veiculo = v.id_veiculo
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN funcionarios f ON os.id_funcionario = f.id_funcionario;

-- Processo consulta todas ordens pagas, incluindo forma de pagamento e valor
SELECT 
    p.id_pagamento,
    c.nome AS cliente,
    os.id_os,
    p.forma_pagamento,
    p.valor_total,
    p.data_pagamento
FROM pagamentos p
JOIN ordens_servico os ON p.id_os = os.id_os
JOIN veiculos v ON os.id_veiculo = v.id_veiculo
JOIN clientes c ON v.id_cliente = c.id_cliente
WHERE p.pago = TRUE;

-- Processo verifica quais serviços foram realizados em OS e os especifica
SELECT 
    s.nome AS servico,
    s.preco,
    os_s.quantidade
FROM os_servicos os_s
JOIN servicos s ON os_s.id_servico = s.id_servico
WHERE os_s.id_os = 2;

-- Verifica peças usadas em cada ordem e custo total por OS
SELECT 
    os.id_os,
    p.nome AS peca,
    op.quantidade,
    p.preco,
    (op.quantidade * p.preco) AS custo_total_peca
FROM os_pecas op
JOIN pecas p ON op.id_peca = p.id_peca
JOIN ordens_servico os ON op.id_os = os.id_os;

-- Busca todas as OS abertas ou em andamento
SELECT 
    os.id_os,
    c.nome AS cliente,
    os.status,
    os.data_abertura
FROM ordens_servico os
JOIN veiculos v ON os.id_veiculo = v.id_veiculo
JOIN clientes c ON v.id_cliente = c.id_cliente
WHERE os.status IN ('Aberta', 'Em andamento');

-- Total de serviços realizados por tipo
SELECT 
    s.nome AS servico,
    SUM(os_s.quantidade) AS total_realizado
FROM os_servicos os_s
JOIN servicos s ON os_s.id_servico = s.id_servico
GROUP BY s.nome
ORDER BY total_realizado DESC;

