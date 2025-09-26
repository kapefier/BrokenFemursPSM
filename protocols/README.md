# 📊🧾🧮 SAP

Statistical Analysis Plan | Hip Fracture PSM 

*Orlando Sagliocco*

---

## 1. Titolo e obiettivo

**Titolo:**
*(Conditional) Association between surgical timing and mortality after hip fracture: a retrospective propensity score-matched cohort study (in a secondary hospital in Northern Italy).*

**Obiettivo primario:** stimare l'associazione tra intervento chirurgico precoce (es. ≤48 ore dall'ammissione) vs ritardato (\>48 ore) e la mortalità a 30 giorni.

**Obiettivi secondari:** mortalità a 90 giorni / 1 anno, complicanze post-operatorie, durata degenza (non abbiamo remmissione a 30 giorni).

## 2. Disegno e popolazione

- Disegno: studio osservazionale retrospettivo.

- Popolazione di studio: pazienti ≥65 anni con diagnosi di frattura di
  femore che hanno subito intervento chirurgico.

- Criteri di esclusione: politrauma, mancato intervento, decesso prima
  dell'intervento, dati mancanti critici (specificare).

## 3. Definizione esposizione e outcome

- **Esposizione primaria (binaria)**: intervento precoce = operato entro ≤48 ore dall'ingresso in ospedale; intervento ritardato = \>48 ore.
  
  - Nota: riportare una definizione alternativa (≤24 h) nelle
      sensitivity analyses.

- **Outcome primario:** mortalità a 30 giorni (evento binario).

- **Outcome secondari:** mortalità 90 giorni/1 anno, tempo alla morte, eventi avversi maggiori, durata degenza, reammissione.

## 4. Covariate / potenziali confondenti (da includere nel modello del PS)

- Demografiche: età (categorizzata e continua), sesso.

- Comorbilità: Charlson Comorbidity Index o singole patologie (insufficienza cardiaca, BPCO, diabete, IRC, ictus, ecc.).

- ASA score, indice di fragilità, punteggio funzione pre-frattura
  (indipendente/assistito), stato cognitivo se disponibile.

- Tipo di frattura  (intracapsulare/intertrocanterica/sottotrocanterica).

- Tipo di intervento programmato (osteosintesi / emiprostesi / protesi totale).

- Parametri clinici all'ingresso (saturazione, emoglobina, stabilità emodinamica).

- Capacità/volume dell'ospedale, reparto iniziale (pronto soccorso vs reparto) o variabili contestuali che influenzano il timing.

- Data/ora di presentazione (per tenere conto di variazioni legate a weekend/festivi) --- considerare variabile "arrivo in weekend" --- (NdR non riproducibile)

## 5. Missing

- Quantificare proporzione di dati mancanti per ogni covariata.

- Se \<5% e completamente casuali → complete-case.

- Se \>5% o non completamente casuali → usare **multiple imputation** (es.
  MICE, n imputation ≥20).

- Imputazione va fatta *prima* della stima del propensity score.

## 6. Stima del propensity score

- **Modello**: regressione logistica con esito = essere operato entro ≤48h (1 = precoce, 0 = ritardato).

- **Covariate incluse:** tutte le variabili indicate in §4 (evitare inclusione di variabili di esito o colliders).

- Considerare l'inclusione di termini non lineari (es. età\^2) o splines se ben giustificato.

- Stimare anche il ** logit(PS)** (utilizzato per caliper matching).

- Valutare discriminazione del modello (AUC) e calibrazione, ma lo scopo è bilanciamento, non previsione.

## 7. Strategia di matching

- **Approccio principale**: nearest neighbor 1:1 senza replacement con caliper = 0.2 \* SD(logit(PS)).
  
  - Se contesto ha ampia disponibilità di controlli usare 1:k (es. 1:2 o 1:3) per aumentare potenza, preferibilmente con  replacement o con matching senza replacement ma controllando  bilanciamento.

- Alternative da riportare: matching con replacement, full matching, optimal matching.

- Se si utilizza caliper, chiarire che soggetti senza match verranno esclusi (reportare N esclusi).

## 8. Diagnostica del bilanciamento

- **Metriche principali**: Standardized Mean Differences (SMD) per ciascuna covariata prima e dopo matching.
  
  - SMD \<0.1 = buon bilanciamento; valori \<0.2 possono essere accettati con giustificazione.

