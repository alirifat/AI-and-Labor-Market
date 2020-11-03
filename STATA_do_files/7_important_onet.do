* Identify most important O*NET variables by calculating mean

log using "/Users/alirkaya/Desktop/Project/STATA/log_files/important_onet_sum.log", replace
cd "/Users/alirkaya/Desktop/Project/STATA"
set more off

***ALL O*NET OCCUPATIONS
use dta_files/onet_occupational_categories, clear
merge 1:1 onetsoccode using dta_files/onet, nogenerate keep(2 3)
capture foreach v of varlist ability_1-skill_35 {
	egen all_`v' = mean(`v')
		}
keep all_*
duplicates drop all_ability_1, force
rename all_* *
xpose, clear varname
generate category = ""
replace category = "ability" if _n <= 52
replace category = "activity" if _n > 52 & _n <= 93
replace category = "knowledge" if _n > 93 & _n <= 126
replace category = "skill" if category == ""
capture do do_files/label_important.do
rename (v1 _varname) (score onet_variable)
gsort - score
*export excel using "/Users/alirkaya/Desktop/Project/STATA/important_all.xlsx", firstrow(variables)

***O*NET OCCUPATIONAL CATEGORIES
local occupations bright green stem new_emerging
capture foreach i of local occupations {
	use dta_files/onet_occupational_categories, clear
	merge 1:1 onetsoccode using dta_files/onet, nogenerate
		capture foreach v of varlist ability_1-skill_35 {
			egen `i'_`v' = mean(`v') if `i' == 1 & onet_data == 1
		}
	keep if `i' == 1 & onet_data == 1
	keep `i'_*
	duplicates drop `i'_ability_1, force
	rename `i'_* *
	xpose, clear varname
	generate category = ""
	replace category = "ability" if _n <= 52
	replace category = "activity" if _n > 52 & _n <= 93
	replace category = "knowledge" if _n > 93 & _n <= 126
	replace category = "skill" if category == ""
	capture do do_files/label_important.do
	rename (v1 _varname) (score onet_variable)
	gsort - score
	*export excel using "/Users/alirkaya/Desktop/Project/STATA/important_`i'.xlsx", firstrow(variables)
	}

*END
log close
