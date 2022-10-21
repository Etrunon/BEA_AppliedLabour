* Startup
clear all
global path "/home/etrunon/Documents/UniBea/12LabourMarket/Project/ISTAT_MFR_RCFL_2013_Secondo_trimestre_IT_DELIMITED/MICRODATI"
cd "/home/etrunon/Documents/UniBea/12LabourMarket/Project/ISTAT_MFR_RCFL_2013_Secondo_trimestre_IT_DELIMITED/MICRODATI"

* Load the dataset
use "rcfl_2013_secondo_trim.dta", clear

* -----------------------------------------------------------------------------------------------

* Variable renames
rename c28 		v01_isPartTimeVoluntary
rename c27a		v02_distributionHourReduction
rename c29 		v03_partTimeReason
rename c29b		v04_if03HasToCareWhatIsReason
rename rip5		v05_livingAddress5Areas
rename rip3		v06_livingAddress3Areas
rename cittad	v07_citizenship
rename etam		v08_age
rename pospro	v09_professionalTier
rename detind	v10_employeeContractLenght
rename prof1	v11_mainJobTitle
rename lavspe	v12_usualJobSite
rename retric	v13_netLastMonthWage
rename dipaup	v14_lastYearJobType
rename cat12	v15_currentJobAteco12Class
rename cat12p	v16_lastYearAteco12Class
rename f1 		v17_isLookingForAnotherJob
rename sg24		v18_educationLevel
gen 			v19_hasChangedJobSinceLastYear="no"

* Database cut
keep v01_isPartTimeVoluntary  ///
	 v02_distributionHourReduction  ///
	 v03_partTimeReason ///
	 v04_if03HasToCareWhatIsReason ///
	 v05_livingAddress5Areas ///
	 v06_livingAddress3Areas ///
	 v07_citizenship ///
	 v08_age ///
	 v09_professionalTier ///
	 v10_employeeContractLenght ///
	 v11_mainJobTitle ///
	 v12_usualJobSite ///
	 v13_netLastMonthWage ///
	 v14_lastYearJobType ///
	 v15_currentJobAteco12Class ///
	 v16_lastYearAteco12Class ///
	 v17_isLookingForAnotherJob ///
	 v18_educationLevel ///
	 v19_hasChangedJobSinceLastYear

* Remove all people that do not have a part-time
keep if v01_isPartTimeVoluntary=="001" | ///
		v01_isPartTimeVoluntary=="002" | ///
		v01_isPartTimeVoluntary=="003" | ///
		v01_isPartTimeVoluntary=="997"

* Value renames
replace v01_isPartTimeVoluntary="Willing" 		if v01_isPartTimeVoluntary=="001"
replace v01_isPartTimeVoluntary="Unwilling" 	if v01_isPartTimeVoluntary=="002"
replace v01_isPartTimeVoluntary="Other" 		if v01_isPartTimeVoluntary=="003"
replace v01_isPartTimeVoluntary="Boh" 			if v01_isPartTimeVoluntary=="997"

replace v02_distributionHourReduction="EveryDay" 	if v02_distributionHourReduction=="001"
replace v02_distributionHourReduction="SomeDay" 	if v02_distributionHourReduction=="002"
replace v02_distributionHourReduction="SomeWeek" 	if v02_distributionHourReduction=="003"
replace v02_distributionHourReduction="SomeMonth" 	if v02_distributionHourReduction=="004"
replace v02_distributionHourReduction="Other" 		if v02_distributionHourReduction=="996"
replace v02_distributionHourReduction="Boh" 		if v02_distributionHourReduction=="997"

replace v03_partTimeReason="isStudying" 		if v03_partTimeReason=="001"
replace v03_partTimeReason="hasHealthProblems" 	if v03_partTimeReason=="002"
replace v03_partTimeReason="hasToCareOthers" 	if v03_partTimeReason=="003"
replace v03_partTimeReason="hasSecondJob" 		if v03_partTimeReason=="004"
replace v03_partTimeReason="otherFamilyIssue" 	if v03_partTimeReason=="005"
replace v03_partTimeReason="wantsFreeTime" 		if v03_partTimeReason=="006"
replace v03_partTimeReason="Other" 				if v03_partTimeReason=="996"

replace v04_if03HasToCareWhatIsReason="childServicesAreBad" if v04_if03HasToCareWhatIsReason=="001"
replace v04_if03HasToCareWhatIsReason="elderServiceAreBad" 	if v04_if03HasToCareWhatIsReason=="002"
replace v04_if03HasToCareWhatIsReason="everyServiceIsBad" 	if v04_if03HasToCareWhatIsReason=="003"
replace v04_if03HasToCareWhatIsReason="noOtherReason" 		if v04_if03HasToCareWhatIsReason=="004"
replace v04_if03HasToCareWhatIsReason="boh" 				if v04_if03HasToCareWhatIsReason=="997"

