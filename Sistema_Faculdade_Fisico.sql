#Cria um novo database
create database db_sistema_faculdade;

#Mostra todo os databases existentes 
show databases;

 #Ativa o databases que sera utilizado 
 use db_sistema_faculdade;
 
 
 #Permite criar uma tabela no database
 #Tabela aluno
 create table tbl_aluno(
	id int not null primary key auto_increment, 
    nome varchar(100) not null,
    cpf varchar (15) not null, 
    dt_nascimento date not null,
    unique index(id)
 );
 
  #Permite visualizar todas as tabelas que existem no database utilizado
 show tables;
 
 #Permite visualizar os dados da tabela 
 select * from tbl_aluno;
 
 #Tabela do telefone do aluno
 create table tbl_telefone_aluno (
	id int not null primary key auto_increment,
    numero varchar(15) not null,
    id_aluno int not null,
    
    #Cria relacionamento entre a tabela aluno e telefone
	constraint FK_Aluno_Telefone
	foreign key (id_aluno)
	references tbl_aluno (id), 
 
    unique index (id)
 );
 
 #Tabela do email do aluno
	create table tbl_email_aluno (
	id int not null primary key auto_increment,
    email varchar(225) not null,
    id_aluno int not null,
    
    #Cria relacionamento entre a tabela aluno e email 
	constraint FK_Aluno_Email
	foreign key (id_aluno)
	references tbl_aluno (id), 
 
    unique index (id)
 );
 
 #Tabela do endereco do aluno
    create table tbl_endereco_aluno (
	id int not null primary key auto_increment,
    numero_residencia varchar (10) not null,
    bairro varchar (100) not null,
    cep varchar (45) not null,
    cidade varchar (45) not null,
    estado varchar (45) not null,
    pais varchar (45) not null,
    rua varchar (100) not null,
    id_aluno int not null,
    
    #Cria relacionamento entre a tabela aluno e endereco
	constraint FK_Aluno_Endereco
	foreign key (id_aluno)
	references tbl_aluno (id), 
 
    unique index (id)
 );
 
 #Tabela do professor
  create table tbl_professor(
	id int not null primary key auto_increment, 
    nome varchar(100) not null,
    cpf varchar (15) not null, 
    formacao varchar (100) not null,
    unique index(id)
 );
 
 #Tabela do telefone do professor
 create table tbl_telefone_professor (
	id int not null primary key auto_increment,
    numero varchar(15) not null,
    id_professor int not null,
    
    #Cria relacionamento entre a tabela professor e telefone
	constraint FK_Professor_Telefone
	foreign key (id_professor)
	references tbl_professor (id), 
 
    unique index (id)
 );
 
  #Tabela do email do professor
	create table tbl_email_professor (
	id int not null primary key auto_increment,
    email varchar(225) not null,
    id_professor int not null,
    
    #Cria relacionamento entre a tabela professor e email 
	constraint FK_Professor_Email
	foreign key (id_professor)
	references tbl_professor (id), 
 
    unique index (id)
 );
 
  #Tabela do endereco do professor
    create table tbl_endereco_professor (
	id int not null primary key auto_increment,
    numero_residencia varchar (10) not null,
    bairro varchar (100) not null,
    cep varchar (45) not null,
    cidade varchar (45) not null,
    estado varchar (45) not null,
    pais varchar (45) not null,
    rua varchar (100) not null,
    id_professor int not null,
    
    #Cria relacionamento entre a tabela professor e endereco
	constraint FK_Professor_Endereco
	foreign key (id_professor)
	references tbl_professor (id), 
 
    unique index (id)
 );
 
  #Tabela do curso oferecido pela faculdade 
  create table tbl_curso (
	id int not null primary key auto_increment,
    nome varchar(100) not null,
	modalidade varchar (50) not null,
    tipo varchar (50) not null,
    carga_horaria_total int not null,
    qtd_semestre int not null,
    
    unique index (id)
 );
 
  #Tabela da turma formada por meio dos cursos oferecidos
   create table tbl_turma (
	id int not null primary key auto_increment,
    semestre varchar(45) not null,
	dt_inicio date not null,
    dt_termino date not null,
    id_curso int not null,
    
    #Cria relacionamento entre a tabela turma e curso
	constraint FK_Turma_Curso
	foreign key (id_curso)
	references tbl_curso (id), 
    
    unique index (id)

 );
 
  #Tabela da matricula dos alunos
 create table tbl_matricula (
	id int not null primary key auto_increment,
    dt_matricula date not null,
    status_matricula varchar(45) not null,
	id_aluno int not null,
    id_curso int not null,
    id_turma int not null,
    
    
    #Cria relacionamento entre a tabela aluno e matricula
	constraint FK_Aluno_Matricula
	foreign key (id_aluno)
	references tbl_aluno (id), 
    
    #Cria relacionamento entre a tabela curso e matricula
	constraint FK_Curso_Matricula
	foreign key (id_curso)
	references tbl_curso (id), 
    
    #Cria relacionamento entre a tabela turma e matricula
	constraint FK_Turma_Matricula
	foreign key (id_turma)
	references tbl_turma (id), 
    
    unique index (id)

 );
 
