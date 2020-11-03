* O*NET Taxonomies can be downloaded from -https://www.onetcenter.org/taxonomy.html
log using "/Users/alirkaya/Desktop/Project/STATA/log_files/new_work.log", replace
cd "/Users/alirkaya/Desktop/Project/STATA"
tempfile tax_2000 tax_2006 tax_2009 tax_2010 cross_2006 cross_2009 cross_2010 cross_2010_1 new_work_2006 new_work_2009 new_work_2010 new_work
set more off

* TAXONOMIES
import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/Taxonomies/2000_Occupations.csv", varnames(1) clear
drop onetsoc2000description
rename (onetsoc2000code onetsoc2000title) (onetsoccode onet_title)
save "`tax_2000'"

import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/Taxonomies/2006_Occupations.csv", varnames(1) clear
drop onetsoc2006description
rename (onetsoc2006code onetsoc2006title) (onetsoccode onet_title)
save "`tax_2006'"

import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/Taxonomies/2009_Occupations.csv", varnames(1) clear
drop onetsoc2009description
rename (onetsoc2009code onetsoc2009title) (onetsoccode onet_title)
save "`tax_2009'"

import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/Taxonomies/2010_Occupations.csv", varnames(1) clear
drop onetsoc2010description
rename (onetsoc2010code onetsoc2010title) (onetsoccode onet_title)
save "`tax_2010'"

* CROSSWALKS
import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/Crosswalks/2000_to_2006_Crosswalk.csv", varnames(1) clear
drop onetsoc2000code onetsoc2000title
rename (onetsoc2006code onetsoc2006title) (onetsoccode onet_title)
duplicates drop onet_title, force
save "`cross_2006'"

import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/Crosswalks/2006_to_2009_Crosswalk.csv", varnames(1) clear
drop onetsoc2006code onetsoc2006title
rename (onetsoc2009code onetsoc2009title) (onetsoccode onet_title)
save "`cross_2009'"

import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/Crosswalks/2009_to_2010_Crosswalk.csv", varnames(1) clear
drop onetsoc2009code onetsoc2009title
rename (onetsoc2010code onetsoc2010title) (onetsoccode onet_title)
duplicates drop onet_title, force
save "`cross_2010'"

* NEW WORK 2006
use "`tax_2006'", clear
merge 1:1 onetsoccode using "`cross_2006'", nogenerate keepusing(onetsoccode) keep(1)
generate year = 2006
save "`new_work_2006'"

* NEW WORK 2009
use "`tax_2009'", clear
merge 1:1 onetsoccode using "`cross_2009'", nogenerate keepusing(onetsoccode) keep(1)
generate year = 2009
save "`new_work_2009'"

* NEW WORK 2010
use "`tax_2010'", clear
merge 1:1 onetsoccode using "`cross_2010'", nogenerate keepusing(onetsoccode) keep(1)
generate year = 2010
save "`new_work_2010'"

*NEW WORK MERGE 2006-2009-2010
use "`new_work_2006'", clear
append using "`new_work_2009'"
append using "`new_work_2010'"
save "`new_work'"

*Update SOC Codes
import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/Crosswalks/2009_to_2010_Crosswalk.csv", varnames(1) clear
drop onetsoc2009code onetsoc2010title
duplicates drop onetsoc2009title, force
rename (onetsoc2009title onetsoc2010code) (onet_title onetsoccode)
save "`cross_2010_1'"

use "`new_work'", clear
merge 1:1 onet_title using "`tax_2010'", nogenerate keep(1 3 5) update replace
* To update onetsoccodes of new work occupations, merge with most updated data (tax_2010) and replace the codes.
* 165/173 of the new work occupations are updated using tax_2010.
* The remaining 8 new work occupation's onetsoccodes will be updated using 2009-2010 taxonomy.
* However 3 of those are already up to date.
merge 1:1 onet_title using "`cross_2010_1'", nogenerate keep(1 3 5) update replace

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"
label variable year "Year that New Work Occupation First Observed"

save dta_files/new_work

*END
log close


