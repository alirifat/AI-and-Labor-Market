*INSTALLED PACKAGE: DISTINCT

log using "/Users/alirkaya/Desktop/Project/STATA/log_files/title_difference_kaiser.log"
cd "/Users/alirkaya/Desktop/Project/STATA"
tempfile bright green stem new_emerging
set more off

use dta_files/title_acs_bls_onet, clear
merge 1:1 onetsoccode using dta_files/onet_occupational_categories, nogenerate keepusing(bright green stem new_emerging)
merge 1:1 onetsoccode using dta_files/onet, nogenerate keepusing(onetsoccode) keep(3)
replace bright = 0 if missing(bright)
replace green = 0 if missing(green)
replace stem = 0 if missing(stem)
replace new_emerging = 0 if missing(new_emerging)
recast str128 acs_title
save dta_files/title_difference

distinct acs_title if bright == 1
// 209 unique ACS titles in Bright occupations
distinct acs_title if green == 1
// 120 unique ACS titles in Bright occupations
distinct acs_title if stem == 1
// 88 unique ACS titles in Bright occupations
distinct acs_title if new_emerging == 1
// 63 unique ACS titles in Bright occupations

savesome acs_title if bright == 1 using "`bright'"
savesome acs_title if green == 1 using "`green'"
savesome acs_title if stem == 1 using "`stem'"
savesome acs_title if new_emerging == 1 using "`new_emerging'"

foreach f in "`bright'" "`green'" "`stem'" "`new_emerging'" {
	use `f', clear
	duplicates drop acs_title, force
	save `f', replace
	}

use dta_files/title_difference, clear
merge m:1 acs_title using "`bright'", generate(bright_acs)
merge m:1 acs_title using "`green'", generate(green_acs)
merge m:1 acs_title using "`stem'", generate(stem_acs)
merge m:1 acs_title using "`new_emerging'", generate(new_emerging_acs)

recode bright_acs (1 2 = 0) (3 = 1)
recode green_acs (1 2 = 0) (3 = 1)
recode stem_acs (1 2 = 0) (3 = 1)
recode new_emerging_acs (1 2 = 0) (3 = 1)

count if bright_acs == 1 & bright == 0
// 116 O*NET occupational titles are listed under the same ACS occupational titles that \\\
// Bright Occupational titles listed; even though, they are not categorized as Bright Occupations
count if green_acs == 1 & green == 0
// 144 O*NET occupational titles are listed under the same ACS occupational titles that \\\
// Green Occupational titles listed; even though, they are not categorized as Green Occupations
count if stem_acs == 1 & stem == 0
// 19 O*NET occupational titles are listed under the same ACS occupational titles that \\\
// STEM Occupational titles listed; even though, they are not categorized as STEM Occupations
count if new_emerging_acs == 1 & new_emerging == 0
// 127 O*NET occupational titles are listed under the same ACS occupational titles that \\\
// New & Emerging Occupational titles listed; even though, they are not categorized as New & Emerging Occupations
save dta_files/title_difference, replace

duplicates drop acs_title, force
keep acs_title *_acs
save dta_files/acs_title_occupational_categories

*END
log close