tostring v05_livingAddress5Areas, replace
replace v05_livingAddress5Areas="nordOvest" if v05_livingAddress5Areas=="1"
replace v05_livingAddress5Areas="nordEst" 	if v05_livingAddress5Areas=="2"
replace v05_livingAddress5Areas="centro" 	if v05_livingAddress5Areas=="3"
replace v05_livingAddress5Areas="sud" 		if v05_livingAddress5Areas=="4"
replace v05_livingAddress5Areas="isole" 	if v05_livingAddress5Areas=="5"

tostring v06_livingAddress3Areas, replace
replace v06_livingAddress3Areas="nord" 		if v06_livingAddress3Areas=="1"
replace v06_livingAddress3Areas="centro" 	if v06_livingAddress3Areas=="2"
replace v06_livingAddress3Areas="sud" 		if v06_livingAddress3Areas=="3"

tostring v07_citizenship, replace
replace v07_citizenship="italian" 		if v07_citizenship=="1"
replace v07_citizenship="european" 		if v07_citizenship=="2"
replace v07_citizenship="nonEuropean" 	if v07_citizenship=="3"

tostring v09_professionalTier, replace
replace v09_professionalTier="Dirigente" 								if v09_professionalTier=="01"
replace v09_professionalTier="Quadro" 									if v09_professionalTier=="02"
replace v09_professionalTier="Impiegato" 								if v09_professionalTier=="03"
replace v09_professionalTier="Operaio" 									if v09_professionalTier=="04"
replace v09_professionalTier="Apprendista" 								if v09_professionalTier=="05"
replace v09_professionalTier="Lavoratore presso il proprio domicilio per conto di un impresa" if v09_professionalTier=="06"
replace v09_professionalTier="Imprenditore" 							if v09_professionalTier=="07"
replace v09_professionalTier="Libero professionista" 					if v09_professionalTier=="08"
replace v09_professionalTier="Lavoratore in proprio" 					if v09_professionalTier=="09"
replace v09_professionalTier="Socio di cooperativa" 					if v09_professionalTier=="10"
replace v09_professionalTier="Coadiuvante nell’azienda di un familiare" if v09_professionalTier=="11"
replace v09_professionalTier="Collaborazione coordinata e continuativa" if v09_professionalTier=="12"
replace v09_professionalTier="Prestazione d opera occasionale" 			if v09_professionalTier=="13"

tostring v10_employeeContractLenght, replace
replace v10_employeeContractLenght="fixedLenght" 	if v10_employeeContractLenght=="1"
replace v10_employeeContractLenght="nonFixedLenght" if v10_employeeContractLenght=="2"

tostring v11_mainJobTitle, replace
replace v11_mainJobTitle="legislatori, imprenditori e alta dirigenza" 								if v11_mainJobTitle=="1"
replace v11_mainJobTitle="professioni intellettuali, scientifiche e di elevata specializzazione" 	if v11_mainJobTitle=="2"
replace v11_mainJobTitle="professioni tecniche" 													if v11_mainJobTitle=="3"
replace v11_mainJobTitle="professioni esecutive nel lavoro d'ufficio" 								if v11_mainJobTitle=="4"
replace v11_mainJobTitle="professioni qualificate nelle attivita’ commerciali e nei servizi" 		if v11_mainJobTitle=="5"
replace v11_mainJobTitle="artigiani, operai specializzati e agricoltori" 							if v11_mainJobTitle=="6"
replace v11_mainJobTitle="conduttori di impianti, operai di macchinari fissi e mobili e conducenti di veicoli" if v11_mainJobTitle=="7"
replace v11_mainJobTitle="professioni non qualificate" 												if v11_mainJobTitle=="8"
replace v11_mainJobTitle="forze armate" 															if v11_mainJobTitle=="9"

tostring v12_usualJobSite, replace
replace v12_usualJobSite="Nel comune di residenza" 				if v12_usualJobSite=="1"
replace v12_usualJobSite="Altro comune della stessa provincia" 	if v12_usualJobSite=="2"
replace v12_usualJobSite="Altra provincia nella stessa regione" if v12_usualJobSite=="3"
replace v12_usualJobSite="Altra regione" 						if v12_usualJobSite=="4"
replace v12_usualJobSite="All’estero" 							if v12_usualJobSite=="5"

tostring v14_lastYearJobType, replace
replace v14_lastYearJobType="Dipendente" 	if v14_lastYearJobType=="1"
replace v14_lastYearJobType="Collaboratore" if v14_lastYearJobType=="2"
replace v14_lastYearJobType="Autonomo" 		if v14_lastYearJobType=="3"

