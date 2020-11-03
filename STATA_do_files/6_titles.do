*This file provides O*NET Occupational Titles; BLS Occupational Titles; and ACS Occupational Titles
log using "/Users/alirkaya/Desktop/Project/STATA/log_files/titles.log"

cd "/Users/alirkaya/Desktop/Project/STATA"
tempfile acs_detailed acs_broad acs_minor acs_combined
set more off
********************************************************************************

*O*NET Titles
import excel "/Users/alirkaya/Desktop/Project/STATA/db_22_3_excel/Occupation Data.xlsx", sheet("Occupation Data") firstrow clear
rename (ONETSOCCode Title) (onetsoccode onet_title)
drop Description

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"
save dta_files/title_onet
********************************************************************************

*ACS Titles
import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/ACS_2016_Codes.csv", varnames(1) clear
drop if code == "" | code == "Code"
rename (code label v3) (onetsoccode acs_title count)
replace acs_title = substr(acs_title,5,.)
replace acs_title = substr(acs_title,1,strpos(acs_title," *")-1) if substr(acs_title,-1,.) == "*"
replace onetsoccode = substr(onetsoccode,1,2) + "-" + substr(onetsoccode,3,4) + ".00"
replace acs_title = proper(acs_title)
replace acs_title = "Meeting, Convention, And Event Planners" if acs_title == "Meeting Convention, And Event Planners"
replace acs_title = "Explosives Workers, Ordnance Handling Experts, And Blasters" if acs_title == "Explosives Workers, Ordnance Handling Experts, And V"
replace acs_title = "Electronic Equipment Installers And Repairers, Motor Vehicles" if acs_title == "Electronic Equipment Installers And Repairers, Motor"
replace acs_title = "Electronic Home Entertainment Equipment Installers And Repairers" if acs_title == "Electronic Home Entertainment Equipment Installers And"
replace acs_title = "Helpers--Production Workers" if acs_title == "Helpers-Production Workers"
replace acs_title = "Brickmasons And Blockmasons, Stonemasons, And Reinforcing Iron And Rebar Workers" if acs_title == "Brickmasons, Blockmasons, Stonemasons, And Reinforcing Iron And Rebar Workers"
replace acs_title = "Healthcare Support Workers, All Other, Including Medical Equipment Preparers" if acs_title == "Thcare Support Workers, All Other, Including Medical Equipment Preparers"
replace acs_title = "Software Developers, Applications And Systems Software" if acs_title == "Software Developers,Applications And Systems Software"
*The following ACS titles dropped since they do not represent the sample
drop if onetsoccode == "99-9920.00"	// Ployed And Last Worked 5 Years Ago Or Earlier Or Never Worked
drop if onetsoccode == "BB-BBBB.00" // Less Than 16 Years Old/Nilf Who Last Worked More Than 5 Years Ago Or Never Worked)
drop if onetsoccode	== "55-9830.00" // Military, Rank Not Specified

label variable onetsoccode "ACS/BLS Occupational Code" // The occupational codes are based on BLS Occupational Codes
													   // However, because of ACS classification some occupational codes are
													   // modified by ACS to group BLS Occupational Titles.
													   // This is why the label says "ACS/BLS" occupational codes.
													   // The var name "onetsoccode" is chosen to be consistent with other datasets
													   // so that there is no problem while merging datas.
													   
label variable acs_title "ACS 2016 Occupational Title"
label variable count "Count of Each ACS Occupational Title"
recast str128 acs_title
save dta_files/title_acs
********************************************************************************

*BLS Titles
import excel "/Users/alirkaya/Desktop/Project/STATA/csv_files/SOC_structures/soc_structure_2010.xls", sheet("Sheet1") clear
drop in 1/13
egen onetsoccode = concat(A B C D)
replace onetsoccode = substr(onetsoccode, 1, 7) + ".00"
generate category = "major" if A != ""
replace category = "minor" if B != ""
replace category = "broad" if C != ""
replace category = "detailed" if D != ""
generate bls_title = proper(E)

preserve
replace A = A[_n-1] if A == ""
replace B = B[_n-1] if B == ""
replace C = C[_n-1] if C == ""
drop if D == ""
replace A = substr(A,1,7) + ".00"
replace B = substr(B,1,7) + ".00"
replace C = substr(C,1,7) + ".00"
replace D = substr(D,1,7) + ".00"
rename (A B C D) (major minor broad detailed)
drop E-category
save dta_files/title_bls_table
restore

