--DDL - Criando tabelas
CREATE TABLE IF NOT EXISTS Aluno (
    idAluno INTEGER PRIMARY KEY AUTOINCREMENT,
    AlNome TEXT NOT NULL,
    AlEmail TEXT NOT NULL,
    AlCpf TEXT NOT NULL UNIQUE,
    data_criacao DATETIME NOT NULL DEFAULT (datetime('now','localtime'))
);

CREATE TABLE IF NOT EXISTS Curso (
    idCurso INTEGER PRIMARY KEY AUTOINCREMENT,
    CrDescri TEXT NOT NULL,
    cargaHoraria TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Matricula (
    idMatricula INTEGER PRIMARY KEY AUTOINCREMENT,
    idAluno INT, 
    idCurso INT,
    Mtstatus TEXT NOT NULL,
    FOREIGN KEY (idAluno) REFERENCES Aluno (idAluno),
    FOREIGN KEY (idCurso) REFERENCES Curso (idCurso)
);
--Seleciona todos os alunos por id nome cpf
SELECT id, AlNome
FROM Aluno;

--Seleciona todos os dados da tabela Cursos
SELECT *
FROM Curso;

SELECT Mtstatus
FROM Matricula;

SELECT *
FROM Aluno
WHERE
    AlNome LIKE 'Ter%' ;


delete from matriculas
where id_alunos = 9

SELECT CrDescri
FROM Curso
WHERE CrDescri = 'Front-end'

SELECT AlNome
FROM Aluno
ORDER BY AlNome;

SELECT * from Aluno
ORDER BY AlNome DESC

SELECT *
FROM Curso 
INNER JOIN Matricula ON Curso.idCurso = Matricula.idCurso

--Seleciona Aluno com 
SELECT *
FROM Curso
INNER JOIN Matricula ON Curso.idCurso = Matricula.IdCurso
INNER JOIN Aluno ON Aluno.idAluno = Matricula.idAluno

--Seleciona Aluno com status de Matricula
SELECT AlNome, IdMatricula, IdCurso, Mtstatus
FROM Matricula
INNER JOIN Aluno ON Matricula.idMatricula = Aluno.idAluno


--Seleciona Alunos Aprovados por Matricula
SELECT IdMatricula, IdCurso, Mtstatus, AlNome
FROM Matricula
INNER JOIN Aluno ON Matricula.idMatricula = Aluno.idAluno
WHERE Matricula.Mtstatus = "A"


--Seleciona Alunos Pendentes por Matricula
SELECT IdMatricula, IdCurso, Mtstatus, AlNome
FROM Matricula
INNER JOIN Aluno ON Matricula.idMatricula = Aluno.idAluno
WHERE Matricula.Mtstatus = "P"