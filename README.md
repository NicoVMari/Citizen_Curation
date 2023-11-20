#Citizen Curation
![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.001.png)

**Basi di dati e Sistemi Informativi: Sperimentazioni - A.A. 2022-2023** **Progettazione e realizzazione di una base di dati** 

Consegnare una relazione che illustri il lavoro effettuato per la progettazione della base di dati derivante dai requisiti indicati nella sezione “Requisiti iniziali” e che segua rigorosamente lo schema guida indicato nei file “2 Schema progettazione concettuale”, “3 Schema progettazione logica”, “4 DDL e DML”. Nella prima pagina della relazione devono essere riportati i nomi, cognomi, numeri di matricola e indirizzi e-mail dei componenti del gruppo. 

Supponendo che un gruppo sia composto dagli studenti di cognome A, B, C, si consegnino i seguenti file: 

- Un  file  “**A\_B\_C\_Relazione**”  contenente  la  relazione  (unione  dei  file  “2  Schema progettazione concettuale”, “3 Schema progettazione logica”, “4 DDL e DML”, che non dovete consegnare separatamente). 
- Tre file “**A\_B\_C\_DDL.sql**”, “**A\_B\_C\_DMLPOP.sql**”, “**A\_B\_C\_DMLUPD.sql**” contenenti gli script SQL indicati nel file “4 DDL e DML”. 

Tali file dovranno essere consegnati in una cartella compressa “**A\_B\_C.zip**” insieme al file contenente le query della parte di SQL. 

**Schema guida** 

1. **Progettazione concettuale** 
1. Requisiti iniziali (testo integrato con osservazioni fatte a partire dai file forniti)** 
1. Glossario dei termini** 
1. Requisiti riscritti** 
1. Requisiti strutturati in gruppi di frasi omogenee** 
1. Schema E-R + regole aziendali** 

Come auto-valutare il proprio schema E-R (+ business rules): 

§  *Correttezza*:  controllare  se  i  costrutti  sono  usati  propriamente.  Inoltre  nella 

stesura  dello  schema  E-R  non  bisogna  considerare  come  verrà  tradotto  in relazionale  (evitate  errori  come:  omettere  gli  identificatori  delle  entità, aggiungere  identificatori  alle  associazioni,  aggiungere  alle  associazioni  gli identificatori delle entità coinvolte, non indicare il tipo di generalizzazione, dare lo stesso nome a due entità o associazioni, usare un identificatore esterno basato su  associazioni  non  (1,1)  o  un  identificatore  basato  su  attributi  opzionali  o multivalore) 

§  *Completezza:* rileggere i requisiti iniziali e considerare se ogni informazione 

rilevante è stata rappresentata nelle entità, associazioni, attributi, identificatori, 

cardinalità  dell’E-R  o  nelle  business  rules.  Verificare  la  coerenza  degli 

identificatori delle entità e delle sottoentità gerarchiche con i requisiti riscritti. §  *Leggibilità:* L’E-R è intuitivo? I nomi dati alle entità/associazioni sono 

facilmente comprensibili? È chiaro cosa rappresentano? 

§  *Minimalità:* Sono presenti ridondanze indesiderate? È possibile rappresentare 

le stesse informazioni in modo più semplice 

1 

2. **Progettazione logica** 
1. Compilare una tavola dei volumi (motivare le scelte effettuate) 
1. Compilare una tavola delle operazioni (basandosi anche sui requisiti, includere le operazioni più rilevanti e le scelte effettuate) 
1. Ristrutturazione dello schema E-R 
1. Analisi delle ridondanze 

Per ogni ridondanza: 

Per ogni operazione significativa su cui la presenza/assenza 

della ridondanza può avere effetto: 

- Tavola degli accessi in presenza e in assenza di ridondanza 
- Confronto in spazio e tempo tra presenza e assenza di ridondanza 
- Scelta se introdurre o non introdurre la ridondanza con motivazione 
2. Eliminazione delle generalizzazioni (motivare le scelte effettuate) 
2. Eventuale partizionamento/accorpamento di entità e 