#Tabela da materia dos cursos
 create table tbl_materia (
	id int not null primary key auto_increment,
    nome  varchar(100) not null,
	carga_horaria int not null,
	tipo varchar (50) not null,
    id_curso int not null,
    id_professor int not null,
    
    
    #Cria relacionamento entre a tabela curso e materia
	constraint FK_Curso_Materia
	foreign key (id_curso)
	references tbl_curso (id), 
    
    #Cria relacionamento entre a tabela professor e materia
	constraint FK_Professor_Materia
	foreign key (id_professor)
	references tbl_professor (id),
    
    unique index (id)
    
 );
 
 #Tabela das avaliacoes feitas por alunos 
  create table tbl_avaliacao (
	id int not null primary key auto_increment,
    nome  varchar(100) not null,
    tipo varchar(45) not null,
	data_avaliacao date not null,
    descricao varchar (200) not null,
    id_materia int not null,
    
    #Cria relacionamento entre a tabela avaliacao e materia
	constraint FK_Materia_Avaliacao
	foreign key (id_materia)
	references tbl_materia (id), 
    
    unique index (id)
    
 );
 
 #Tabela das notas das avaliacoes dos alunos
   create table tbl_nota (
	id int not null primary key auto_increment,
    nota numeric not null,
    justificativa varchar(100) not null,
	id_aluno int not null,
    id_avaliacao int not null,
    
    #Cria relacionamento entre a tabela aluno e Nota
	constraint FK_Aluno_Nota
	foreign key (id_aluno)
	references tbl_aluno (id), 
    
    #Cria relacionamento entre a tabela avaliacao e Nota
	constraint FK_Avaliacao_Nota
	foreign key (id_avaliacao)
	references tbl_avaliacao (id), 
    
    unique index (id)
    
 );
 
 #Inserir as informacoes dos alunos: nome, cpf e data de nascimento
 Insert into tbl_aluno (nome,
						cpf,
						dt_nascimento
						) values ('Ana Clara', '56985246322', '2004-01-02'),
								('Luiza Soares', '10120126344', '2003-02-12'),
								('Joao Pedro', '1507202333', '1999-08-26'),
								('Natan Oliveira', '10120130111', '2000-05-05'),
								('Gabriela Costa', '50060090045', '1996-10-03'),
								('Thiago Martins', '01234567890', '1998-05-12'),
								('Raquel Rocha', '11223344556', '2000-02-19'),
								('Felipe Souza', '22334455667', '1996-10-03'),
								('Juliana Silva', '33445566778', '1997-09-10'),
								('Marcos Oliveira', '44556677889', '1995-05-20'),
								('Camila Pereira', '55667788990', '2001-07-15'),
								('Daniel Costa', '66778899001', '1998-11-22'),
								('Larissa Almeida', '77889900112', '1994-12-01'),
								('Rodrigo Oliveira', '88990011223', '1999-02-14'),
								('Carla Silva', '99001122334', '2001-05-25'),
								('Maria Oliveira', '23456789012', '2000-06-22'),
								('Pedro Santos', '34567890123', '1995-09-30'),
								('Ana Costa', '45678901234', '1999-11-11'),
								('Carlos Souza', '56789012345', '1997-12-25'),
								('Fernanda Alves', '67890123456', '2001-03-10');
