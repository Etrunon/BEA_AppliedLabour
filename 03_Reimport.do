// This file imports again the dataset from the python output into stata
// It also has to rename again the variables because that gets lost in the way

import delimited $db_02_cleanedCsv, clear

// Rename all the variables because saving and then loading to csv changes the case of their name
rename v01_isparttimeinvoluntary		v01_isPartTimeInvoluntary
rename v02_distributionhourreduction 	v02_distributionHourReduction
rename v06_livingaddress3areas 			v06_livingAddress3Areas
rename v07_citizenship 					v07_citizenship
rename v08_age 							v08_age
rename v09_professionaltier 			v09_professionalTier
rename v10_employeecontractlenght 		v10_employeeContractLenght
rename v11_mainjobtitle 				v11_mainJobTitle
rename v12_usualjobsite 				v12_usualJobSite
rename v13_netlastmonthwage 			v13_netLastMonthWage
rename v14_lastyearjobtype 				v14_lastYearJobType
rename v15_currentjobateco12class 		v15_currentJobAteco12Class
rename v17_islookingforanotherjob 		v17_isLookingForAnotherJob
rename v18_educationlevel 				v18_educationLevel
rename v20_isgenderfemale              	v20_isGenderFemale

save $db_03_firstPass, replace