associazioni (motivare le scelte effettuate) 

4. Eventuale scelta degli identificatori principali (motivare le scelte effettuate) 
4. Schema E-R ristrutturato + regole aziendali 
4. Schema relazionale (indicare anche i vincoli di integrità referenziale) 
3. DDL di creazione del database** 
3. DML di popolamento di tutte le tabelle del database (se popolate il database con 

   dati verosimili, potreste rendervi conto di errori commessi nella fase di 

progettazione concettuale e di cui avreste dovuto rendervi conto prima)** 

5. Qualche operazione di cancellazione e modifica per verificare i vincoli e effetti causati da operazioni su chiavi esterne.** 

**Requisiti iniziali: Una notte al museo!** 

Il paradigma della *Citizen Curation* prevede una modalità di partecipazione in cui i cittadini applicano “metodi curatoriali ai materiali d'archivio disponibili nelle istituzioni della memoria al fine di sviluppare le proprie interpretazioni, condividere la propria prospettiva e apprezzare le prospettive degli altri”. 

Dopo il tempo prolungato di chiusura dovuto alla pandemia, uno degli obiettivi dei principali musei europei è quello di sviluppare nuove tecnologie e strumenti in grado di supportare i cittadini nel contribuire a interpretazioni ricche, ma anche nel condividere le riflessioni sulle interpretazioni degli altri. In particolare, si sono progettati ed implementati degli strumenti di ragionamento semantico che vengono integrati proprio dal paradigma della Citizen Curation. 

Questo  nuovo  paradigma,  contiene  la  combinazione  di  due  processi:  *interpretazione*  e riflessione. Sebbene l'interpretazione preceda concettualmente la riflessione, i due processi non sono *compartimentati*, ma piuttosto intrecciati: la riflessione si basa sull'interpretazione, ma influisce sull'interpretazione successiva, formando il processo cognitivo e continuo descritto come *Interpretation-Reflection Loop* (**IRL**). L'obiettivo dell'IRL è duplice: da un lato, stimolare la riflessione esponendo i cittadini alle interpretazioni di altri cittadini, permettendo loro di valutare  la  diversità  nella  risposta  alle  opere  d'arte;  dall'altro,  espandere  il  processo  di interpretazione come conseguenza dell'esposizione alla diversità.  

In un importante museo europeo, la curatela assume la forma dello storytelling, inteso come processo cognitivo orientato alla condivisione delle interpretazioni in una forma compatta, facilmente elaborabile e universale. Ispirandosi al formato delle storie dei social media, ben noto al gruppo target del caso di studio (cioè adolescenti e giovani adulti), i cittadini sono stimolati a interagire con la collezione del museo, creando storie personali a partire dalle opere d'arte della collezione. Lo storytelling, in questo caso, non è inteso semplicemente come l'atto di selezionare e ordinare un insieme di opere d'arte, ma implica una connessione più profonda ed emotiva con l'arte, in linea con la natura emotiva dell'esperienza estetica: per migliorare il coinvolgimento dei partecipanti con le opere d'arte, infatti, essi sono spinti a esprimere riflessioni ed emozioni personali in risposta alle opere. 

Le riflessioni personali sono limitate a un insieme di temi che sono stati riconosciuti come specificamente rilevanti per l'esperienza dell'arte e l'espressione della soggettività dai curatori, e ampiamente discussi in letteratura come ricordi, connessioni tematiche ed emozioni. Nella Citizen  Curation,  le  emozioni  sono  una  parte  importante  del  processo  di  sensemaking. Riconosciute  da  secoli  dall'estetica  come  componente  primaria  dell'esperienza  artistica,  le emozioni sono una componente intrinseca del modo in cui le persone vivono l'espressione artistica e affettiva; esse forniscono anche un linguaggio universale attraverso il quale le persone trasmettono la loro esperienza dell'arte, ben oltre le parole. Nonostante le differenze tra le lingue e  l'influenza  dei  fattori  culturali,  le  emozioni  hanno  un'origine  universale:  radicate nell'evoluzione, costituiscono la base della comunicazione interculturale. In questo senso, le emozioni possono fornire un mezzo adeguato per mettere in contatto persone appartenenti a gruppi diversi, intesi come cultura, età, istruzione e caratteristiche sensoriali differenti. 

