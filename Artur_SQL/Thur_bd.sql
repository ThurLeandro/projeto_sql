/*User*/
create table user(
id_user int auto_increment primary key,
nome varchar(50),
cpf varchar(15),
telefone varchar(11)
);

select * from user;

insert into user(nome, cpf, telefone)
values
('Tom','07717890609','88999120097'),
('Lyed','05529567019','85975649826'),
('Kaio','18828911727','88993726508'),
('Day','14819216802','83994876357'),
('Guto','35626789505','85975967497');

delete from user where id_user = '2';

/*Roles*/
create table roles(
id_roles int auto_increment primary key,
nvl_acs varchar(20)
);

create table roles_user(
roles_id int, 
foreign key(roles_id) references roles(id_roles),
user_id int,
foreign key(user_id) references user(id_user)
);

select user.id_user, user.nome, roles.nvl_acs from roles_user join user on roles_user.user_id = user.id_user
join roles on roles.id_roles = roles_user.roles_id where roles.nvl_acs = 'admin';

insert into roles(nvl_acs)
values
('admin'),('client'),('employer');

insert into roles_user (user_id, roles_id)
values
('1','1'),
('2','3'),
('3','2'),
('4','3'),
('5','2');

select * from roles_user;

/*Post*/

create table post(
id_post int auto_increment primary key,
descricao text,
titulo varchar(30),
userp_id int,
foreign key(userp_id) references user(id_user)
);

select descricao, titulo from post where userp_id = '3';
select descricao, titulo from post where userp_id = '5';

select * from post;

insert into post(descricao, titulo, userp_id)
values
('amoo cheetos!', 'cheetos', 1),
('odeio doritos', 'doritos', 1),
('fiz um armlock voador hj', 'bjj', 2),
('Melhor equipe de bjj', 'nine9', 2),
('o pop e o melhor estilo musical, segundo os internautas', 'melhor estilo musical', 3),
('biscoito de coco faz mal', 'biscoito do mal',3),
('chocolate branco e melhor que chocolate preto', 'chocolate branco',4),
('campeonato bad boy muito legal', 'bad boy',4),
('icaro meu sensei muito lindo', 'icaro sensei nine9',5),
('tonhao volte para os treinos pfvr', 'tonho',5);

update post set descricao = 'cheetos nem e tao bom',
descricao = 'doritos e o melhor'
where userp_id = '1'

select * from post;