select *from tbl_aluno;

#Inserir telefone do aluno                         
insert into tbl_telefone_aluno (numero, id_aluno
						) values ('11987654321', 1),
								('11923456789', 2),
								('11987612345', 3),
								('11965478901', 4),
								('11943210987', 5),
								('11956789012', 6),
                                ('11956785555', 6),
								('11998765432', 7),
								('11987611223', 8),
								('11988776655', 9),
								('11990887766', 10),
								('11976543210', 11),
								('11987611234', 12),
								('11998765431', 13),
								('11993456789', 14),
								('11954321098', 15),
								('11987654322', 16),
								('11976543211', 17),
								('11987654323', 18),
                                ('11988855423', 18),
								('11976543209', 19),
								('11987654324', 20),
                                ('11987655522', 20);

select *from tbl_telefone_aluno;
 
 #Inserir email do aluno 
insert into tbl_email_aluno (email, id_aluno
						) values ('anaclara@gmail.com', 1),
								('luizasoares@yahoo.com', 2),
                                ('luizaso1005@outlook.com', 2),
								('joaopedro@hotmail.com', 3),
								('natanoliveira@gmail.com', 4),
								('gabrielacosta@outlook.com', 5),
								('thiagomartins@gmail.com', 6),
								('raquelrocha@hotmail.com', 7),
								('felipesouza@outlook.com', 8),
								('julianasilva@gmail.com', 9),
								('marcosoliveira@yahoo.com', 10),
								('camilapereira@hotmail.com', 11),
								('danielcosta@outlook.com', 12),
								('larissaalmeida@gmail.com', 13),
								('rodrigooliveira@hotmail.com', 14),
								('carlasilva@outlook.com', 15),
								('mariaoliveira@gmail.com', 16),
								('pedrosantos@yahoo.com', 17),
								('anacosta@hotmail.com', 18),
								('carlossouza@outlook.com', 19),
                                ('carlossouzaa10@gmail.com', 19),
								('fernandaalves@gmail.com', 20);

select *from tbl_email_aluno;

