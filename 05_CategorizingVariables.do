// This file is used to rescale, regroup and rework all the string variables 
// to be dummies or categories.

//global myVarInt "v08_age v13_netLastMonthWage v20_isGenderFemale"
//global myVarString "v01_isPartTimeVoluntary v02_distributionHourReduction v06_livingAddress3Areas v07_citizenship  v09_professionalTier v10_employeeContractLenght v11_mainJobTitle v12_usualJobSite v14_lastYearJobType v15_currentJobAteco12Class v16_lastYearAteco12Class v17_isLookingForAnotherJob v18_educationLevel"

use $db_03_firstPass, clear

// v01_isPartTimeVoluntary
encode v01_isPartTimeVoluntary, gen(v01Encode)
drop v01_isPartTimeVoluntary
rename v01Encode v01_isPartTimeVoluntary

replace v01_isPartTimeVoluntary=1 if v01_isPartTimeVoluntary==2
replace v01_isPartTimeVoluntary=0 if v01_isPartTimeVoluntary==3
replace v01_isPartTimeVoluntary=1 if v01_isPartTimeVoluntary==4

label define v01Encode ///
                0 "Unwilling"  ///
                1 "Willing"  ///
                2 ""  ///
                3 ""  ///
                4 "", modify

fre v01_isPartTimeVoluntary

// v02_distributionHourReduction
encode v02_distributionHourReduction, gen(v02Encode)
drop v02_distributionHourReduction
rename v02Encode v02_distributionHourReduction

// v06_livingAddress3Areas
encode v06_livingAddress3Areas, gen(v06Encode)
drop v06_livingAddress3Areas
rename v06Encode v06_livingAddress3Areas

label define v06Encode ///
                1 "Center" ///
                2 "Nord" ///
                3 "Sud", modify

// v07_citizenship
encode v07_citizenship, gen(v07Encode)
drop v07_citizenship
rename v07Encode v07_citizenship

// v09_professionalTier
encode v09_professionalTier, gen(v09Encode)
drop v09_professionalTier
rename v09Encode v09_professionalTier

replace v09_professionalTier=0 if v09_professionalTier==1
replace v09_professionalTier=0 if v09_professionalTier==2
replace v09_professionalTier=0 if v09_professionalTier==3
replace v09_professionalTier=1 if v09_professionalTier==4
replace v09_professionalTier=0 if v09_professionalTier==5
replace v09_professionalTier=1 if v09_professionalTier==6
replace v09_professionalTier=0 if v09_professionalTier==7
replace v09_professionalTier=2 if v09_professionalTier==8
replace v09_professionalTier=2 if v09_professionalTier==9
replace v09_professionalTier=0 if v09_professionalTier==10
replace v09_professionalTier=0 if v09_professionalTier==11
replace v09_professionalTier=1 if v09_professionalTier==12
replace v09_professionalTier=0 if v09_professionalTier==13

label define v09Encode /// 
                0  "Employee" ///
                1  "Manager" ///
                2  "Freelancer" ///
                3  "" ///
                4  "" ///
                5  "" ///
                6  "" ///
                7  "" ///
                8  "" ///
                9  "" ///
                10 "" ///
                11 "" ///
                12 "" ///
                13 "", modify


// v10_employeeContractLenght
encode v10_employeeContractLenght, gen(v10Encode)
drop v10_employeeContractLenght
rename v10Encode v10_employeeContractLenght

// v11_mainJobTitle
encode v11_mainJobTitle, gen(v11Encode)
drop v11_mainJobTitle
rename v11Encode v11_mainJobTitle

    // Blue collars
replace v11_mainJobTitle=0 if v11_mainJobTitle==1
replace v11_mainJobTitle=0 if v11_mainJobTitle==2
replace v11_mainJobTitle=0 if v11_mainJobTitle==6
    // Blue Collars weird
replace v11_mainJobTitle=0 if v11_mainJobTitle==7
replace v11_mainJobTitle=0 if v11_mainJobTitle==8
    // White collars
replace v11_mainJobTitle=1 if v11_mainJobTitle==3
replace v11_mainJobTitle=1 if v11_mainJobTitle==4
replace v11_mainJobTitle=1 if v11_mainJobTitle==5

label define v11Encode /// 
                0  "Blue Collars" ///
                1  "White Collars" ///
                2  "" ///
                3  "" ///
                4  "" ///
                5  "" ///
                6  "" ///
                7  "" ///
                8  "", modify ///

// v12_usualJobSite
encode v12_usualJobSite, gen(v12Encode)
drop v12_usualJobSite
rename v12Encode v12_usualJobSite

replace v12_usualJobSite=0 if v12_usualJobSite==1
replace v12_usualJobSite=0 if v12_usualJobSite==2
replace v12_usualJobSite=0 if v12_usualJobSite==3

replace v12_usualJobSite=1 if v12_usualJobSite==4
replace v12_usualJobSite=2 if v12_usualJobSite==5

label define v12Encoding ///
                0 "Outside province" ///
                1 "Inside province" ///
                2 "Inside municipality" ///
                3 "" ///
                4 "" ///
                5 "", modify

// v14_lastYearJobType
encode v14_lastYearJobType, gen(v14Encode)
drop v14_lastYearJobType
rename v14Encode v14_lastYearJobType

// v15_currentJobAteco12Class
encode v15_currentJobAteco12Class, gen(v15Encode)
drop v15_currentJobAteco12Class
rename v15Encode v15_currentJobAteco12Class

// v17_isLookingForAnotherJob
encode v17_isLookingForAnotherJob, gen(v17Encode)
drop v17_isLookingForAnotherJob
rename v17Encode v17_isLookingForAnotherJob

// v18_educationLevel
encode v18_educationLevel, gen(v18Encode)
drop v18_educationLevel
rename v18Encode v18_educationLevel

save $db_05_categorized, replace