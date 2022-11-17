/**********************************
APPLIED ECONOMICS: LABOUR MARKET
Practical Lecture 2

Master BEA, Dept. of Economics, University of Trento
Autumn 2022

Lecturer: Daniela Piazzalunga
	
Date: 20.10.2022
**********************************/

clear all
set more off
capture log close
cd "G:\Il mio Drive\Teaching\Applied Economics - Labour\PracticalLectures\BEA2022"

// remember to change directory and path to your own

global path "G:\Il mio Drive\Teaching\Applied Economics - Labour\PracticalLectures\BEA2022"
global original "$path\original"
global do "$path\do"
global data "$path\data"
global log "$path\log"
global tables "$path\tables"
global figures "$path\figures"

* FERTILITY data in SILC

* SILC provides the identifiers for the mothr, the father, the child... in a couple
* in the personal register: rb230 is the "mother" , rb220 is the "father"

use "$data\itsilc2015r.dta", clear

	gen double father = rb220
	gen double mother = rb230
	gen double partner = rb240

	lab var mother "mother id"
	lab var father "father id"
	lab var partner "partner id"
	lab var id "personal id"

* age and gender
	lab var rb080 "year of birth"
	gen age = 2015 - rb080
	ren rb080 year_birth

	gen age2=age^2
	gen female = (rb090 == 2)


sort id hh
save "$data\itsilc2015r.dta", replace



/*
I use the Personal register dataset.
The focus of the dataset is the individual: there is one line per individualand
*I generate dummy variables equal to 1 depending on the age of the individual (0-2, 3-5, 6-10, 11-14).
I also identify the mother of each individual with the variable "mother".

Next, for each "mother", I generate the number of children by age group with the following code:
	by mother:  egen ch0_2 = sum(children0_2)
etc.

Note that every child has the id of the mother

I then rename "mother" to "id" and for each mother I drop lines after the first one (there will be more than one depending on the number of children because the file is by individual).
Same for father.
Then I proceed with merge, using id as key variable.
*/

********************************************************************************
*** mother ***

use "$data\itsilc2015r.dta", clear


	*** drop if there is no mother

	drop if mother==.
	drop father partner id
	list mother age in 1/10
	count
	*** number of children 

	sort mother
	list mother age in 1/10

	gen children0_2 = (age<=2) /* I generate a dummy variable equal to 1 if the individual is 0-2 years old*/
	gen children3_5 = (age>=3 & age<=5)
	gen children6_10 = (age>=6 & age<=10)
	gen children11_14 = (age>=11 & age<=14)
list mother age children0_2 children3_5 children6_10 children11_14 in 1/30
* look at lines 9-11 and 27-29

	sort mother

	by mother: egen ch0_2 = sum(children0_2) /* I sum by the mother id the number of children of any age group*/
	by mother: egen ch3_5 = sum(children3_5)
	by mother: egen ch6_10 = sum(children6_10)
	by mother: egen ch11_14 = sum(children11_14)

list mother female age ch0_2 ch3_5 ch6_10 ch11_14 children0_2 children3_5 children6_10 children11_14 in 1/30
* look at lines 9-11 and 27-29

	lab var ch0_2 "number of children of 0-2 years"
	lab var ch3_5 "number of children of 3-5 years"
	lab var ch6_10 "number of children of 6-10 years"
	lab var ch11_14 "number of children of 11-14 years"

	ren mother id /* here is the trick: I rename 'mother' 'id', keep one line, and then use it to merge with the original dataset*/

	keep id ch0_2 ch3_5 ch6_10 ch11_14 
	sort id
	drop if id==id[_n+1] /* I drop if id is equal to the subsequent one*/
	count
	save "$data\mother2015.dta", replace


********************************************************************************
***  father ***

use "$data\itsilc2015r.dta", clear

	*** drop if there is no father

	drop if father==.
	drop mother partner id
	list father age in 1/10

	*** number of children 0-2

	sort father
	list father age hh in 1/10

	gen children0_2 = (age<=2)
	gen children3_5 = (age>=3 & age<=5)
	gen children6_10 = (age>=6 & age<=10)
	gen children11_14 = (age>=11 & age<=14)
	list father age children0_2 children3_5 children6_10 children11_14 in 1/30

	sort father

	by father: egen c0_2 = sum(children0_2)
	by father: egen c3_5 = sum(children3_5)
	by father: egen c6_10 = sum(children6_10)
	by father: egen c11_14 = sum(children11_14)

	list father age c0_2 c3_5 c6_10 c11_14 children0_2 children3_5 children6_10 children11_14 in 1/30

	lab var c0_2 "number of children of 0-2 years"
	lab var c3_5 "number of children of 3-5 years"
	lab var c6_10 "number of children of 6-10 years"
	lab var c11_14 "number of children of 11-14 years"
	
	
	ren father id

	keep id c0_2 c3_5 c6_10 c11_14 
	sort id
	drop if id==id[_n+1]
	count
	sort id
	save "$data\father2015.dta", replace

********************************************************************************
	*** merge

	use "$data\itsilc2015r.dta", clear
	sort id
	merge id using "$data\mother2015.dta"
	tab _m
	drop if _m==2
	drop _m

	sort id
	save "$data\itsilc2015r_2.dta", replace

	use "$data\itsilc2015r_2.dta", clear
	merge id using "$data\father2015.dta"
	tab _m
	drop if _m==2

	replace ch0_2=c0_2 if ch0_2==.
	replace ch3_5=c3_5 if ch3_5==.
	replace ch6_10=c6_10 if ch6_10==.
	replace ch11_14=c11_14 if ch11_14==.


	drop _m c0_2 c3_5 c6_10 c11_14 

	foreach j in ch0_2 ch3_5 ch6_10 ch11_14 {
	replace `j'=0 if `j'==.
	}

sort id
	save "$data\fertility2015.dta", replace

	
*******************************************************************************
*** merge

use "$data\fertility2015.dta", clear
	sort id
	merge id using "$data\itsilc2015full.dta"
	tab _m
	keep if _m==3
	drop _m

save "$data\itsilc2015final.dta", replace
