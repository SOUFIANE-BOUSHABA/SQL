CREATE DATABASE IF NOT EXISTS conectevent;
use conectevent;


CREATE table if not EXISTS billets (
   id_billet int PRIMARY KEY,
   id_participant int ,
   id_evenement int, 
   id_retour int ,
   TypeBillet varchar(255),
   FOREIGN KEY (id_retour) REFERENCES retours(id_retour),
   FOREIGN KEY (id_evenement) REFERENCES evenements(id_evenement),
   FOREIGN KEY (id_participant) REFERENCES participants(id_participant)
)ENGINE=InnoDB;

CREATE table if not EXISTS evenements (
   id_evenement int PRIMARY KEY,
   id_lieu int ,
   nom varchar(255),
   FOREIGN KEY (id_lieu) REFERENCES lieux(id_lieu)
)ENGINE=InnoDB;

CREATE table if not EXISTS lieux (
   id_lieu int PRIMARY KEY,
   placenom varchar(255)
)ENGINE=InnoDB;

CREATE table if not EXISTS organisateurs (
   id_organisateur int PRIMARY KEY,
   nom varchar(255)
)ENGINE=InnoDB;

CREATE table if not EXISTS organisé (
    id_organisateur int, 
    id_evenement int , 
    FOREIGN KEY (id_evenement) REFERENCES evenements(id_evenement),
    FOREIGN KEY (id_organisateur) REFERENCES organisateurs(id_organisateur) 
)ENGINE=InnoDB;

CREATE table if not EXISTS participants  (
   id_participant int PRIMARY KEY,
   nom varchar(255),
   prenom varchar(255)
)ENGINE=InnoDB;



CREATE table if not EXISTS retours (
   id_retour int PRIMARY KEY,
   montant varchar(255)
)ENGINE=InnoDB;

CREATE table if not EXISTS sponsoriser (
   id_sponsor int, 
    id_evenement int , 
    FOREIGN KEY (id_evenement) REFERENCES evenements(id_evenement),
    FOREIGN KEY (id_sponsor) REFERENCES sponsoriser(id_sponsor) 
)ENGINE=InnoDB;


CREATE table if not EXISTS sponsors  (
   id_sponsor int PRIMARY KEY,
   nom varchar(255),
)ENGINE=InnoDB;