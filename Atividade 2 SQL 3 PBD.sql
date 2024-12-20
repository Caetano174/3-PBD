SELECT e.Nome 
FROM EMPREGADO e
JOIN DEPARTAMENTO d ON e.Depto = d.Numero
WHERE d.Nome = 'Engenharia Civil';


SELECT p.Numero AS Numero_Projeto, d.Numero AS Numero_Departamento, e.Nome AS Nome_Gerente
FROM PROJETO p
JOIN DEPARTAMENTO_PROJETO dp ON p.Numero = dp.Numero_Projeto
JOIN DEPARTAMENTO d ON dp.Numero_Depto = d.Numero
JOIN EMPREGADO e ON d.RG_Gerente = e.RG
WHERE p.Localizacao = 'São Paulo';


SELECT e.Nome
FROM EMPREGADO e
JOIN EMPREGADO_PROJETO ep ON e.RG = ep.RG_Empregado
WHERE NOT EXISTS (
    SELECT 1 
    FROM DEPARTAMENTO_PROJETO dp
    WHERE dp.Numero_Depto = 3
    AND NOT EXISTS (
        SELECT 1 
        FROM EMPREGADO_PROJETO ep2
        WHERE ep2.RG_Empregado = e.RG AND ep2.Numero_Projeto = dp.Numero_Projeto
    )
);


SELECT DISTINCT p.Numero
FROM PROJETO p
JOIN DEPARTAMENTO_PROJETO dp ON p.Numero = dp.Numero_Projeto
JOIN DEPARTAMENTO d ON dp.Numero_Depto = d.Numero
JOIN EMPREGADO e ON d.RG_Gerente = e.RG
WHERE e.Nome = 'Fernando'
UNION
SELECT ep.Numero_Projeto
FROM EMPREGADO_PROJETO ep
JOIN EMPREGADO e ON ep.RG_Empregado = e.RG
WHERE e.Nome = 'Fernando';


SELECT e.Nome 
FROM EMPREGADO e
LEFT JOIN DEPENDENTES d ON e.RG = d.RG_Responsavel
WHERE d.RG_Responsavel IS NULL;


SELECT DISTINCT e.Nome
FROM EMPREGADO e
JOIN DEPARTAMENTO d ON e.RG = d.RG_Gerente
JOIN DEPENDENTES dep ON e.RG = dep.RG_Responsavel;


SELECT DISTINCT dp.Numero_Depto
FROM PROJETO p
JOIN DEPARTAMENTO_PROJETO dp ON p.Numero = dp.Numero_Projeto
WHERE p.Localizacao = 'Rio Claro';


SELECT DISTINCT e.Nome, e.RG
FROM EMPREGADO e
WHERE e.RG IN (SELECT RG_Supervisor FROM EMPREGADO);


SELECT Nome 
FROM EMPREGADO
WHERE Salario >= 2000.00;


SELECT Nome 
FROM EMPREGADO
WHERE Nome LIKE 'J%';


SELECT Nome 
FROM EMPREGADO
WHERE Nome LIKE '%Luiz%' OR Nome LIKE '%Luis%';


SELECT e.Nome 
FROM EMPREGADO e
JOIN DEPARTAMENTO d ON e.Depto = d.Numero
WHERE d.Nome = 'Engenharia Civil';


SELECT DISTINCT d.Nome
FROM DEPARTAMENTO d
JOIN DEPARTAMENTO_PROJETO dp ON d.Numero = dp.Numero_Depto
JOIN PROJETO p ON dp.Numero_Projeto = p.Numero
WHERE p.Nome = 'Motor 3';


SELECT e.Nome
FROM EMPREGADO e
JOIN EMPREGADO_PROJETO ep ON e.RG = ep.RG_Empregado
JOIN PROJETO p ON ep.Numero_Projeto = p.Numero
WHERE p.Nome = 'Financeiro 1';


SELECT e.Nome
FROM EMPREGADO e
JOIN EMPREGADO s ON e.RG_Supervisor = s.RG
WHERE s.Salario BETWEEN 2000 AND 2500;


SELECT DISTINCT e.Nome
FROM EMPREGADO e
JOIN DEPARTAMENTO d ON e.RG = d.RG_Gerente
JOIN DEPENDENTES dep ON e.RG = dep.RG_Responsavel;


UPDATE EMPREGADO
SET Salario = 3000.00
WHERE Depto = 2;


UPDATE EMPREGADO
SET Salario = Salario * 1.10;


SELECT AVG(Salario) AS Media_Salarial
FROM EMPREGADO;


SELECT Nome
FROM EMPREGADO
WHERE Salario > (SELECT AVG(Salario) FROM EMPREGADO)
ORDER BY Nome;