tostring v15_currentJobAteco12Class, replace
replace v15_currentJobAteco12Class="Agricoltura, silvicoltura e pesca" 			if v15_currentJobAteco12Class=="01"
replace v15_currentJobAteco12Class="Industria in senso stretto" 				if v15_currentJobAteco12Class=="02"
replace v15_currentJobAteco12Class="Costruzioni" 								if v15_currentJobAteco12Class=="03"
replace v15_currentJobAteco12Class="Commercio" 									if v15_currentJobAteco12Class=="04"
replace v15_currentJobAteco12Class="Alberghi e ristoranti" 						if v15_currentJobAteco12Class=="05"
replace v15_currentJobAteco12Class="Trasporto e magazzinaggio" 					if v15_currentJobAteco12Class=="06"
replace v15_currentJobAteco12Class="Servizi di informazione e comunicazione" 	if v15_currentJobAteco12Class=="07"
replace v15_currentJobAteco12Class="Attività finanziarie e assicurative" 		if v15_currentJobAteco12Class=="08"
replace v15_currentJobAteco12Class="Attività immobiliari, servizi alle imprese e altre attività professionali e imprenditoriali" if v15_currentJobAteco12Class=="09"
replace v15_currentJobAteco12Class="Amministrazione pubblica e difesa assicurazione sociale obbligatoria" if v15_currentJobAteco12Class=="10"
replace v15_currentJobAteco12Class="Istruzione, sanità ed altri servizi sociali" if v15_currentJobAteco12Class=="11"
replace v15_currentJobAteco12Class="Altri servizi collettivi e personali" 		if v15_currentJobAteco12Class=="12"

tostring v16_lastYearAteco12Class, replace
replace v16_lastYearAteco12Class="Agricoltura, silvicoltura e pesca" 				if v16_lastYearAteco12Class=="01"
replace v16_lastYearAteco12Class="Industria in senso stretto" 						if v16_lastYearAteco12Class=="02"
replace v16_lastYearAteco12Class="Costruzioni" 										if v16_lastYearAteco12Class=="03"
replace v16_lastYearAteco12Class="Commercio" 										if v16_lastYearAteco12Class=="04"
replace v16_lastYearAteco12Class="Alberghi e ristoranti" 							if v16_lastYearAteco12Class=="05"
replace v16_lastYearAteco12Class="Trasporto e magazzinaggio" 						if v16_lastYearAteco12Class=="06"
replace v16_lastYearAteco12Class="Servizi di informazione e comunicazione" 			if v16_lastYearAteco12Class=="07"
replace v16_lastYearAteco12Class="Attività finanziarie e assicurative" 				if v16_lastYearAteco12Class=="08"
replace v16_lastYearAteco12Class="Attività immobiliari, servizi alle imprese e altre attività professionali e imprenditoriali" if v16_lastYearAteco12Class=="09"
replace v16_lastYearAteco12Class="Amministrazione pubblica e difesa assicurazione sociale obbligatoria" if v16_lastYearAteco12Class=="10"
replace v16_lastYearAteco12Class="Istruzione, sanità ed altri servizi sociali" 		if v16_lastYearAteco12Class=="11"
replace v16_lastYearAteco12Class="Altri servizi collettivi e personali" 			if v16_lastYearAteco12Class=="12"

tostring v17_isLookingForAnotherJob, replace
replace v17_isLookingForAnotherJob="yes" 	if v17_isLookingForAnotherJob=="1"
replace v17_isLookingForAnotherJob="no" 	if v17_isLookingForAnotherJob=="2"

tostring v18_educationLevel, replace
replace v18_educationLevel="Nessun titolo" 													if v18_educationLevel=="01"
replace v18_educationLevel="Licenza elementare" 											if v18_educationLevel=="02"
replace v18_educationLevel="Licenza media" 													if v18_educationLevel=="03"
replace v18_educationLevel="Diploma professionale non permette l’iscrizione all’Università" if v18_educationLevel=="04"
replace v18_educationLevel="Diploma di maturità" 											if v18_educationLevel=="05"
replace v18_educationLevel="Diploma di Accademia Belle Arti" 								if v18_educationLevel=="06"
replace v18_educationLevel="Laurea di due/tre anni, Scuola diretta a fini speciali, Scuola parauniversitaria" if v18_educationLevel=="07"
replace v18_educationLevel="Laurea di primo livello" 										if v18_educationLevel=="08"
replace v18_educationLevel="Laurea specialistica di due anni di secondo livello" 			if v18_educationLevel=="09"
replace v18_educationLevel="Laurea di quattro anni o più" 									if v18_educationLevel=="10"

replace v19_hasChangedJobSinceLastYear="sector switch" 	if v16_lastYearAteco12Class!=v15_currentJobAteco12Class
replace v19_hasChangedJobSinceLastYear="new job" 		if v16_lastYearAteco12Class=="  " & v19_hasChangedJobSinceLastYear=="sector switch"