# Statistical Analysis Plan
**Femori Alzano PSM**  
**Orlando Sagliocco**

---

## 1. Titolo e obiettivo
**Titolo:**  
(Conditional) Association between surgical timing and mortality after hip fracture: a retrospective propensity score-matched cohort study (in a secondary hospital in Northern Italy).

**Obiettivo primario:**  
Stimare l’associazione tra intervento chirurgico precoce (≤48 ore dall’ammissione) vs ritardato (>48 ore) e mortalità a 30 giorni.

**Obiettivi secondari:**  
- Mortalità a 90 giorni / 1 anno  
- Complicanze post-operatorie  
- Durata degenza (non abbiamo readmission a 30 giorni)

---

## 2. Disegno e popolazione
- **Disegno:** studio osservazionale retrospettivo  
- **Popolazione di studio:** pazienti ≥65 anni con frattura di femore operati  
- **Criteri di esclusione:** politrauma, mancato intervento, decesso prima dell’intervento, dati mancanti critici (specificare)

---

## 3. Definizione esposizione e outcome
- **Esposizione primaria (binaria):**  
  - Precoce: ≤48 ore dall’ingresso  
  - Ritardato: >48 ore  
  - Nota: definizione alternativa ≤24 h per sensitivity analyses
- **Outcome primario:** mortalità a 30 giorni (binario)  
- **Outcome secondari:** mortalità 90 giorni / 1 anno, tempo alla morte, eventi avversi maggiori, durata degenza, readmission

---

## 4. Covariate / potenziali confondenti
- **Demografiche:** età (categorizzata e continua), sesso  
- **Comorbilità:** Charlson Comorbidity Index o singole patologie  
- **ASA score, indice di fragilità, punteggio funzione pre-frattura, stato cognitivo se disponibile**  
- **Tipo di frattura:** intracapsulare / intertrocanterica / sottotrocanterica  
- **Tipo di intervento:** osteosintesi / emiprostesi / protesi totale  
- **Parametri clinici all’ingresso:** saturazione, emoglobina, stabilità emodinamica  
- **Capacità/volume ospedale, reparto iniziale**  
- **Data/ora di presentazione:** includere variabile “arrivo in weekend”

---

## 5. Gestione dati mancanti
- Quantificare proporzione mancanti per covariata  
- se <5% e casuali → complete-case  
- se >5% o non casuali → multiple imputation (MICE, n imputation ≥20)  
- Imputazione va fatta prima della stima del propensity score

---

## 6. Stima del propensity score
- **Modello:** regressione logistica (esito = operato ≤48 h)  
- **Covariate:** tutte quelle indicate in §4  
- Possibile inclusione termini non lineari (età², splines)  
- Stimare logit(PS) per caliper matching  
- Valutare discriminazione (AUC) e calibrazione (scopo = bilanciamento)

---

## 7. Strategia di matching
- **Principale:** nearest neighbor 1:1 senza replacement, caliper = 0.2 * SD(logit(PS))  
  - Alternative: 1:k matching, matching con replacement, full matching, optimal matching  
- Chiarire esclusione soggetti senza match

---

## 8. Diagnostica del bilanciamento
- **Metriche:** Standardized Mean Differences (SMD), <0.1 = buon bilanciamento  
- **Visualizzazioni:** love plot, distribuzione PS (histogram/density), boxplot logit(PS)  
- **Tabelle:** confronto pre/post-matching (medie, SD, mediane, IQR, frequenze)  
- Controllare varianze e outliers

---

## 9. Analisi dell’outcome (dopo matching)
- **Analisi primaria (30d binario):** RD, RR, OR con IC95%  
  - Test di McNemar (1:1), regressione logistica condizionata, oppure regressione con robust SE  
- **Analisi sopravvivenza:** Kaplan–Meier, log-rank, Cox proportional hazards (robust SE o stratificato)  
- **Analisi popolazione totale (sensitivity):** IPTW con PS stabilizzati

---

## 10. Controllo confondimento residuo / sensibilità
- **E-value** per effetto osservato  
- **Analisi alternative:** cut-off esposizione diversi, caliper, full matching, IPTW  
- **Instrumental variable** se disponibile

---

## 11. Analisi secondarie e sottogruppi
- Sottogruppi: età (>80 vs ≤80), fragilità, ASA, tipo frattura, intervento  
- Interazioni nel modello (es. timing*età) e p-interazione  
- Riportare risultati stratificati se clinicamente rilevanti

