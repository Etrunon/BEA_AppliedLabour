// This file is used to rescale, regroup and rework all the string variables 
// to be dummies or categories.

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

// First do
replace v09_professionalTier=1 if v09_professionalTier==1
replace v09_professionalTier=1 if v09_professionalTier==2
replace v09_professionalTier=1 if v09_professionalTier==3
replace v09_professionalTier=1 if v09_professionalTier==5
replace v09_professionalTier=1 if v09_professionalTier==7
replace v09_professionalTier=1 if v09_professionalTier==10
replace v09_professionalTier=1 if v09_professionalTier==11
replace v09_professionalTier=1 if v09_professionalTier==13
// And then
replace v09_professionalTier=0 if v09_professionalTier==1

// First do
replace v09_professionalTier=4 if v09_professionalTier==4
replace v09_professionalTier=4 if v09_professionalTier==6
replace v09_professionalTier=4 if v09_professionalTier==12
// And then
replace v09_professionalTier=1 if v09_professionalTier==4

// First do
replace v09_professionalTier=8 if v09_professionalTier==8
replace v09_professionalTier=8 if v09_professionalTier==9
// And then 
replace v09_professionalTier=2 if v09_professionalTier==8

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

replace v14_lastYearJobType=0 if v14_lastYearJobType==1

replace v14_lastYearJobType=1 if v14_lastYearJobType==2
replace v14_lastYearJobType=1 if v14_lastYearJobType==3

label define v14Encode ///
                0 "Self Employed" ///
                1 "Employee" ///
                2 "" ///
                3 "", modify

// v15_currentJobAteco12Class
encode v15_currentJobAteco12Class, gen(v15Encode)
drop v15_currentJobAteco12Class
rename v15Encode v15_currentJobAteco12Class

replace v15_currentJobAteco12Class=0 if v15_currentJobAteco12Class==1

replace v15_currentJobAteco12Class=1 if v15_currentJobAteco12Class==2
replace v15_currentJobAteco12Class=1 if v15_currentJobAteco12Class==3
replace v15_currentJobAteco12Class=1 if v15_currentJobAteco12Class==10
replace v15_currentJobAteco12Class=1 if v15_currentJobAteco12Class==11

replace v15_currentJobAteco12Class=2 if v15_currentJobAteco12Class==4

replace v15_currentJobAteco12Class=3 if v15_currentJobAteco12Class==5

replace v15_currentJobAteco12Class=4 if v15_currentJobAteco12Class==6
replace v15_currentJobAteco12Class=4 if v15_currentJobAteco12Class==7

replace v15_currentJobAteco12Class=5 if v15_currentJobAteco12Class==8
replace v15_currentJobAteco12Class=5 if v15_currentJobAteco12Class==9
replace v15_currentJobAteco12Class=5 if v15_currentJobAteco12Class==12

label define v15Encode ///
                0 "Agricolture" ///
                1 "People services" ///
                2 "Public Sector" ///
                3 "Financial Services" ///
                4 "Trade sector" ///
                5 "Industry and buildings" ///
                6 "" ///
                7 "" ///
                8 "" ///
                9 "" ///
                10 "" ///
                11 "" ///
                12 "", modify

// v17_isLookingForAnotherJob
encode v17_isLookingForAnotherJob, gen(v17Encode)
drop v17_isLookingForAnotherJob
rename v17Encode v17_isLookingForAnotherJob

// v18_educationLevel
encode v18_educationLevel, gen(v18Encode)
drop v18_educationLevel
rename v18Encode v18_educationLevel

replace v18_educationLevel=0 if v18_educationLevel==8
replace v18_educationLevel=0 if v18_educationLevel==10

replace v18_educationLevel=2 if v18_educationLevel==1
replace v18_educationLevel=2 if v18_educationLevel==2
replace v18_educationLevel=2 if v18_educationLevel==3

replace v18_educationLevel=1 if v18_educationLevel==9

replace v18_educationLevel=3 if v18_educationLevel==4
replace v18_educationLevel=3 if v18_educationLevel==5
replace v18_educationLevel=3 if v18_educationLevel==6
replace v18_educationLevel=3 if v18_educationLevel==7

label define v18Encode ///
                0 "Basic or no education" ///
                1 "Middle School" ///
                2 "Highschool" ///
                3 "University Level" ///
                4 "" ///
                5 "" ///
                6 "" ///
                7 "" ///
                8 "" ///
                9 "" ///
                10 "", modify

// v20_isGenderFemale
label define v20Encode ///
                0 "Male" ///
                1 "Female", modify

label values v20_isGenderFemale v20Encode

// Finally save
save $db_05_categorized, replace