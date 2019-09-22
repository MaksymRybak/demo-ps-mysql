use sakila;

select * from ActorSample;

-- Populate Sample Table
CREATE TABLE ActorSample (
  actor_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NULL,
  last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
				ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (actor_id)
);
INSERT INTO sakila.ActorSample (first_name,last_name,last_update)
SELECT first_name,last_name,last_update
FROM sakila.actor;

delete 
from sakila.ActorSample
where actor_id = 1;

delete 
from sakila.ActorSample
where actor_id in (2,3,4);

delete
from sakila.ActorSample
where actor_id in (select actor_id
					from film_actor
                    where actor_id between 5 and 10);

delete from sakila.ActorSample;