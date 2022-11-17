* Startup
clear all
global path "/home/etrunon/Documents/UniBea/12LabourMarket/Project"

// Folders
global results "$path/results"
global resultDb "$results/db"
global pictures "$path/results"

cd "$path"

// Definition of all databases file. 
// Each file is created in the script numbered with the number in its name. They are all saved
// In the result DB folder.
global db_00_source "$path/ISTAT_MFR_RCFL_2013_Secondo_trimestre_IT_DELIMITED/MICRODATI/rcfl_2013_secondo_trim.dta"
global db_01_whitespaceCsv "$resultDb/db_01_whitespaceCsv.csv"
global db_02_cleanedCsv "$resultDb/db_02_cleanedCsv.csv"
global db_03_firstPass "$resultDb/03_firstPass.dta"

// List of variables
global myVarInt "v08_age v13_netLastMonthWage"
global myVarString "v01_isPartTimeVoluntary v02_distributionHourReduction v05_livingAddress5Areas v06_livingAddress3Areas v07_citizenship  v09_professionalTier v10_employeeContractLenght v11_mainJobTitle v12_usualJobSite v14_lastYearJobType v15_currentJobAteco12Class v16_lastYearAteco12Class v17_isLookingForAnotherJob v18_educationLevel v19_hasChangedJobSinceLastYear"
// All together
global myVar $myVarInt $myVarString