#Inserir endereco do aluno 
insert into tbl_endereco_aluno (numero_residencia,
								bairro,
								cep,
								cidade,
								estado,
								pais,
								rua,
								id_aluno
						) values ('123', 'Jardim da Vida', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua das Flores', '1'),
									('456', 'Vila Esperança', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Avenida dos Sonhos', '2'),
									('789', 'Jardim das Estrelas', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua dos Ventos', '3'),
									('10', 'Vila Esperança', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua das Árvores', '4'),
									('25', 'Morada do Sol', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua da Luz', '5'),
									('3', 'Parque das Pedras', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua das Águas', '6'),
									('88', 'Vila Primavera', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua da Paz', '7'),
									('20', 'Jardim do Sol', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua dos Trilhos', '8'),
									('30', 'Vila da Felicidade', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Avenida Alegria', '9'),
									('707', 'Jardim das Palmeiras', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua dos Limoeiros', '10'),
									('89', 'Bairro das Laranjeiras', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua das Plantas', '11'),
									('64', 'Parque das Flores', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua das Violetas', '12'),
									('10', 'Bairro do Sol', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua Alegre', '13'),
									('1', 'Vila das Rosas', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua da Animacao', '14'),
									('55', 'Jardim da Vida', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua do Paraíso', '15'),
									('8569', 'Vila dos Lírios', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua dos Girassóis', '16'),
									('141', 'Jardim do Paraíso', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua das Margaridas', '17'),
									('697', 'Bairro Esperança', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua da fé', '18'),
									('1000', 'Jardim dos Pássaros', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua dos Campos', '19'),
									('17', 'Vila dos Canteiros', '01001-000', 'São Paulo', 'São Paulo', 'Brasil', 'Rua da Liberdade', '20')
									;

select *from tbl_endereco_aluno;
 
 #Inserir oferecidos pela faculdade
  insert into tbl_curso (
							nome,
							modalidade,
							tipo,
							carga_horaria_total,
							qtd_semestre
					) values  ('Engenharia de Software', 'Presencial', 'Bacharelado', 3600, 8),
							('Psicologia', 'Semipresencial', 'Bacharelado', 4200, 10),
							('Administração', 'EAD', 'Bacharelado', 4000, 8)
							;
                            
 select * from tbl_curso;
 
 #Inserir as turmas 
  insert into tbl_turma (
							semestre,
							dt_inicio,
							dt_termino,
							id_curso
					) values 
                            ('Quarto',
							'2023-01-01',
							'2028-01-01',
                            '2'),
                            ('Primeiro',
							'2024-08-01',
							'2028-08-01',
                            '3'),
                            ('Segundo',
							'2024-01-01',
							'2028-01-01',
                            '1');
select * from tbl_turma;

#Inserir matricula do aluno 
insert into tbl_matricula ( 
							dt_matricula,
                            status_matricula,
							id_aluno,
							id_curso,
                            id_turma
                            )
                            values (
                            '2023-01-01',
                            'ativo',
                            '1',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '2',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '3',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '4',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '5',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '6',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '7',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '8',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '9',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '10',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '11',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '12',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '13',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '14',
                            '2',
							'1'
                            ),
                            (
                            '2023-01-01',
                            'ativo',
                            '15',
                            '2',
							'1'
                            ),
                            (
                            '2024-08-01',
                            'ativo',
                            '16',
                            '3',
							'2'
                            ),
                            (
                            '2024-08-01',
                            'ativo',
                            '17',
                            '3',
							'2'
                            ),
                            (
                            '2024-08-01',
                            'ativo',
                            '18',
                            '3',
							'2'
                            ),
                            (
                            '2024-01-01',
                            'ativo',
                            '19',
                            '1',
							'3'
                            ),
                            (
                            '2024-01-01',
                            'ativo',
                            '20',
                            '1',
							'3'
                            )
                            ;					
 select * from tbl_matricula;
 
 #Inserir infdormacoes do professor
insert into tbl_professor (
							nome,
							cpf,
							formacao
					) values 
							('Cleo', '32132132110', 'Adiministracao'),
							('Jurema', '32132132110', 'Psicologia'),
							('Elaine', '21321333312', 'Engenharia de Software');
select *from tbl_professor;

#Inserir telefone do Professor                            
insert into tbl_telefone_professor (numero, id_professor
						) values
                        ('11948275698', 1),
                        ('11945963533', 2),
                        ('11975698215', 2),
                        ('11948601533', 3);
select *from tbl_telefone_professor;
 
#Inserir email do professor
insert into tbl_email_professor (email, id_professor
						) values
                        ('cleo@gmail.com', 1),
                        ('jurema@iutlook.com', 2),
                        ('elaine@gmail.com', 3);
select * from tbl_email_professor;

#Inserir endereco do professor
insert into tbl_endereco_professor (numero_residencia,
								bairro,
								cep,
								cidade,
								estado,
								pais,
								rua,
								id_professor
						) values (1400, 
									'Jardim dos Anjos', 
                                    '06889-500', 
                                    'Sao Paulo', 
                                    'Sao Paulo', 
                                    'Brasil', 
                                    'Rua das Pedras',
                                    1),
                                    (15, 
									'Jardim dos espinhos', 
                                    '05889-600', 
                                    'Sao Paulo', 
                                    'Sao Paulo', 
                                    'Brasil', 
                                    'Rua da vida',
                                    2),
                                    (25, 
									'Jardim das oliveiras', 
                                    '05005-400', 
                                    'Sao Paulo', 
                                    'Sao Paulo', 
                                    'Brasil', 
                                    'Rua da felicidade',
                                    3)
                                    ;
select * from tbl_endereco_professor;

#Inserir materia do curso
 insert into tbl_materia (
							nome,
                            tipo,
							carga_horaria,
							id_curso,
							id_professor
					) values 
							('Fundamentos da Administração', 'Obrigatória', '80', '3', 1),
							('Gestão de Pessoas', 'Obrigatória', '100', '3', 1),
							('Neurociências', 'Obrigatória', '100', '2', 2),
							('Psicologia Organizacional', 'Obrigatória', '120', '2', 2),
							('Banco de Dados', 'Obrigatória', '120', '1', 3),
							('Desenvolvimento de Software', 'Obrigatória', '140', '1', 3)
							;
select * from tbl_materia;

#Inserir avaliacoes realizadas
 insert into tbl_avaliacao (
							nome,
							tipo,
							data_avaliacao,
							descricao,
                            id_materia
					) values 
							('Modelagem de dados', 'Estudo de caso', '2024-03-01', 'O aluno deve criar o modelo conceitual, logico e fisico de um BD','5'),
							('Realizar uma calculadora','Trabalho avaliativo','2024-05-30', 'O aluno deve enviar um PDF com os prints do programa funcionando','6')
							;
select * from tbl_avaliacao;

 insert into tbl_nota (
							nota,
							justificativa,
							id_aluno,
                            id_avaliacao
					) values 
							('10', 'Tudo certo', '20', '1'),
							('8','Programa funcional, mas faltou caprichar no design', '19','2'),
                            ('5', 'Modelagem de dados muito basica', '19', '1'),
							('10','Programa funcional e muito bem feito', '20','2')
							;
select * from tbl_nota;

#FAZER BUSCA DE DADOS DE RELACIONAMENTO ENTRE TABELAS 
SELECT 
    tbl_aluno.id AS id_aluno,
    tbl_aluno.nome AS nome_aluno, 
    tbl_aluno.cpf AS cpf_aluno,
    tbl_matricula.id AS matricula_aluno,
    tbl_curso.nome AS nome_curso
FROM tbl_aluno
INNER JOIN tbl_matricula
    ON tbl_aluno.id = tbl_matricula.id_aluno
INNER JOIN tbl_turma
    ON tbl_matricula.id_turma = tbl_turma.id
INNER JOIN tbl_curso
    ON tbl_turma.id_curso = tbl_curso.id
ORDER BY tbl_aluno.id ASC;

SELECT 
    tbl_professor.id AS id_professor, 
    tbl_professor.cpf AS cpf_professor,
    tbl_professor.nome AS nome_professor,
    tbl_materia.nome AS nome_materia,
    tbl_curso.nome AS nome_curso
FROM tbl_professor
INNER JOIN tbl_materia
    ON tbl_professor.id = tbl_materia.id_professor
INNER JOIN tbl_curso
    ON tbl_materia.id_curso = tbl_curso.id;

#Atualizar o telefone da professora Cleo de id 1
update tbl_telefone_professor set numero = '11945802699' where id=1; 
select *from tbl_telefone_professor;

#Pesquisar o aluno Joao Pedro na tabela aluno
select * from tbl_aluno where nome like '%Joao Pedro%';

#Deletar um dos numeros de telefone da professora Cleo
delete from tbl_telefone_professor where id=2;

#Ver as tabelaas existentes no banco de dados do sistema da faculdade
show tables;