---

## 12. Sensibilità a fattori cluster
- Non applicabile

---

## 13. Gestione soggetti senza match
- Numero e caratteristiche soggetti esclusi  
- Confronto con inclusi per valutare bias

---

## 14. Tipo di significatività e confidenza
- Test a due code, α=0.05  
- IC95% per stime principali

---

## 15. Calcolo della potenza (esempio)
- Differenza mortalità 10% → 5%, α=0.05, potenza 80% → ~435 per gruppo, totale ~870  
- Raccomandazione: usare proporzioni osservate dataset pilota

---

## 16. Output / tabelle e figure
- **Tabella 0:** flusso pazienti (STROBE)  
- **Tabella 1:** caratteristiche basali pre-matching  
- **Tabella 2:** caratteristiche post-matching (SMD)  
- **Tabella 3:** risultati principali (RD, RR, OR, HR)  
- **Figure:** love plot, densità PS, Kaplan–Meier, forest plot sottogruppi  
- **Appendice:** dettagli modello PS, analisi sensitivity, imputazione

---

## 17. Riproducibilità e trasparenza
- Codice R come supplemento  
- Versione software e pacchetti  
- Documentare decisioni (caliper, esclusioni, imputazioni, definizioni)

---

## 18. Reporting e interpretazione
- PSM corregge per confondimento misurato, non non misurato  
- Discussione bias residuo, selezione soggetti, limiti misurazione timing

---

## 19. Checklist operativa
1. Pulizia dati, descrizione iniziale  
2. Imputazione se necessaria  
3. Stima PS con regressione logistica  
4. Matching 1:1 nearest neighbor caliper 0.2 SD(logitPS)  
5. Valutare bilanciamento (SMD, love plot)  
6. Analisi outcome (conditional logistic / Cox)  
7. Sensitivity: IPTW, cut-off alternativi, imputazioni  
8. Sottogruppi e test interazione  
9. Preparare tabelle/figure, redigere metodi/risultati

**Esempi statistici:**  
- OR o HR: 0.75 (IC95% 0.60–0.95), p=0.018  
- Differenza rischio 30 gg: -3.4% (IC95% -6.0% a -0.8%)  
- NNT = 1 / RD (se RD significativo)

---

## Appendice 1 – Letteratura di confronto
**Chiave di ricerca PubMed:**  
- Variante restrittiva:  
`("hip fracture"[Title/Abstract] OR "femoral fracture"[Title/Abstract]) AND ("early surgery"[Title/Abstract] OR "surgical timing"[Title/Abstract] OR "delayed surgery"[Title/Abstract]) AND ("mortality"[Title/Abstract] OR "survival"[Title/Abstract]) AND ("propensity score"[Title/Abstract] OR "matching"[Title/Abstract])`  
- Variante ampia:  
`("hip fracture"[MeSH Terms] OR "hip fracture"[Title/Abstract] OR "femoral fracture"[Title/Abstract]) AND ("surgical timing"[Title/Abstract] OR "time to surgery"[Title/Abstract] OR "early surgery"[Title/Abstract] OR "delayed surgery"[Title/Abstract]) AND ("mortality"[MeSH Terms] OR "mortality"[Title/Abstract] OR "survival"[Title/Abstract]) AND ("propensity score"[Title/Abstract] OR "propensity"[Title/Abstract] OR "matching"[Title/Abstract])`  

**Esempi articoli:**  
| Titolo | Anno | Journal | Contesto e risultati | DOI |
|--------|------|--------|--------------------|-----|
| The timing of surgery and mortality in elderly hip fractures | 2014 | Indian J Orthop | 874 pazienti >65; ritardo >7 gg non aumenta mortalità a 1 anno | 10.4103/0019-5413.144232 |
| Time to surgery and 30-day mortality (SNHFR, n=29,695) | 2024 | Injury | Ritardi >2 giorni mortalità 30-giorni maggiore | 10.1016/j.injury.2024.111653 |
| Association between time to surgery and 90-day mortality (Giappone, n=1,734) | 2018 | J Orthop Sci | Nessuna associazione significativa a 90 giorni | 10.1016/j.jos.2018.07.016 |
*(…continua per gli altri articoli…)*

---