- Visualizzazioni: love plot (SMD pre/post), distribuzione del PS (histogram / density) per gruppo, boxplot del logit(PS).

- Tabelle di confronto (tabella 1) pre- e post-matching: medie (SD)/mediane (IQR) e frequenze (%).

- Controllare varianze outliers delle covariate.

## 9. Analisi dell'outcome (dopo matching)

- **Analisi primaria (outcome binario 30d):**
  
  - Calcolare differenza di rischio (Risk Difference), rischio relativo (Risk Ratio) e Odds Ratio con intervalli di confidenza al 95% tra i gruppi matched.
  
  - Per inferenza statistica: usare metodi che tengono conto del matching:
    
    - test di McNemar (per 1:1 paired) oppure
    - regressione logistica condizionata (conditional logistic
      regression) che tiene conto delle coppie,
    - oppure usare regressione binaria con errori standard robusti
      / cluster-robust SE raggruppando per coppia.

- **Analisi di sopravvivenza (se tempo-to-event disponibile):**
  
  - Grafici Kaplan--Meier per gruppi (post-matching) e test  log-rank.
  
  - Modellare con Cox proportional hazards con robust SE per coppia (o stratificato per coppia se appropriato).
  
  - Valutare l'assunzione di hazard proporzionali.

- **Analisi in popolazione totale (sensitivity)**: IPTW (inverse probability of treatment weighting) usando PS stabilizzati e modelli ponderati (modello di regressione con pesi) per confrontare con i
  risultati del matching.

## 10. Controllo di confondimento residuo / sensibilità

- **E-value:** stimare E-value per un effetto osservato per quantificare quanto forte un confondente non misurato dovrebbe essere per annullare l'associazione osservata.

- **Analisi alternative:** cambiare definizione di esposizione (≤24h, ≤36h, cut-off clinici diversi), cambiare caliper, usare full matching o **IPTW**.

