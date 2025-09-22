# 📊🧾🧮 Statistical Analysis Plan | Hip Fracture PSM

---

## 1. Title and Objective
**Title:**  
(Conditional) Association between surgical timing and mortality after hip fracture: a retrospective propensity score-matched cohort study (in a secondary hospital in Northern Italy).

**Primary objective:** Estimate the association between early surgery (e.g., ≤48 hours from admission) vs delayed surgery (>48 hours) and 30-day mortality.

**Secondary objectives:** 90-day and 1-year mortality, postoperative complications, length of stay (no 30-day readmission available).

---

## 2. Study Design and Population
- **Design:** Retrospective observational study.  
- **Population:** Patients ≥65 years with hip fracture who underwent surgery.  
- **Exclusion criteria:** Polytrauma, no surgery, death before surgery, critical missing data (specify).

---

## 3. Exposure and Outcome Definitions
- **Primary exposure (binary):**  
  - Early surgery = operated within ≤48 hours of hospital admission  
  - Delayed surgery = >48 hours  
  - *Note:* alternative definition (≤24h) to be used in sensitivity analyses.

- **Primary outcome:** 30-day mortality (binary).  
- **Secondary outcomes:** 90-day and 1-year mortality, time-to-death, major adverse events, length of stay, readmission.

---

## 4. Covariates / Potential Confounders (for PS model)
- **Demographics:** Age (continuous and categorical), sex.  
- **Comorbidities:** Charlson Comorbidity Index or individual conditions (heart failure, COPD, diabetes, CKD, stroke, etc.).  
- ASA score, frailty index, pre-fracture functional status (independent/assisted), cognitive status if available.  
- Fracture type (intracapsular/intertrochanteric/subtrochanteric).  
- Planned surgery type (osteosynthesis / hemiarthroplasty / total hip replacement).  
- Clinical parameters at admission (oxygen saturation, hemoglobin, hemodynamic stability).  
- Hospital capacity/volume, initial ward (ER vs other ward), contextual factors influencing timing.  
- Date/time of presentation (to account for weekend/holiday effects) — consider a “weekend admission” variable.

---

## 5. Handling of Missing Data
- Quantify missingness for each covariate.  
- If <5% and missing completely at random → complete-case analysis.  
- If >5% or not completely at random → multiple imputation (e.g., MICE, ≥20 imputations).  
- Imputation is performed **before** PS estimation.

---

## 6. Propensity Score Estimation
- **Model:** Logistic regression; outcome = early surgery (1 = early, 0 = delayed).  
- **Covariates:** All listed in §4 (avoid outcome variables or colliders).  
- Consider non-linear terms (age²) or splines if justified.  
- Estimate logit(PS) (for caliper matching).  
- Evaluate discrimination (AUC) and calibration; primary goal = balance, not prediction.

---

## 7. Matching Strategy
- **Primary approach:** Nearest neighbor 1:1 without replacement, caliper = 0.2 × SD(logit(PS))  
  - If many controls available, consider 1:k (1:2 or 1:3) to increase power.  
- **Alternatives:** Matching with replacement, full matching, optimal matching.  
- Subjects without match are excluded (report N excluded).

---

## 8. Balance Diagnostics
- **Metrics:** Standardized Mean Differences (SMD) pre- and post-matching.  
  - SMD <0.1 = good balance; values <0.2 may be acceptable with justification.  
- **Visualizations:** Love plot (SMD pre/post), PS distribution (histogram/density) by group, boxplot of logit(PS).  
- **Tables:** Baseline characteristics pre- and post-matching (means ± SD, medians [IQR], frequencies %).  
- Check for outliers in covariate variances.

---

## 9. Outcome Analysis (Post-Matching)
- **Primary analysis (binary 30-day outcome):**  
  - Risk difference (RD), risk ratio (RR), and odds ratio (OR) with 95% CI.  
  - Inference accounting for matching:  
    - McNemar test (1:1 paired), or  
    - Conditional logistic regression (accounting for pairs), or  
    - Robust/clustered SE regression by pair.

