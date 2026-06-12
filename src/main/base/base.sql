drop database if exists b;
create database b;
use b;

create table mouvement(
    id int primary key auto_increment,
    numero_compte varchar(20),
    type_mouvement varchar(50),
    montant double,
    date_mouvement date
);

create table cheque(
    id int primary key auto_increment,
    numero_compte varchar(20),
    numero_cheque varchar(20),
    date_validite date
);

create table etat_cheque(
    id_etat int primary key auto_increment,
    etat varchar(50)
);

create table cheque_etat(
    id int primary key auto_increment,
    id_cheque int,
    id_etat int,
    date_ date,
    beneficiaire varchar(50)
);

insert into etat_cheque(etat) values ("OK"),
("vole"),
("encaisse");

-- insert into cheque_etat(id_cheque, id_etat, date_, beneficiaire) values (2, 2, "2025-04-01", "C3");
insert into mouvement(numero_compte, type_mouvement, montant, date_mouvement) values ("C1", "D", 1000, "2024-01-01"),
("C1", "C", 1000, "2024-01-01"),
("C2", "C", 2000, "2024-01-01"),
("C3", "C", 3000, "2024-01-01"),
("C1", "C", 2000, "2024-01-01");

-- INSERT INTO cheque(numero_cheque,numero_compte,date_validite) VALUES
-- ("CH1","C1","2025-01-01"),
-- ("CH2","C2","2025-01-02"),
-- ("CH3","C3","2025-01-03"),
-- ("CH4","C4","2025-01-04");
