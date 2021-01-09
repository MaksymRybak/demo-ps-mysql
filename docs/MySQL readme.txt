link al corso https://app.pluralsight.com/library/courses/mysql-fundamentals-part1

uso istanza di MySQL sul Docker lanciabile in locale: docker run -p 3306:3306 --name docker-mysql -e MYSQL_ROOT_PASSWORD=pluralsight -d mysql:latest
Workbench e' il tool (GUI) piu' usato con MySQL, installato la ver 8.0
Introduzione
	show databases;
MySQL Workbench (tutte le operazioni sono facilmente eseguibili dal Workbench, elenco sotto solo un recap)
	selezionare i dati
	aggiornare i dati
	aprire e eseguire file *.sql
	inserimento nuove righe
	eliminazione dati
	visualizzare e modificare la definizione di colonne
	creazione dello snippet
		possiamo usare o creare nuovi template di DDL/DML, facilita la creazione di piu' comuni script SQL
	finestra output
	modellamento dei dati
		possiamo eseguire il reverse engineering di schema gia' presenti a DB
		viene creata uno schema ER (ricordiamoci di eseguire autolayout per posizionare oggetti DB in modo organizzato nella finestra di layout) che ci consente vedere le relazioni delle tabelle
	amministrazione
		utenti e privilegi, export/import dati, configurazione delle prestazioni
		variabili del db e del sistema, log
		etc..
Recupero dei dati (select)
	SELECT statement
		select .. from .. where .. order .. limit .. (NOTA: limit viene usato per limitare il num di record in output)
	vedi scripts nel repo
Modifica dei dati (insert, update, delete)
	vedi scripts nel repo
	NOTA: ricordiamoci del Safe Mode che possiamo impostare in Workbench in modo da bloccare le operazioni di Update e Delete massive