Nella  Citizen  Curation,  questo  approccio  intende  promuovere  l'empatia,  la  coesione  e l'inclusione tra i gruppi sociali, in contrasto con le tecnologie attuali (ad esempio i social media 

- i sistemi di raccomandazione standard) che portano le persone verso contenuti che si adattano al loro punto di vista, promuovendo la frammentazione e favorendo i pregiudizi di conferma, invece della coesione, della riflessione inclusiva e del pensiero critico.  

  Occorre quindi progettare una base di dati interrogabile da dispositivi mobile, che consente agli utenti di creare narrazioni personali a partire da opere d'arte in modo semplice e intuitivo. Ad esempio, selezionando immagini di oggetti culturali di interesse per l'utente e condividendo storie su di essi (inclusi ricordi, opinioni, emoji, hashtag).  

Gli utenti, una volta registrati specificando nome, indirizzo mail (obbligatorio), data di nascita e genere (M/F), possono consultare il catalogo museale.  

Il  museo  mette  a  disposizione  una  galleria  d’arte  contemporanea  (ad  esempio,  questa https://www.gamtorino.it/it/le-collezioni/catalogo-delle-opere-online-gam)  che  permette  agli utenti di creare una storia attraverso la selezione di minimo 2 massimo 3 opere d’arte. Le opere d’arte presenti nella collezione “online”, risultano essere un sottoinsieme delle opere esposte nel museo. Viceversa, ci sono opere non esposte online ma che sono presenti nelle sale della galleria d’arte, visitabili solo “in presenza”. Solo le opere “online” che sono anche esposte anche nella galleria, possono essere commentate e far parte di storie create dagli utenti. 

Su ciascuna opera d’arte (codice dell’opera, titolo dell’opera, autore, descrizione, materiale e tecniche con cui è stata realizzata, anno di realizzazione ecc…), l’utente può aggiungere emoji e  hashtag.  Una  volta  aggiunti,  gli  emoji  e  i  tag  possono  essere  trascinati  nella  posizione desiderata dall'utente e, se necessario, scartati. In questo modo, l'opera d'arte diventa una parte intrinseca  dell'attività  creativa,  una  lavagna  su  cui  i  cittadini  e  gli  utenti  museali  possono esprimere i loro sentimenti e le loro idee sull'opera. 

![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.002.png)![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.003.jpeg)

Creazione di una storia![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.004.jpeg)![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.005.jpeg)

![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.006.png)

Annotazione di un’opera d’arte con emoji, hashtag e commenti ![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.007.jpeg)

I curatori (cittadini che sono dipendenti museali e che gestiscono la galleria d’arte), attraverso l’interazione con informatici e progettisti, hanno scelto di raccogliere alcune impressioni e commenti circa le sensazioni degli utenti. Le domande, poste dai curatori del museo a livello di opera, hanno come obiettivo l’innescare e guidare il processo interpretativo a un livello più concettuale. Queste domande, suggerite dall'esperienza dei curatori e degli educatori del museo e in linea con la teoria dell'identità narrativa, corrispondono ai ricordi personali evocati dall'opera d'arte, agli spunti tematici da essa innescati e alle sensazioni che suscita. Tuttavia, per rispettare le indicazioni fornite dagli esperti, queste domande sono state i) poste in forma affermativa ii) espresse sotto forma di modelli da completare iii) accompagnate da icone evocative. 

Per questo motivo, il modello di fase di annotazione, prevede anche che, per ciascuna opera, l’utente visitatore possa rispondere a tre domande utilizzando un campo di testo libero: 

