* Startup
clear all
global path "/home/etrunon/Documents/UniBea/12LabourMarket/Project"
global sourceDataset "$path/01SelectedAndCleaned.dta"

local pictures "$path/results"

* Load the dataset

global myVarList "v01_isPartTimeVoluntary" // v02_distributionHourReduction v03_partTimeReason v04_if03HasToCareWhatIsReason v05_livingAddress5Areas v06_livingAddress3Areas v07_citizenship v08_age v09_professionalTier v10_employeeContractLenght v11_mainJobTitle v12_usualJobSite v13_netLastMonthWage v14_lastYearJobType v15_currentJobAteco12Class v16_lastYearAteco12Class v17_isLookingForAnotherJob v18_educationLevel v19_hasChangedJobSinceLastYear"

foreach var in $myVarList{
	cd "$path"
	use "$sourceDataset", clear
	cd "`pictures'"
	gen acc = 1
	
	keep `var' acc

	collapse (sum) acc, by(`var')

	graph hbar acc, 	///
			over(`var') ///
			title(`var', size(small)) ///
			b1title("Occurrences")

	graph export "`pictures'/Freq`var'.png", replace 
}