drop A-J

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable bls_title "BLS SOC 2010 Occupational Title"
label variable category "Category of BLS Occupational Title" // BLS occupational titles are categorized, by BLS, as follows:
															 // i.   major BLS occupations
															 // ii.  minor BLS occupations
															 // iii. broad BLS occupations
															 // iv.  detailed BLS occupations
save dta_files/title_bls
savesome if category == "minor" using dta_files/title_bls_minor
savesome if category == "broad" using dta_files/title_bls_broad
savesome if category == "detailed" using dta_files/title_bls_detailed
********************************************************************************

*Mapping O*NET & BLS Titles onto ACS Titles
use dta_files/title_acs, clear
merge 1:1 onetsoccode using dta_files/title_bls_detailed, keepusing(onetsoccode) keep(1 3) generate(merge1)
merge 1:1 onetsoccode using dta_files/title_bls_broad, keepusing(onetsoccode) keep(1 3) generate(merge2)
merge 1:1 onetsoccode using dta_files/title_bls_minor, keepusing(onetsoccode) keep(1 3) generate(merge3)
recode merge1 (1 2 = 0) (3 = 1), generate(acs_detailed)
recode merge2 (1 2 = 0) (3 = 1), generate(acs_broad)
recode merge3 (1 2 = 0) (3 = 1), generate(acs_minor)
generate acs_combined = acs_detailed == 0 & acs_broad == 0 & acs_minor == 0

preserve
keep if acs_broad == 1
rename onetsoccode broad
keep broad acs_title
merge 1:m broad using dta_files/title_bls_table, generate(merge1) keepusing(detailed bls_title)
recode merge1 (1 2 = 0) (3 = 1), generate(acs_broad)
keep bls_title acs_broad
save broad, replace
restore, preserve

keep if acs_minor == 1
rename onetsoccode minor
keep minor acs_title
merge 1:m minor using dta_files/title_bls_table, generate(merge1) keepusing(detailed bls_title)
recode merge1 (1 2 = 0) (3 = 1), generate(acs_minor)
keep bls_title acs_minor
save minor, replace
restore, preserve

keep if acs_detailed == 1
rename onetsoccode detailed
keep detailed acs_title
merge 1:m detailed using dta_files/title_bls_table, generate(merge1) keepusing(detailed bls_title)
recode merge1 (1 2 = 0) (3 = 1), generate(acs_detailed)
keep bls_title acs_detailed
save detailed, replace
restore, preserve

use detailed, clear
merge 1:1 bls_title using broad, nogenerate
merge 1:1 bls_title using minor, nogenerate
generate acs_combined = acs_detailed == 0 & acs_broad == 0 & acs_minor == 0
save dta_files/title_bls_table, replace
erase broad.dta
erase minor.dta
erase detailed.dta
restore

merge 1:1 onetsoccode using dta_files/title_bls_detailed, nogenerate keepusing(onetsoccode bls_title)
do do_files/title_acs_combined_minor.do
sort onetsoccode
replace acs_title = acs_title[_n-1] if acs_title == ""
drop if bls_title == ""
merge 1:1 onetsoccode using dta_files/title_onet, nogenerate
sort onetsoccode
replace acs_title = acs_title[_n-1] if acs_title == ""
replace bls_title = bls_title[_n-1] if bls_title == ""
drop if onet_title == ""
replace acs_title = proper(acs_title)
drop merge1-acs_combined
merge m:1 bls_title using dta_files/title_bls_table, nogenerate
order bls_title onet_title, after(acs_title)

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"
label variable bls_title "BLS 2010 Occupational Title"
label variable acs_title "ACS 2016 Occupational Title"
label variable count "Count of Each ACS Occupational Title"
label variable acs_detailed "ACS Titles Matched with BLS 2010 Detailed Occupational Titles"
label variable acs_broad "ACS Titles Matched with BLS 2010 Broad Occupational Titles"
label variable acs_minor "ACS Titles Matched with BLS 2010 Minor Occupational Titles"
label variable acs_combined "ACS Titles That Generated by Bundeling BLS 2010 Detailed Occupational Titles"

save dta_files/title_acs_bls_onet

*END
log close
