* Startup
clear all
global path "/home/etrunon/Documents/UniBea/12LabourMarket/Project"
global sourceDataset "$path/01SelectedAndCleaned.dta"

local pictures "$path/results"

cd "$path"
* Load the dataset

global myVar "v01_isPartTimeVoluntary v02_distributionHourReduction v03_partTimeReason v04_if03HasToCareWhatIsReason v05_livingAddress5Areas v06_livingAddress3Areas v07_citizenship v08_age v09_professionalTier v10_employeeContractLenght v11_mainJobTitle v12_usualJobSite v13_netLastMonthWage v14_lastYearJobType v15_currentJobAteco12Class v16_lastYearAteco12Class v17_isLookingForAnotherJob v18_educationLevel v19_hasChangedJobSinceLastYear"
global myVarInt "v08_age v13_netLastMonthWage"
global myVarString "v01_isPartTimeVoluntary v02_distributionHourReduction v03_partTimeReason v04_if03HasToCareWhatIsReason v05_livingAddress5Areas v06_livingAddress3Areas v07_citizenship  v09_professionalTier v10_employeeContractLenght v11_mainJobTitle v12_usualJobSite v14_lastYearJobType v15_currentJobAteco12Class v16_lastYearAteco12Class v17_isLookingForAnotherJob v18_educationLevel v19_hasChangedJobSinceLastYear"

foreach var in $myVarString{
	cd "$path"
	use "$sourceDataset", clear
	cd "`pictures'"
	gen acc = 1
	
	keep `var' acc

	collapse (sum) acc, by(`var')

	// -----------------------------------------------

	graph hbar (sum) acc, 	///
			over(`var') ///
			title("Occurrences of `var'", size(small)) ///
			missing

	graph export "`pictures'/Freq_`var'_withMissing.png", replace 

	// -----------------------------------------------

	graph hbar (sum) acc if `var'!=" ", 	///
		over(`var') ///
		title("Occurrences of `var' without missing values", size(small))

	graph export "`pictures'/Freq_`var'_noMissing.png", replace 

}

// Compute and save for each variable the fre[quency] command
use "$sourceDataset", clear

foreach var in $myVar{
	log using "$path/results/Fre_`var'.log"
	fre `var'
	log close
}

log using "$path/results/Fre_ALL.log"
foreach var in $myVar{
	fre `var'
}
log close

foreach var in $myVar{
	log using "$path/results/Summarize_`var'.log"
	summarize `var'
	log close
}
