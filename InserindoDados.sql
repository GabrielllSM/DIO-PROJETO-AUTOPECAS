-- Inserindo dados ficticios na base
-- 1. Inserir clientes
INSERT INTO clientes (nome, cpf, telefone, email, endereco)
VALUES
('João da Silva', '12345678901', '41991234567', 'joao.silva@email.com', 'Rua das Laranjeiras, 100'),
('Maria Oliveira', '23456789012', '41992345678', 'maria.oliveira@email.com', 'Av. Brasil, 200'),
('Carlos Pereira', '34567890123', '41993456789', 'carlos.pereira@email.com', 'Rua do Comércio, 300'),
('Ana Lima', '45678901234', '41994567890', 'ana.lima@email.com', 'Rua das Acácias, 400'),
('Lucas Mendes', '56789012345', '41995678901', 'lucas.mendes@email.com', 'Rua Principal, 500');

-- 2. Inserir veículos (1 para cada cliente)
INSERT INTO veiculos (id_cliente, placa, marca, modelo, ano, cor)
VALUES
(1, 'AAA1A11', 'Fiat', 'Uno', 2010, 'Prata'),
(2, 'BBB2B22', 'Volkswagen', 'Gol', 2015, 'Preto'),
(3, 'CCC3C33', 'Chevrolet', 'Onix', 2018, 'Branco'),
(4, 'DDD4D44', 'Toyota', 'Corolla', 2020, 'Cinza'),
(5, 'EEE5E55', 'Honda', 'Civic', 2022, 'Azul');

-- 3. Inserir funcionários
INSERT INTO funcionarios (nome, cargo, telefone, email)
VALUES
('Fernando Souza', 'Mecânico', '41991111222', 'fernando@mecanica.com'),
('Patrícia Ramos', 'Atendente', '41992222333', 'patricia@mecanica.com'),
('Rafael Lima', 'Mecânico', '41993333444', 'rafael@mecanica.com'),
('Juliana Costa', 'Gerente', '41994444555', 'juliana@mecanica.com'),
('Bruno Alves', 'Auxiliar', '41995555666', 'bruno@mecanica.com');

-- 4. Inserir serviços
INSERT INTO servicos (nome, preco)
VALUES
('Troca de óleo', 150.00),
('Alinhamento e balanceamento', 120.00),
('Revisão completa', 500.00),
('Troca de pastilhas de freio', 200.00),
('Limpeza de bico injetor', 180.00);

-- 5. Inserir peças
INSERT INTO pecas (nome, preco, estoque)
VALUES
('Filtro de óleo', 35.00, 10),
('Pastilha de freio', 90.00, 15),
('Óleo sintético 5W30', 50.00, 20),
('Bico injetor', 250.00, 5),
('Filtro de ar', 40.00, 12);

-- 6. Inserir ordens de serviço
INSERT INTO ordens_servico (id_veiculo, id_funcionario, data_abertura, data_fechamento, status, descricao)
VALUES
(1, 1, '2024-06-01', '2024-06-02', 'Finalizada', 'Troca de óleo e filtro'),
(2, 3, '2024-06-05', NULL, 'Em andamento', 'Revisão geral e troca de pastilhas'),
(3, 1, '2024-06-10', NULL, 'Aberta', 'Alinhamento e balanceamento'),
(4, 3, '2024-06-03', '2024-06-04', 'Finalizada', 'Limpeza de bico injetor'),
(5, 1, '2024-06-06', NULL, 'Aberta', 'Troca de óleo');

-- 7. Associar serviços às OS
INSERT INTO os_servicos (id_os, id_servico, quantidade)
VALUES
(1, 1, 1), -- OS 1: Troca de óleo
(1, 5, 1), -- OS 1: Limpeza de bico
(2, 3, 1), -- OS 2: Revisão completa
(2, 4, 1), -- OS 2: Troca de pastilhas
(3, 2, 1); -- OS 3: Alinhamento

-- 8. Associar peças às OS
INSERT INTO os_pecas (id_os, id_peca, quantidade)
VALUES
(1, 1, 1), -- Filtro de óleo
(1, 3, 3), -- Óleo sintético
(2, 2, 1), -- Pastilha de freio
(4, 4, 1), -- Bico injetor
(5, 3, 2); -- Óleo sintético

-- 9. Inserir pagamentos
INSERT INTO pagamentos (id_os, forma_pagamento, valor_total, pago, data_pagamento)
VALUES
(1, 'Cartão', 250.00, TRUE, '2024-06-02'),
(4, 'Pix', 180.00, TRUE, '2024-06-04'),
(2, 'Dinheiro', 700.00, FALSE, NULL),
(3, 'Cartão', 120.00, FALSE, NULL),
(5, 'Boleto', 200.00, FALSE, NULL);