- Se disponibile strumentale naturale (es. congestione operatoria, lista d'attesa), considerare analisi con instrumental variable (richiede assunzioni forti e specifiche).

## 11. Analisi secondarie e sottogruppi

- Sottogruppi pre-specificati: età (\>80 vs ≤80), fragilità, classe
  ASA, tipo di frattura, intervento tipo (protesi vs osteosintesi).

- Eseguire interazioni nel modello (es. timing \* età) e riportare
  p-interazione.

- Riportare risultati stratificati se interazioni significative o clinicamente rilevanti.

## 12. Sensibilità a fattori cluster (ospedale / chirurgo)

- Non applicabile.

## 13. Gestione dei soggetti senza match

- Riportare numero e caratteristiche dei soggetti esclusi per mancanza
  di match.

- Confrontare caratteristiche dei soggetti esclusi con quelli inclusi
  per valutare bias di selezione.

## 14. Tipo di significatività e confidenza

- Test a due code.

- Alfa = 0.05 (two-sided).

- Riportare intervalli di confidenza 95% per stime principali.

## 15. Calcolo della potenza (esempio)

- Esempio di calcolo per due proporzioni (30-day mortality): se
  mortalità attesa nel gruppo ritardato = 10% e si vuole rilevare una
  riduzione assoluta a 5% (cioè differenza assoluta 5 punti
  percentuali), con α=0.05 (two-sided) e potenza = 80%:
  
  - campione richiesto per gruppo ≈ **435 pazienti** → totale **≈ 870
    pazienti.**
  - (Questo è un esempio: variare p1/p2 e rapporto di matching
    cambia la potenza e il numero richiesto).

- Raccomandazione: eseguire calcoli di potenza basati sulle
  proporzioni osservate nel dataset pilota.

## 16. Output / tabelle e figure da includere nel manoscritto

- Tabella 0: flusso dei pazienti (diagramma STROBE) con inclusioni/esclusioni e numero matchati.

- Tabella 1: caratteristiche basali pre-matching (gruppo precoce vs ritardato).

- Tabella 2: caratteristiche basali post-matching (mostrare SMD).

- Tabella 3: risultati principali (RD, RR, OR, HR) con IC95.

- Figure: love plot (SMD pre/post), densità PS pre/post matching, Kaplan--Meier curve (se survival), forest plot per sottogruppi.

- Appendice: dettaglio del modello PS (coefficiente, AUC), analisi di sensibilità (IPTW, cambi di cut-off), informazioni su imputation.

## 17. Riproducibilità e trasparenza

- Fornire codice (script R) come supplemento.

- Specificare versione software e pacchetti.

- Documentare tutte le decisioni (caliper scelto, esclusioni,
  strategie di imputazione, definizione esatta di
  esposizione/outcome).

## 18. Reporting e interpretazione

- Interpretare i risultati con cautela: PSM corregge per confondimento misurato, ma non per confondenti non misurati.

- Discutere potenziali residual confounding, bias da selezione (soggetti non matchati) e limiti della misurazione del timing.

## 19. Checklist operativa

1. Pulizia dati e descrizione iniziale (frequenze, missing).

2. Imputazione (se necessaria).

3. Stima PS con regressione logistica (includere tutte le covariate pre-specified). Salvare PS e logit(PS).

4. Matching 1:1 nearest neighbor con caliper = 0.2\*SD(logitPS). Salvare dataset matched.

5. Valutare bilanciamento (SMD pre/post, love plot).

6. Analisi outcome (conditional logistic o Cox con robust SE).
    Calcolare RD, RR, HR.

7. Sensitivity analyses: IPTW, cambiare cut-off di timing, imputazioni
     alternative.

8. Sottogruppi e test di interazione.

   9. Preparare tabelle/figure e redigere sezione metodi/risultati.

#### 19.1 Esempi di statistiche da riportare (format rapido)

- Effetto principale (OR o HR): 0.75 (IC95% 0.60--0.95), p = 0.018 ---
  *esempio*.
- Differenza di rischio a 30 gg: -3.4% (IC95% -6.0% a -0.8%).
- Number Needed to Treat (NNT) = 1 / RD (se RD significativo).

# 20 Appendice 1, Letteratura di confronto

Esempio di chiave di ricerca in PubMed.

*Variante più restrittiva*

```
(\"hip fracture\"\[Title/Abstract\] OR \"femoral fracture\"\[Title/Abstract\]) AND (\"early surgery\"\[Title/Abstract\] OR \"surgical timing\"\[Title/Abstract\] OR \"delayed surgery\"\[Title/Abstract\]) AND (\"mortality\"\[Title/Abstract\] OR \"survival\"\[Title/Abstract\]) AND (\"propensity score\"\[Title/Abstract\] OR \"matching\"\[Title/Abstract\])
```

*Variante meno restrittiva*

```
*(\"hip fracture\"\[MeSH Terms\] OR \"hip fracture\"\[Title/Abstract\] OR \"femoral fracture\"\[Title/Abstract\])  AND  (\"surgical timing\"\[Title/Abstract\] OR \"time to surgery\"\[Title/Abstract\] OR \"early surgery\"\[Title/Abstract\] OR \"delayed surgery\"\[Title/Abstract\]) AND (\"mortality\"\[MeSH Terms\] OR \"mortality\"\[Title/Abstract\] OR \"survival\"\[Title/Abstract\]) AND (\"propensity score\"\[Title/Abstract\] OR \"propensity\"\[Title/Abstract\] OR \"matching\"\[Title/Abstract\])*
```

Studi che valutano la relazione tra tempistica dell'intervento chirurgico per frattura di femore e mortalità, aggiustando per fattori di confondimento tramite analisi multivariate:

```
*(\"hip fracture\"\[Title/Abstract\] OR \"femoral fracture\"\[Title/Abstract\])* *AND (\"time to surgery\"\[Title/Abstract\] OR \"surgical delay\"\[Title/Abstract\] OR \"timing of surgery\"\[Title/Abstract\] OR \"delay to surgery\"\[Title/Abstract\])* *AND (\"mortality\"\[Title/Abstract\] OR \"death\"\[Title/Abstract\] OR \"survival\"\[Title/Abstract\]) AND (\"multivariate\"\[Title/Abstract\] OR \"adjusted\"\[Title/Abstract\] OR \"regression\"\[Title/Abstract\]) NOT (\"propensity score\"\[Title/Abstract\] OR \"matching\"\[Title/Abstract\])*
```

### 20.1 Articoli rilevanti individuati

| Titolo                                                                                                        | Anno | Journal                     | Contesto e risultati                                                                                                                      | DOI                          |
| ------------------------------------------------------------------------------------------------------------- | ---- | --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| The timing of surgery and mortality in elderly hip fractures: A retrospective, multicentric cohort study      | 2014 | Indian J Orthop             | Studio su 874 pazienti >65 anni; il ritardo >7 giorni non ha aumentato significativamente la mortalità a 1 anno (HR ≈ 1.3; IC95% 0.9-1.8) | 10.4103/0019-5413.144232     |
| Time to surgery and 30-day mortality after hip fracture (Registro spagnolo SNHFR, n = 29 695)                 | 2024 | Injury                      | Pazienti ≥75 anni. Ritardi >2 giorni associati a mortalità 30-giorni maggiore (5.4 % vs 7.5 %); discriminazione debole (AUC ≈ 0.55)       | 10.1016/j.injury.2024.111653 |
| Association between time to surgery and 90-day mortality (Giappone, n = 1 734)                                | 2018 | J Orthop Sci                | Nessuna associazione significativa tra tempo da trauma/ammissione all’intervento e mortalità a 90 giorni (OR ≈ 0.9; p non significativo). | 10.1016/j.jos.2018.07.016    |
| The influence of time-to-surgery on mortality after a hip fracture (Svezia, n = 9 270)                        | 2020 | Acta Anaesthesiol Scand     | Aumento della mortalità per interventi oltre 39-48 ore; nulla se entro 24-48 h. Adjusted Cox regression analysis.                         | 10.1111/aas.13494            |
| The effect of early surgery… on 1-year mortality (Italia, n = 405 037)                                        | 2015 | BMC Geriatr                 | Intervento entro 2 giorni: HR 0.83 (IC95% 0.82-0.85), con ~5691 morti evitate. Cox regression analysis.                                   | 10.1186/s12877-015-0140-y    |
| Early mortality after hip fracture: is delay before surgery important? (studio prospettico di 2 660 pazienti) | 2005 | J Bone Joint Surg Am        | Ritardi fino a 4 giorni non aumentano mortalità a 30 giorni; ritardi >4 giorni sì (HR 2.25 a 90 giorni, HR 2.4 a 1 anno)                  | 10.2106/JBJS.D.01796         |
| Hip fracture: effectiveness of early surgery to prevent 30-day mortality (Italiano, n = 1 320)                | 2011 | Int Orthop                  | Ritardi >2 giorni associati a ~2 volte maggiore mortalità a 30 giorni (OR aggiustato ≈ 1.84; IC95% 0.97-3.49)                             | 10.1007/s00264-010-1004-x    |
| Timing of surgery … in-hospital mortality (Spagna, coorte amministrativa)                                     | 2012 | BMC Health Serv Res         | Nessuna associazione significativa tra tempistica e mortalità ospedaliera, dopo adeguamento su età, comorbidità, gravità                  | 10.1186/1472-6963-12-15      |
| The impact of time to surgery…: Does a single benchmark apply to all? (Canada, n = 12 713)                    | 2019 | Injury                      | Ogni ora di ritardo aumentava leggermente la mortalità (OR ≈ 1.03 per 30 e 90 giorni); effetto maggiore in pazienti ≥85 anni              | 10.1016/j.injury.2019.03.031 |
| Delay to surgery beyond 12 h… (studio tedesco/altro, n ≈ 10 659)                                              | 2024 | Eur J Orthop Surg Traumatol | Ritardi >12 h vs ≤12 h associati a mortalità 30-giorni significativamente maggiore (OR ≈ 1.43; p = 0.025)                                 | 10.1007/s00590-024-03997-5   |

#### Sintesi comparativa: timing della chirurgia e mortalità nella frattura di femore

##### **Cut-off entro 24 ore**

- **Germania 2024 (n ≈ 10 659)**: mortalità 30gg significativamente più alta se >12h (OR ≈ 1.43).  
  Beneficio di chirurgia molto precoce (<12h).

##### **Cut-off 24–48 ore**

- **Svezia 2020 (n = 9 270)**: rischio maggiore oltre 39–48h; nessun aumento se operati entro 24–48h.

- **Italia 2015 (n = 405 037)**: intervento entro 2 giorni riduce la mortalità a 1 anno (HR 0.83).

- **Italia 2011 (n = 1 320)**: ritardo >2 giorni raddoppia mortalità a 30gg (OR 1.84).

- **Spagna 2024 (n = 29 695)**: ritardi >2 giorni aumentano mortalità 30gg (5.4% vs 7.5%).
  
  Evidenze robuste a favore della chirurgia entro 48h.

##### Cut-off 72–96 ore

- **USA 2005 (n = 2 660)**: ritardi fino a 4 giorni non aumentano mortalità a 30gg; >4 giorni aumenta mortalità (HR ≈ 2.3–2.4 a 90gg–1 anno).

Supporta un limite massimo a 96h.

##### **Cut-off 7 giorni**

- **India 2014 (n = 874)**: ritardi >7 giorni non hanno aumentato significativamente la mortalità a 1 anno (HR ≈ 1.3; IC95% 0.9-1.8).

Studio più piccolo, risultato isolato e non confermato da altri registri.

##### **Studi senza associazione significativa**

- **Giappone 2018 (n = 1 734)**: nessuna correlazione tempo–mortalità a 90gg.

- **Spagna 2012 (coorte amministrativa)**: nessuna correlazione con mortalità intraospedaliera.

Alcuni dataset non confermano l’associazione, probabilmente per differenze metodologiche o di popolazione.

## 21. Appendice 2. Abstract  [*IMRaD style*](https://writingcenter.gmu.edu/writing-resources/imrad/abstracts-in-scientific-research-papers-imrad)

**Background**: Il timing dell'intervento chirurgico nella frattura di femore è stato associato alla mortalità, ma i risultati degli studi osservazionali sono contrastanti. La presenza di confondimento rende difficile determinare se ritardi chirurgici moderati influenzino realmente l'outcome, soprattutto in sottogruppi specifici di pazienti anziani o fragili.

**Objective**: Valutare l'associazione tra il tempo dall'ammissione all'intervento chirurgico e la mortalità post-frattura di femore, con particolare attenzione ai sottogruppi di pazienti e ai ritardi molto marcati.

**Methods**: Studio di coorte retrospettivo su pazienti ≥65 anni ricoverati per frattura di femore in un ospedale secondario tra \[anno--anno\]. L'esposizione primaria era il tempo dall'ammissione alla chirurgia, categorizzato in precoce (≤48h) vs ritardato (\>48h). L'outcome primario era la mortalità a 30 giorni. Le covariate includevano età, sesso, comorbidità (Charlson, ASA), tipo di frattura e tipo di intervento. È stato stimato il propensity score per ricevere chirurgia precoce e sono stati effettuati matching 1:1 con caliper 0.2 SD. L'analisi primaria ha utilizzato regressione logistica condizionata e modelli di sopravvivenza di Cox con robust SE. Sono state condotte analisi secondarie per sottogruppi (età ≥85 anni, ASA ≥3) e ritardi chirurgici marcati (\>72h).

**Results**: Su xxx pazienti valutati, yyy sono stati matchati (zzz coppie). La mortalità a 30 giorni non differiva significativamente tra intervento precoce e ritardato nella coorte complessiva (OR 0.95; IC95% 0.78--1.16). Tuttavia, nei pazienti ≥85 anni con ritardo chirurgico \>72h, la mortalità era significativamente più alta (OR 1.82; IC95% 1.21--2.74). Analisi di sopravvivenza confermavano risultati simili. Sensitivity analyses confermavano la robustezza dei risultati.

**Conclusions**: L'intervento precoce non sembra influenzare la mortalità nella popolazione generale di pazienti con frattura di femore. Tuttavia, ritardi chirurgici molto marcati negli anziani più fragili sono associati a un aumento significativo della mortalità. Questi dati supportano strategie cliniche mirate per ridurre ritardi chirurgici in sottogruppi ad alto rischio.

## 22. Appendice 3. Checklist STROBE - Studio osservazionale (coorte)

| Sezione / Item                  | Raccomandazione STROBE                                         | Applicazione                                                                                                                                                                                                                    |
| ------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Titolo e abstract               | Indicare chiaramente disegno (studio di coorte osservazionale) | “(Conditional) Association between surgical timing and mortality after hip fracture: a retrospective propensity score-matched cohort study in a secondary hospital in Northern Italy”                                           |
| Introduzione – Background       | Spiegare contesto e razionale                                  | Ritardo chirurgico in frattura di femore = outcome peggiori; evidenza non univoca; importanza di ridurre bias da confondimento.                                                                                                 |
| Introduzione – Obiettivi        | Obiettivi specifici, ipotesi                                   | Valutare associazione tra intervento ≤48h vs >48h e mortalità a 30 giorni (primario). Secondari: mortalità a 90gg, 1 anno.                                                                                                      |
| Metodi – Disegno                | Specificare tipo di studio                                     | Studio di coorte osservazionale retrospettivo.                                                                                                                                                                                  |
| Metodi – Setting                | Luogo, periodo, contesto                                       | Ospedale Pesenti Fenaroli (ASST Bergamo Est) di Alzano Lombardo (Bergamo, Italy), anni 20..–20.., pazienti consecutivi con frattura di femore ricoverati e operati.                                                             |
| Metodi – Partecipanti           | Criteri di eleggibilità, fonti                                 | Inclusione: pazienti ≥65 anni con frattura di femore trattata chirurgicamente. Esclusione: politrauma, decesso pre-operatorio, dati mancanti critici.                                                                           |
| Metodi – Variabili              | Definizione esposizione, outcome, confondenti                  | Esposizione: tempo dall’ammissione all’intervento ≤48h vs >48h. Outcome: mortalità 30 giorni. Confondenti: età, sesso, comorbidità (Charlson, ASA), tipo frattura/intervento, stato funzionale, variabili cliniche d’ingresso.  |
| Metodi – Fonti dati/misure      | Come sono state misurate variabili                             | Cartelle cliniche elettroniche; registri amministrativi ospedalieri; follow-up tramite registro anagrafe per mortalità.                                                                                                         |
| Metodi – Bias                   | Strategie per limitarlo                                        | Uso di Propensity Score Matching per bilanciare covariate tra gruppi; analisi multivariata e sensitivity (IPTW).                                                                                                                |
| Metodi – Dimensione campione    | Come è stato deciso                                            | Calcolo basato su differenza minima clinicamente rilevante di mortalità a 30 gg (es. 10% vs 5%, potenza 80%, α=0.05 → ~870 pazienti).                                                                                           |
| Metodi – Variabili quantitative | Gestione variabili continue                                    | Età come variabile continua e per categorie (>80 vs ≤80). ASA score come ordinale.                                                                                                                                              |
| Metodi – Metodi statistici      | Tutti i metodi usati                                           | 1) Stima PS con logistica; 2) Matching 1:1 caliper 0.2 SD(logitPS); 3) Bilanciamento con SMD; 4) Analisi outcome con logistica condizionata e Cox robust SE; 5) Sensitivity: IPTW, sottogruppi, definizioni alternative timing. |
| Risultati – Partecipanti        | Numeri a ogni stadio                                           | Flusso: N arruolati → esclusi → inclusi → matchati → analizzati. Diagramma STROBE.                                                                                                                                              |
| Risultati – Descrizione dati    | Caratteristiche basali                                         | Tabella 1 (pre-match), Tabella 2 (post-match con SMD).                                                                                                                                                                          |
| Risultati – Outcome principali  | Numeri eventi, stime, IC95%                                    | Mortalità 30 gg: precoce vs tardivo, OR/HR con IC95. Grafico Kaplan-Meier.                                                                                                                                                      |
| Risultati – Analisi addizionali | Sottogruppi, sensitivity                                       | Analisi stratificate (età, ASA, tipo frattura), IPTW, cut-off alternativi (≤24h).                                                                                                                                               |
| Discussione – Sintesi risultati | Principali risultati con confronto letteratura                 | Intervento precoce associato a riduzione mortalità a 30 gg; confronto con studi simili in Europa e Italia.                                                                                                                      |
| Discussione – Limiti            | Fonti di bias, confondimento residuo                           | Residual confounding, dati mancanti, generalizzabilità limitata a setting locale.                                                                                                                                               |
| Discussione – Interpretazione   | Implicazioni cliniche                                          | Conferma importanza di chirurgia precoce in alcune condizioni (?); supporto o antitesi a linee guida nazionali.                                                                                                                 |
| Generalizzabilità               | Applicabilità risultati                                        | Applicabili a pazienti anziani con frattura di femore in contesti ospedalieri simili.                                                                                                                                           |
| Altri                           | Finanziamenti, conflitti                                       | Finanziamenti: nessuno. COI: da scrivere.                                                                                                                                                                                       |