## Appendice 2 – Abstract IMRaD
**Background:**  
Il timing dell’intervento nella frattura di femore è associato a mortalità, ma risultati contrastanti.  

**Objective:**  
Valutare associazione tra tempo ammissione-chirurgia e mortalità, con attenzione a sottogruppi e ritardi marcati.  

**Methods:**  
Cohorte retrospettiva pazienti ≥65 anni. Esposizione: precoce ≤48h vs ritardato >48h. Outcome primario: mortalità 30 giorni. Covariate: età, sesso, comorbidità, tipo frattura/intervento. PS matching 1:1 caliper 0.2 SD. Analisi: regressione logistica condizionata, Cox robust SE. Analisi secondarie: sottogruppi e ritardi >72h.  

**Results:**  
Su xxx pazienti, yyy matchati (zzz coppie). Mortalità 30 giorni non differiva (OR 0.95; IC95% 0.78–1.16). Pazienti ≥85 anni con ritardo >72h: mortalità più alta (OR 1.82; IC95% 1.21–2.74). Sensitivity confermava robustezza risultati.  

**Conclusions:**  
Chirurgia precoce non influenza mortalità generale, ma ritardi marcati negli anziani fragili aumentano mortalità. Supporta strategie per ridurre ritardi in sottogruppi ad alto rischio.

---

## Appendice 3 – Checklist STROBE

| Sezione / Item | Raccomandazione STROBE | Applicazione |
|----------------|-----------------------|-------------|
| Titolo e abstract | Indicare tipo studio | “(Conditional) Association between surgical timing and mortality after hip fracture: a retrospective propensity score-matched cohort study” |
| Introduzione – Background | Contesto e razionale | Ritardo chirurgico = outcome peggiori; evidenza non univoca |
| Introduzione – Obiettivi | Obiettivi, ipotesi | Associazione ≤48h vs >48h e mortalità 30 gg |
| Metodi – Disegno | Tipo studio | Coorte osservazionale retrospettiva |
| Metodi – Setting | Luogo, periodo | Ospedale Pesenti Fenaroli, Alzano Lombardo, [anno–anno] |
| Metodi – Partecipanti | Criteri eleggibilità | Pazienti ≥65 anni; esclusioni: politrauma, decesso pre-operatorio, dati mancanti critici |
| Metodi – Variabili | Definizione esposizione/outcome | Esposizione ≤48h vs >48h; mortalità 30 giorni; confondenti: età, sesso, comorbidità, tipo frattura/intervento, stato funzionale, clinica d’ingresso |
| Metodi – Fonti dati/misure | Come misurate variabili | Cartelle cliniche elettroniche, registri amministrativi, follow-up registro anagrafe |
| Metodi – Bias | Strategie per limitarlo | PS Matching, analisi multivariata, sensitivity IPTW |
| Metodi – Dimensione campione | Decisione | Basata su differenza minima clinica, potenza 80%, α=0.05 → ~870 pazienti |
| Metodi – Variabili quantitative | Gestione variabili continue | Età continua/categorica, ASA ordinale |
| Metodi – Metodi statistici | Tutti i metodi | PS logistica, Matching 1:1 caliper 0.2 SD, SMD, logistica condizionata/Cox, sensitivity IPTW |
| Risultati – Partecipanti | Numeri stadio | Flusso arruolati → esclusi → matchati → analizzati; diagramma STROBE |
| Risultati – Descrizione dati | Caratteristiche basali | Tabella 1 pre-match, Tabella 2 post-match (SMD) |
| Risultati – Outcome principali | Eventi, stime, IC | Mortalità 30 gg: OR/HR con IC95%; Kaplan–Meier |
| Risultati – Analisi addizionali | Sottogruppi, sensitivity | Analisi stratificate, IPTW, cut-off alternativi ≤24h |
| Discussione – Sintesi risultati | Principali risultati | Chirurgia precoce riduce mortalità a 30 gg; confronto studi Europa/Italia |
| Discussione – Limiti | Bias, confondimento residuo | Residual confounding, dati mancanti, generalizzabilità locale |
| Discussione – Interpretazione | Implicazioni cliniche | Conferma importanza chirurgia precoce in alcune condizioni; supporto linee guida |
| Generalizzabilità | Applicabilità risultati | Pazienti anziani con frattura femore in contesti simili |
| Altri | Finanziamenti, conflitti | Finanziamenti: nessuno; COI: da scrivere |
