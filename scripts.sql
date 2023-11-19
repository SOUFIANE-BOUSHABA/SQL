CREATE DATABASE IF NOT EXISTS conectevent;
use conectevent;

CREATE table if not EXISTS lieux (
   id_lieu int PRIMARY KEY AUTO_INCREMENT,
   placenom varchar(255)
)ENGINE=InnoDB;

CREATE table if not EXISTS organisateurs (
   id_organisateur int PRIMARY KEY AUTO_INCREMENT,
   nom varchar(255)
)ENGINE=InnoDB;



CREATE table if not EXISTS participants  (
   id_participant int PRIMARY KEY AUTO_INCREMENT,
   nom varchar(255),
   prenom varchar(255)
)ENGINE=InnoDB;



CREATE table if not EXISTS retours (
   id_retour int PRIMARY KEY AUTO_INCREMENT,
   montant varchar(255)
)ENGINE=InnoDB;


CREATE table if not EXISTS sponsors  (
   id_sponsor int PRIMARY KEY AUTO_INCREMENT,
   nom varchar(255)
)ENGINE=InnoDB;


CREATE table if not EXISTS evenements (
   id_evenement int PRIMARY KEY AUTO_INCREMENT,
   id_lieu int ,
   nom varchar(255),
   FOREIGN KEY (id_lieu) REFERENCES lieux(id_lieu)
)ENGINE=InnoDB;


CREATE table if not EXISTS billets (
   id_billet int PRIMARY KEY AUTO_INCREMENT,
   id_participant int ,
   id_evenement int, 
   id_retour int ,
   TypeBillet varchar(255),
   FOREIGN KEY (id_retour) REFERENCES retours(id_retour),
   FOREIGN KEY (id_evenement) REFERENCES evenements(id_evenement),
   FOREIGN KEY (id_participant) REFERENCES participants(id_participant)
)ENGINE=InnoDB;




CREATE table if not EXISTS organisé (
    id_organisateur int, 
    id_evenement int , 
    PRIMARY KEY (id_evenement,id_organisateur),
    FOREIGN KEY (id_evenement) REFERENCES evenements(id_evenement),
    FOREIGN KEY (id_organisateur) REFERENCES organisateurs(id_organisateur) 
)ENGINE=InnoDB;


CREATE table if not EXISTS sponsoriser (
   id_sponsor int, 
    id_evenement int , 
    PRIMARY KEY (id_sponsor , id_evenement),
    FOREIGN KEY (id_evenement) REFERENCES evenements(id_evenement),
    FOREIGN KEY (id_sponsor) REFERENCES sponsors(id_sponsor) 
)ENGINE=InnoDB;




INSERT INTO lieux (placenom) VALUES
('errachidia'),
('yousoufia '),
('casa');

INSERT INTO organisateurs (nom) VALUES
('soufian'),
('karim'),
('issam');

INSERT INTO participants (nom, prenom) VALUES
('said', 'saidi'),
('khalid', 'khalidi'),
('karim', 'karimi');

INSERT INTO retours (montant) VALUES
('100'),
('200'),
('300');


INSERT INTO sponsors (nom) VALUES
('coca'),
('samsung'),
('sidi ali');

INSERT INTO evenements (id_lieu, nom) VALUES
(1, 'Event1'),
(2, 'Event2'),
(3, 'Event3');


INSERT INTO billets (id_participant, id_evenement, id_retour, TypeBillet) VALUES
(1, 1, 1, 'VIP'),
(2, 2, 2, 'VIP1'),
(3, 3, 3, 'VIP2');


INSERT INTO organisé (id_organisateur, id_evenement) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO sponsoriser (id_sponsor, id_evenement) VALUES
(1, 1),
(2, 2),
(3, 3);


SELECT evenements.*, lieux.placenom 
FROM evenements 
JOIN lieux  ON evenements.id_lieu = lieux.id_lieu;