1. Mi ricorda… 
1. Mi fa pensare a… 
1. Mi fa sentire… 

Queste domande possono essere compilate dagli utenti semplicemente inserendo una singola parola. Ad esempio, Mario Rossi può scegliere di commentare un’opera rispondendo con: 

1. Giovinezza 
1. Mare 
1. Felice 

Selezionando da 2 fino ad un massimo di 3 opere d’arte, l’utente registrato può scegliere di creare una storia personale. Una storia è caratterizzata da [2, 3] opere d’arte, da un titolo, da un commento personale, da un hashtag, da un TimeStamp che identifica l’inizio della storia (quando questa è stata creata) e da un TimeStamp di fine storia (quando questa è stata sottomessa nella base di dati rendendola persistente). Ogni storia ha una durata (in (*s*) secondi) ed è relativa ad uno e un solo utente (il proprietario che l’ha creata).  

Ciascun utente può esplorare le storie create dagli altri utenti, vedere le proprie storie e, se lo desidera,  modificarle/cancellarle.  L'esplorazione  delle  storie,  che  corrisponde  alla  fase  di riflessione del ciclo IRL, è mediata dal catalogo del museo: per vedere le storie memorizzate nella base di dati, l'utente sfoglia il catalogo e seleziona un'opera d'arte di suo interesse. Una volta scelta l'opera, l'interfaccia che interroga la base di dati, mostra il link alle storie che la contengono.  

Ogni storia può essere open e si possono vedere le opere in essa contenute, accompagnate dalle annotazioni personali aggiunte dall'utente che le ha create. Le storie possono essere apprezzate da altri utenti mediante un rating. Ciascun utente, visualizzando le storie degli altri, può scegliere di votare la storia con un voto in una scala likert da 1 a 10 (1=pessima, 10=bellissima!). 

Per alleggerire il compito di esprimere la propria risposta emotiva alle opere d'arte della storia, è  possibile  utilizzare  etichette  testuali  insieme  alle  emoji,  che  possono  essere  selezionate trascinandole sull'opera d'arte. L'utilità degli emoji risiede nel fatto che permettono all'utente di esprimere le emozioni in modo più immediato e visivo. È inoltre sempre più evidente che nei social media, sono simili a un gergo ampiamente utilizzato, soprattutto dalle nuove generazioni, e che è necessario supportarli per una migliore comprensione degli affetti nella comunicazione odierna.  

Si tratta di un tipo di comunicazione user-friendly che può essere utilizzata per esprimere impressioni in modo molto intuitivo e semplice, anche da categorie di utenti che possono avere difficoltà a produrre testi scritti su dispositivi tecnologici (come anziani, persone con disabilità 

- bambini, che generalmente non producono testi lunghi e ricchi di contenuti).  

Per queste ragioni, gli emoji possono essere funzionali a facilitare il processo di fruizione e, di conseguenza, ad aumentare il coinvolgimento dei cittadini.  Ciascuna opera d’arte, può essere commentata anche con un emoji (amore, curiosità, gioia, paura, tristezza, disgusto…). Per migliorare la diversità nell'interpretazione e nella riflessione, i curatori del museo hanno scelto di aggiungere raccomandazioni basate sulle emozioni alla creazione e all'esplorazione delle storie.  

Per ottenere raccomandazioni affettive e orientate alla diversità dalle emozioni associate dagli utenti  e  dai  curatori  alle  opere  d'arte  attraverso  le  annotazioni  (utenti),  la  generazione  di raccomandazioni  emotivamente  diverse  si  basa  sul  modello  delle  emozioni  di  Plutchik (https://en.wikipedia.org/wiki/Robert\_Plutchik)  che  combina  un  approccio  categoriale  alle emozioni, con tipi di emozione distinti come la gioia, lo stupore o la paura, con un approccio dimensionale che stabilisce le emozioni in relazioni di somiglianza e opposizione, utili per esplorare la diversità. 

