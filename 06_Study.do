
use $db_05_categorized, clear

// Print the table form of each variable to build a descriptive latex page
foreach var in $myVarString {
    table (`var') (v20_isGenderFemale)
}

// Compute and build a comparison graph between Part-time willingness and area of living,
// gender and citizenship
graph bar (count) v01_isPartTimeInvoluntary, ///
    by(v01_isPartTimeInvoluntary) over(v06_livingAddress3Areas) over(v20_isGenderFemale) over(v07_citizenship) ///
    stack ///
    xsize(2.5) ysize(1) ylabel(#7) scale(.8) ///
    ytitle(Number of cases) ///
    title("Part time cases by Willingness, Gender, Citizenship and Living Area", position(11))
graph export "$results/06WillingnessByGenderAreaCitizenship.png", replace width(1800) height(900)

// Comparison graph between Part-Time willingness and education, gender and job kind
graph bar (count) v01_isPartTimeInvoluntary,  ///
    by(v01_isPartTimeInvoluntary) over(v18_educationLevel) over(v20_isGenderFemale) over(v11_mainJobTitle)  ///
    stack  ///
    xsize(2.5) ysize(1) ylabel(#7) scale(.8) ytitle(Number of cases)  ///
    title("Part time cases by Willingness, Gender, Education and Job Kind")
graph export "$results/06WillingnessByGenderEducationLevel.png", replace width(1800) height(900)

// ///////////////////////////////////////////// 
// REGRESSIONS /////////////////////////////////
// /////////////////////////////////////////////

// Simplest model 
reg v01_isPartTimeInvoluntary ///
    i.v20_isGenderFemale i.v06_livingAddress3Areas 

// Model with interaction between gender and living area
reg v01_isPartTimeInvoluntary /// 
    i.v20_isGenderFemale ///
    i.v06_livingAddress3Areas ///
    i.v20_isGenderFemale##i.v06_livingAddress3Areas

// fare outreg2 per vedere la tabella con le stelline
// Modello CON TUTTO
reg v01_isPartTimeInvoluntary ///
    v08_age v13_netLastMonthWage /// Variabili continue
    i.v06_livingAddress3Areas ///
    i.v07_citizenship ///
    i.v09_professionalTier ///
    i.v10_employeeContractLenght ///
    i.v11_mainJobTitle ///
    i.v12_usualJobSite ///
    i.v14_lastYearJobType ///
    i.v15_currentJobAteco12Class ///
    i.v17_isLookingForAnotherJob ///
    i.v18_educationLevel ///
    i.v20_isGenderFemale
outreg using "$results/06_tmpOutreg2", tex se bdec(2) starlevels(10 5 1) starloc(1) replace a4

// Modello con variabili significative
reg v01_isPartTimeInvoluntary  ///
    i.v06_livingAddress3Areas ///
    i.v07_citizenship ///
    i.v10_employeeContractLenght ///
    i.v11_mainJobTitle ///
    i.v15_currentJobAteco12Class ///
    i.v17_isLookingForAnotherJob ///
    i.v18_educationLevel ///
    i.v20_isGenderFemale
outreg using "$results/06_tmp2Outreg2", tex se bdec(2) starlevels(10 5 1) starloc(1) replace merge a4

reg v01_isPartTimeInvoluntary  v08_age v13_netLastMonthWage i.v20_isGenderFemale
outreg using "$results/06_tmp3Outreg2", tex se bdec(2) starlevels(10 5 1) starloc(1) replace merge a4

// reg v01_isPartTimeInvoluntary i.v20_isGenderFemale i.v06_livingAddress3Areas i.v20_isGenderFemale##i.v06_livingAddress3Areas##v18_educationLevel
// outreg using "$results/06_tmp4Outreg2", tex se bdec(2) starlevels(10 5 1) starloc(1) replace merge a4

esttab using "$results/06_tmp5Outreg2", label tex replace