- **Survival analysis (if time-to-event available):**  
  - Kaplan–Meier curves by group (post-matching) and log-rank test.  
  - Cox proportional hazards with robust SE or stratified by pair.  
  - Check proportional hazards assumption.

- **Sensitivity analysis in full population:** IPTW using stabilized PS and weighted regression models for comparison with matching results.

---

## 10. Residual Confounding / Sensitivity
- **E-value:** Estimate for observed effect to quantify strength of unmeasured confounder needed to nullify association.  
- **Alternative analyses:** Different exposure definitions (≤24h, ≤36h, clinical cut-offs), different calipers, full matching, IPTW.  
- Consider natural instrumental variables if available (e.g., surgical list congestion, waiting lists).

---

## 11. Secondary Analyses and Subgroups
- Pre-specified subgroups: Age (>80 vs ≤80), frailty, ASA class, fracture type, surgery type (prosthesis vs osteosynthesis).  
- Test interactions in models (e.g., timing × age) and report p-interaction.  
- Report stratified results if interactions significant or clinically relevant.

---

## 12. Cluster Sensitivity (Hospital/Surgeon)
- Not applicable.

---

## 13. Handling Unmatched Subjects
- Report number and characteristics of excluded subjects.  
- Compare excluded vs included subjects to assess selection bias.

---

## 14. Significance and Confidence
- Two-sided tests.  
- α = 0.05 (two-sided).  
- Report 95% CI for primary estimates.

---

## 15. Sample Size / Power
- Example for two proportions (30-day mortality):  
  - Expected mortality in delayed group = 10%, target reduction to 5%, α=0.05, power=80% → ~435 per group, total ~870.  
- Recommendation: perform power calculations based on pilot data proportions.

---

## 16. Outputs / Tables and Figures
- **Table 0:** Patient flow (STROBE diagram), inclusion/exclusion, matched numbers.  
- **Table 1:** Baseline characteristics pre-matching.  
- **Table 2:** Baseline characteristics post-matching (SMD).  
- **Table 3:** Primary results (RD, RR, OR, HR) with 95% CI.  
- **Figures:** Love plot, PS density pre/post, Kaplan–Meier curves, forest plot for subgroups.  
- **Appendix:** PS model details (coefficients, AUC), sensitivity analyses (IPTW, cut-off changes), imputation info.

---

## 17. Reproducibility and Transparency
- Provide code (R scripts) as supplement.  
- Specify software version and packages.  
- Document all decisions (caliper, exclusions, imputation, exact exposure/outcome definitions).

---

## 18. Reporting and Interpretation
- Interpret cautiously: PSM corrects for measured confounding, not unmeasured.  
- Discuss residual confounding, selection bias (unmatched subjects), and timing measurement limitations.

---

## 19. Operational Checklist
1. Data cleaning and descriptive statistics (frequencies, missing).  
2. Imputation (if needed).  
3. PS estimation with logistic regression (all pre-specified covariates). Save PS and logit(PS).  
4. 1:1 nearest neighbor matching with caliper = 0.2 SD(logitPS). Save matched dataset.  
5. Assess balance (SMD pre/post, love plot).  
6. Outcome analysis (conditional logistic or Cox robust SE). Calculate RD, RR, HR.  
7. Sensitivity analyses: IPTW, alternative timing cut-offs, alternative imputations.  
8. Subgroups and interaction tests.  
9. Prepare tables/figures and write methods/results sections.

---

### Example Statistics Format
- Main effect (OR or HR): 0.75 (95% CI 0.60–0.95), p = 0.018  
- Risk difference at 30 days: -3.4% (95% CI -6.0% to -0.8%)  
- Number needed to treat (NNT) = 1 / RD (if RD significant)