Joins, Unions e Subqueries
	inner join
		ritorna i record che sono presenti in piu' tabelle
		specifichiamo sia il nome della tabella che quello della colonna di join, in modo da evitare l'ambiguita
		sintassi implicita (obsoleta, elencando le tabelle in FROM) e esplicita (quella da usare, es. INNER JOIN)
		(vedi demo nella folder del corso)
	outer join
		ci sono 3 tipi: left, right e full outer join
		la parola outer e' opzionale!
		left join
			ritorna tutte le righe che sono presenti sia nella tabella di sx che quella di dx + se nella tabella di dx (destra) non c'e' la riga corrispondente, vengono ritornati valori NULL x ogni colonna
		right join
			ritorna tutte le righe che sono presenti sia nella tabella di dx che quella di sx + se nella tabella di sx (sinistra) non c'e' la riga corrispondente, vengono ritornati valori NULL x ogni colonna
		full join
			combina left join e right join
			praticamente abbiamo tutte le righe che metchano sia nella tabella di sx che quella di dx + le righe che non metchano nella tabella di sx + righe che non metchano nella tabella di dx
			NOTA: MySQL NON supporta full join, dobbiamo usare separatamente left join e right join unendo i risultati con union!
		(vedi demo nella folder del corso)
	cross join
		e' un join cartesiano che non necessita' una condizione di join
		il result set final contiene le righe che sono multipli del numero di righe della tabella di sx e quella di dx
		es. tabella di sx ha 5 righe, tabella di dx ha 6 righe, il risultato finale conterra' 30 righe (5*6, in modo che 30 sia un numero multiplo di 5 e 6)
		praticamente ogni riga della tabella di sx viene riportata in output con ogni singola riga della tabella di dx!!!
		(vedi demo nella folder del corso)
	equi join 
		viene usato solo il simbolo di ugualianza nel predicato JOIN (es: ..=..)
		NON equi join, al contratio, non usa = nel predicato JOIN (es: ..>..)
	self join 
		quando una tabella fa il join con se stessa
		qui odbbiamo usare alias x dare un id diverso, x evitare ambiguita
	natural join
		join che unisce due o piu' tabelle usando colonne con lo stesso nome in entrambe le tabelle (possiamo usare "natural join", "natural left join", "natural right join")
		qui non specifichiamo le condizioni di join - join avviene usando colonne con stesso nome in tabelle in join
		questo tipo di join crea confusione, non vediamo le colonne usate x fare il join
		da non usare, dando priorita' all'inter / left / right joins
	join usando la parola chiave USING
		semplifica join / outer join delle tabelle che hanno lo stesso nome
		es. ... inner join tbl2 using (id, value)
		e' un short cut!
	union operator
		combina due o piu' risultati di una select nello stesso result set
		il numero di colonne deve essere lo stesso in tutti select
		union, rimuove righe dupplicate
		union all, NON rimuove righe dupplicate
		possiamo usare solo un ORDER BY x ordinare il risultato (per es. nell'ultima SELECT!)
		possiamo usare union per simulare full outer join
	subqueries
		e' una sotto query, dove il risultato di una query puo' essere usato nell'altra tramite un operatore relazionale o una funzione di aggregazione
		usiamo parentesi ( ... )
		order by NON e' consentito
		possiamo innestare piu' volte le sub queries in altre sub queries
		sono usati nelle clausole come WHERE, HAVING, FROM e SELECT 
		(vedi demo nella folder del corso)
		NOTA: sub query ci consente di seguire un path (percorso) nei nostri dati leggendo un diagramma ER
			  facendo N sotto query dove ognuna e' innestata a quella di prima, riusciamo risalire al dato necessario
		possiamo rescrivere le sub query usando i join!!!
	join vs subqueries
		usando i join noi possiamo accedere alle colonne di tutte le tabelle in join, quello che non si puo' fare con query innestate
			con sub query possiamo accedere solo alle colonne della tabella piu' outer - parliamo delle colonne che possiamo mettere nella select finale
		join sono piu' facili da leggere e piu' intuitive
		se possiamo evitare le subquery e' meglio farlo, invece subquery puo' essere usata per aggregare i dati necessari alla master query 
		subquery puo' semplificare una query lunga
	subquery correllate
		e' la sottoquery che viene eseguita una volta per ogni record 
		per es. nella clausola where abbiamo una subquery che nella clausola WHERE referenzia una colonna della select esterna 
		rispetto le subqueries viste prima, qui abbiamo un legame tra i singoli record, invece la sottoquery di prima non ha nessuna claudola WHERE!
Funzioni MySQL
	funzioni scalari
		opera su un singolo valore e ritorna un singolo valore
	funzione string based
		vedi la doc ufficiale per tutte le fns
	funzioni numeriche
		vedi la doc ufficiale per tutte le fns
	funzioni date time
		vedi la doc ufficiale per tutte le fns
	control flow functions
		vedi lo script nel repo (if(), ifnull(), nullif(), case when else)
	funzioni di casting
		cast
		convert
		NOTA: convert offre piu' funzionalita' rispetto cast
	information fns
		vedi doc ufficiale + lo script nel repo
	vari fns
		vedi doc ufficiale + lo script nel repo
	fns di aggregazione 
		vedi doc ufficiale + lo script nel repo
		NOTA: sono ignorati i valori null, tranne la fn count()
		richiedono group by!
		vedi lo script nel repo
Viste MySQL
	introduzione
		e' una tabella virtuale
		e' uno statement select salvato come un oggetto nel DB
		tabelle usate nella view sono chiamate tabelle di base
		dati sono recuperati dal DB a runtime
		MySQL supporta view innestate, cioe', possiamo referenziare altre view dalle view stesse
		MySQL NON supporta le view materializzate, cioe', quelle che salvano i dati nel DB
	le view aiutano a nascondere la logica complessa
	possiamo aumentare la sicurezza usando le view, per es. se mettiamo dei filtri nella clausola WHERE della view, tutti gli utilizzatori della view non vedranno i dati al di fuori di record filtrati
		idem x quanto riguarda le colonne, vediamo solo le colonne esposte dalla view
	le viste possano essere usate in insert, update e delete, ma con queste limitazioni
		nessun group by, distinct, having, union, subquery nella select
		nessuna view non aggiornabile usata all'interno
		sottoquery nella clausola where che referenzia la tabella della clausola from della query padre		
		cmq le view aggiornabili sono usate poco
		NOTA: questo metodo cmq consente di vincolare utilizzatore di aggiornare i dati usando le viste messe a disposizione dal DB, si da per scontato che le viste sono aggiornabili!
	viste con opzione CHECK
		consentono di evitare ad aggiornare i dati in modo che "spariscono" dal risultato della view
			praticamente la condizione nella clausola WHERE della view limita insert/update eseguibili sulla vista aggiornabile
			NOTA: invece non viene eseguito il CHECK se viene eseguito il DELETE
		viene aggiunta la riga "WITH CHECK OPTION" alla fine dello script della view.
Stored procedures and Stored functions
	parliamo di stored proc (chiamabili dalle app che hanno permessi di accedere), stored fns (chiamabili dalla clausola select), trigger (rispondono a insert, update e delete sulle tabelle),
	event (eseguito in modalita' schedulata, in un determminato momento di tempo)
	stored procedures
		sono delle routine disponibili per le app che accedono al DB
		contengono uno o piu' statement 
		tipicamente usati per la validazione dei dati o controllo di accesso ai dati
		parametri usati per passare i dati dal programma esterno
		vantaggi di usare SP:
			possano ridurre overhead
			possano ridurre il traffico dati (elaborazini eseguiti a livello di DB)
			possano incapsulare la logica di business (aumentiamo la security e integrata dei dati)
			delegazione dei permessi, usiamo SP e non un accesso diretto alle tabelle
			protezione da SQL Injection (i parametri passati sono validati dal motore del DB)
		parametri, parametri di IN e OUT, drop procedure if exists, etc.. vedi lo script nel repo.
	stored functions
		contengono il codice procedurale eseguibile
		NON si puo' usare insert / update / delete!
		MySQL supporta i valori scalari
		sono simili alle funzioni built-in
	diff. tra le stored proc e functions:
		- SP possano ritornare piu' valori, FN solo un valore scalare
		- SP puo' avere i params di IN e OUT, FN solo input params
		- SP non si puo' usare in SELECT, FN si
		- SP possano chiamare FN, FN non possano chiamare SP
		- SP possano non ritornare nessun valore, FN devono ritornare un valore
		- SP supportano le letture e modifiche, FN solo le letture
		- in SP possiamo usare Transaction Management (sono anche piu' performanti), in FN no
Trigger e eventi
	trigger
		eseguiti per ogni insert/update/delete, per ogni riga
		OLD e' la variabile che contiene la riga aggiornata/cancellata
		NEW e' la variabile che contiene la riga inserita o aggiornata (nuovi valori)
		abbiamo BEFORE e AFTER triggers
		(vedi esempi nel repo)
	events
		eseguiti automaticamente, in base allo schedular di eventi
		esecuzione di un evento spesso nominato anche "event firing"
		evento puo' essere sia one time che un evento ripetitivo
		l'obiettivo principale e' eseguire operazioni di manutenzione del DB
		(vedi esempi nel repo)
	
		
		