In  questo  modo,  quando  un  utente  termina  la  creazione  della  propria  storia,  il  sistema  di ragionamento suggerirà le storie create dagli altri utenti che, basate sulla sua storia appena creata, avranno emozioni uguali, simili e opposte. Ciascuna storia creata dall’utente, oltre agli attributi precedenti, sarà caratterizzata da una relazione che descrive le storie (create dagli altri utenti) suggerite in modo da aumentare lo spettro emotivo dell’utente visitatore della galleria museale. 

L’utente crea una storia dal titolo “*travel through time*” e al termine, gli viene suggerita la storia “*Caos*” creata da un altro utente che ha – in questo caso – emozione opposta rispetto alla ![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.008.jpeg)![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.009.jpeg)sua. ![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.010.jpeg)

![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.011.png)

I **curatori** del museo potranno eseguire una serie di operazioni, come ad esempio 

1. Arricchire il catalogo museale con nuove opere d’arte 
1. Rimuovere un’opera dal catalogo online (e anche dalla sala espositiva, ma non necessariamente) quando un’opera è soggetta ad attività di restauro 
1. Arricchire il catalogo degli artisti/autori delle opere specificando per ogni artista il nome, cognome, data di nascita/morte (se deceduto), movimento artistico e stile pittorico (ciascun artista deve essere inserito se è autore di almeno 1 opera d’arte contenuta nella collezione museale) 
1. Creare a loro volta delle storie 
1. Visualizzare le storie create dagli utenti 
1. Eliminare le storie create dagli utenti 
1. Eliminare i commenti sia a livello di storia che a livello di opera d’arte 
1. Promuovere un utente ad utente “supervisore di gruppi” 
1. Creare gruppi di *n* utenti (magari per attività museali o attività di ricerca) 
1. Aggiungere emozioni sia a storie create dagli utenti, sia ad opere d’arte 
1. Votare le storie più belle 
12. Per fini statistici, possono ad esempio calcolare l’età media dei visitatori, la media del rating ricevuto sulle loro storie, fare una classifica delle storie più belle in ordine crescente/decrescente per età, rating, durata, ecc.. 
12. Aggregare gli utenti in modo da ottenere le storie più votare sui visitatori maschi/femmine 
12. …. un po' di fantasia! 

Gli **utenti** devono poter 

1. Registrarsi alla base di dati tramite form di registrazione inserendo nome, indirizzo mail (obbligatorio), data di nascita, genere (M/F) 
1. Accedere al catalogo museale per visualizzare le opere d’arte 
1. Selezionare opere d’arte e commentarle con hashtag, emoji, commenti testuali 
1. Creare una storia 
1. Visualizzare lo storico delle storie che hanno creato, commentato o eliminato nel corso della loro esperienza museale 
1. Votare le storie degli altri utenti selezionando un punteggio su una scala likert cardinale da 1 a 10 
1. Commentare le storie degli altri utenti (anche se non raccomandate a partire dalla loro) 
1. Una volta che l’utente esegue logout dalla piattaforma, NON può visualizzare le proprie storie e non può crearne di nuove, ma può visualizzare il catalogo della galleria museale e votare le storie create dagli altri utenti 
1. ecc… 

Gli **utenti** che appartengono a **categorie fragili** 

1. Accedono ad una piattaforma più accessibile contenente meno testo e più immagini 
1. Hanno accesso ad una descrizione audio delle opere d’arte in cui NON compaiono contenuti testuali (quali descrizione, autore, titolo dell’opera, materiali e tecniche con cui è fatta l’opera). 
1. Possono commentare le opere d’arte e le storie create dagli altri utenti SENZA rispondere alle 3 domande (“Mi ricorda...”, “Mi fa pensare…”, “Mi fa sentire…”) 
1. Possono votare le storie degli altri 

Qualsiasi altra operazione/funzionalità del sistema e/o modellazione di requisiti non descritti, purché motivata, è ben accetta! 
8 
