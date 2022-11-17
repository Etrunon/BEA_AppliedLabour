* Startup
clear all
global path "/home/etrunon/Documents/UniBea/12LabourMarket/Project"
global results "$path/results"
global resultDb "$results/db"
cd "$path"

global db_00_source "$path/ISTAT_MFR_RCFL_2013_Secondo_trimestre_IT_DELIMITED/MICRODATI/rcfl_2013_secondo_trim.dta"
global db_01_whitespaceCsv "$resultsDb/db_01_whitespaceCsv.csv"
global db_01_cleanedCsv "$resultsDb/db_01_cleanedCsv.csv"
global db_01_firstPass "$resultsDb/01_firstPass.dta"