// This file is used to generate the first descriptive statistics and plots

* Load the dataset
use $db_03_firstPass

foreach var in $myVarString{
	cd "$path"
	use "$db_03_firstPass", clear
	cd "$pictures"
	gen acc = 1
	
	keep `var' acc

	collapse (sum) acc, by(`var')

	// -----------------------------------------------

	graph hbar (sum) acc, 	///
			over(`var') ///
			title("Occurrences of `var'", size(small)) ///
			missing

	graph export "$pictures/Freq_`var'_withMissing.png", replace 

	// -----------------------------------------------

	graph hbar (sum) acc if `var'!=" ", 	///
		over(`var') ///
		title("Occurrences of `var' without missing values", size(small))

	graph export "$pictures/Freq_`var'_noMissing.png", replace 

}

// Compute and save for each variable the fre[quency] command
use "$db_03_firstPass", clear

foreach var in $myVar{
	log using "$path/results/Fre_`var'.log", replace
	fre `var'
	log close
}

log using "$path/results/Fre_ALL.log", replace
foreach var in $myVar{
	fre `var'
}
log close

foreach var in $myVar{
	log using "$path/results/Summarize_`var'.log", replace
	summarize `var'
	log close
}
