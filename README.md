# Citizen Curation
![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.001.png)
![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 001](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/d88735a6-cf75-4f7a-b35a-11479a96b6ed)


**Basi di dati e Sistemi Informativi: Sperimentazioni - A.A. 2022-2023** **Progettazione e realizzazione di una base di dati** 

Occorre quindi progettare una base di dati interrogabile da dispositivi mobile, che consente agli utenti di creare narrazioni personali a partire da opere d'arte in modo semplice e intuitivo. Ad esempio, selezionando immagini di oggetti culturali di interesse per l'utente e condividendo storie su di essi (inclusi ricordi, opinioni, emoji, hashtag).  

Gli utenti, una volta registrati specificando nome, indirizzo mail (obbligatorio), data di nascita e genere (M/F), possono consultare il catalogo museale.  

Il  museo  mette  a  disposizione  una  galleria  d’arte  contemporanea  (ad  esempio,  questa https://www.gamtorino.it/it/le-collezioni/catalogo-delle-opere-online-gam)  che  permette  agli utenti di creare una storia attraverso la selezione di minimo 2 massimo 3 opere d’arte. Le opere d’arte presenti nella collezione “online”, risultano essere un sottoinsieme delle opere esposte nel museo. Viceversa, ci sono opere non esposte online ma che sono presenti nelle sale della galleria d’arte, visitabili solo “in presenza”. Solo le opere “online” che sono anche esposte anche nella galleria, possono essere commentate e far parte di storie create dagli utenti. 

Su ciascuna opera d’arte (codice dell’opera, titolo dell’opera, autore, descrizione, materiale e tecniche con cui è stata realizzata, anno di realizzazione ecc…), l’utente può aggiungere emoji e  hashtag.  Una  volta  aggiunti,  gli  emoji  e  i  tag  possono  essere  trascinati  nella  posizione desiderata dall'utente e, se necessario, scartati. In questo modo, l'opera d'arte diventa una parte intrinseca  dell'attività  creativa,  una  lavagna  su  cui  i  cittadini  e  gli  utenti  museali  possono esprimere i loro sentimenti e le loro idee sull'opera. 

![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.002.png)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 002](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/9b9d88f0-fa60-4dea-b3b6-e0e931cecc23)
![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.003.jpeg)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 003](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/278e1588-b2a8-40e8-850c-b1c39d9943fa)


Creazione di una storia![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.004.jpeg)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 004](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/941ab155-51ea-42f5-9365-30ffa8a899d2)
![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.005.jpeg)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 005](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/b3ce30f5-502d-43ed-95c9-9c6e6f08ce24)


![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.006.png)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 006](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/59d79e3c-328b-4824-b777-c148f3b3a0d9)


Annotazione di un’opera d’arte con emoji, hashtag e commenti ![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.007.jpeg)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 007](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/7fdac553-0dda-494a-bb71-adcdd97ed57e)


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

L’utente crea una storia dal titolo “*travel through time*” e al termine, gli viene suggerita la storia “*Caos*” creata da un altro utente che ha – in questo caso – emozione opposta rispetto alla ![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.008.jpeg)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 008](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/4cede158-b3ca-46fc-91df-58d0ee29388f)
![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.009.jpeg)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 009](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/73f2cf91-de49-4c28-a88c-4d4c97b1562d)
sua. ![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.010.jpeg)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 010](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/9a7ae7dc-07d9-4cc6-9cb0-d9b39901cdd8)


![](Aspose.Words.340659f5-8805-4c3b-bd1e-36b0ee5c83b0.011.png)![Aspose Words 340659f5-8805-4c3b-bd1e-36b0ee5c83b0 011](https://github.com/NicoVMari/Citizen_Curation/assets/96552280/b15e7f5b-519b-40a3-baa5-23bb20e611c6)


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

<p align="center">
  <img src="https://github.com/NicoVMari/Citizen_Curation/assets/96552280/af4e16fe-9d52-4890-aef3-2f0d679c356a" alt="Testo alternativo" />
</p>


