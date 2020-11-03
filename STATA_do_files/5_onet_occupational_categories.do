*This do file creates data files for each type of O*NET occupational categories.
log using "/Users/alirkaya/Desktop/Project/STATA/log_files/onet_occ_categories.log", replace
cd "/Users/alirkaya/Desktop/Project/STATA"
tempfile bright green stem new_emerging
set more off

*ALL BRIGHT OCCUPATIONS
import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/ONET_occ_categories/All_Bright_Outlook_Occupations.csv", varnames (1) clear 
rename (code occupation) (onetsoccode onet_title)
tab categories, generate(cat)
replace cat1 = cat3 if cat1 == 0
replace cat2 = cat3 if cat2 == 0
rename (cat1 cat2) (num_job_open rapid_growth)
drop categories cat3

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"
label variable rapid_growth "Rapid-Growth Bright Occupations"
label variable num_job_open "Number-of-Job-Openings Bright Occupations"

save "`bright'"

*GREEN OCCUPATIONS
import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/ONET_occ_categories/All_Green_Economy_Sectors.csv", varnames(1) clear
rename (code occupation) (onetsoccode onet_title)
tab category, generate(cat)
rename (cat1 cat2 cat3) (green_enhanced green_increased green_new_emerging)
drop category

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"
label variable sectors "Sectors of Green Occupational Titles"
label variable green_enhanced "Green Enhanced Occupational Titles Category"
label variable green_increased "Green Increased Occupational Titles Category"
label variable green_new_emerging "Green New & Emerging Occupational Titles Category"

save "`green'"

*STEM OCCUPATIONS
import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/ONET_occ_categories/All_STEM_Occupations.csv", varnames(1) clear
rename (code occupation) (onetsoccode onet_title)
encode occupationtypes, generate(occupationtype)
drop occupationtypes
/*label values
occupationtype 1 "Managerial"
			   2 "Postsecondary Teaching"
			   3 "Research, Development, Design, and Practioners"
			   4 "Sales"
			   5 "Technologists and Technicians"
			   */

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"
label variable occupationtype "Types of STEM Occupations"

save "`stem'"

*NEW & EMRGING OCCUPATIONS
import excel "/Users/alirkaya/Desktop/Project/STATA/csv_files/ONET_occ_categories/UpdatingTaxonomy2009_AppB.xls", sheet("Appendix B") clear
rename (A B) (onetsoccode onet_title)
keep in 5/163
replace onet_title = substr(onet_title,1,strpos(onet_title,"*")-1) if substr(onet_title,-1,.) == "*"
save "`new_emerging'"

*updating onetsoccodes of the new & emeging occupations for database 22.3
*the number of occupations increased to 160 due to the split of "Ophthalmic Medical Technologists and Technicians" in two seperate titles
import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/Crosswalks/2009_to_2010_Crosswalk.csv", varnames(1) clear
rename onetsoc2009code onetsoccode
merge m:1 onetsoccode using "`new_emerging'", nogenerate keep(3) keepusing(onetsoccode)
drop onetsoccode onetsoc2009title
rename (onetsoc2010code onetsoc2010title) (onetsoccode onet_title)

/*In database 22.3:
* |ONETOSCCODE 2009|                 TITLE 2009                     |ONETSOCCODE 2010|              TITLE 2010                  |
* |----------------|------------------------------------------------|----------------|------------------------------------------|
* |      11-3051.04|Biomass Production Managers                     |      11-3051.04|Biomass Power Plant Managers              |
* |      25-3099.01|Adaptive Physical Education Specialists         |      25-2059.01|Adapted Physical Education Specialists    |
* |      29-2099.01|Electroneurodiagnostic Technologists            |      29-2099.01|Neurodiagnostic Technologists             |
* |      15-1099.12|Electronic Commerce Specialists                 |      15-1199.10|Search Marketing Strategists              |
* |      33-9099.02|Loss Prevention Specialists                     |      33-9099.02|Retail Loss Prevention Specialists        |
* |      15-1099.03|Network Designers                               |      15-1143.00|Computer Network Architects               |
* |      29-2099.03|Ophthalmic Medical Technologists and Technicians|      29-2057.00|Ophthalmic Medical Technicians            |
* |      29-2099.03|Ophthalmic Medical Technologists and Technicians|      29-2099.05|Ophthalmic Medical Technologists          |
* |      15-1081.01|Telecommunications Specialists                  |      15-1143.01|Telecommunications Engineering Specialists|
* |      33-9099.01|Transportation Security Officers                |      33-9093.00|Transportation Security Screeners         |
*********************************************************************************************************************************
*/

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"

save "`new_emerging'", replace

*identify how many BLS occupational titles included in each occupational category
use "`bright'", clear
merge 1:1 onetsoccode using "`green'", generate(merge_green)
generate bright = inlist(merge_green, 1, 3)
generate green = inlist(merge_green, 2, 3)
merge 1:1 onetsoccode using "`stem'", generate(merge_stem)
generate stem = inlist(merge_stem, 2, 3)
merge 1:1 onetsoccode using "`new_emerging'", generate(merge_new)
generate new_emerging = inlist(merge_new, 2, 3)
drop merge_*

count if bright == 1						   // 434 Bright Occupational Titles
count if green == 1							   // 204 Green Occupational Titles
count if stem == 1							   // 308 STEM Occupational Titles
count if new_emerging == 1					   // 160 New & Emerging Occupational Titles

generate code_2 = substr(onetsoccode,9,2)
count if code_2 == "00" & bright == 1 		   // 330 BLS Occupational Titles
count if code_2 == "00" & green == 1		   // 104 BLS Occupational Titles
count if code_2 == "00" & stem == 1 	   	   // 184 BLS Occupational Titles
count if code_2 == "00" & new_emerging == 1    // 11 BLS Occupational Titles


********************************************************************************
*identify how many of the titles of the occupational categories has O*NET data
merge 1:1 onetsoccode using dta_files/onet, keepusing(onetsoccode) keep(1 3)
recode _merge (1 2 = 0) (3 = 1), generate(onet_data)
drop _merge code_2
count if bright == 1 & onet_data == 1.          // 388 Bright Occupational Titles have O*NET Data
count if green == 1 & onet_data == 1			// 199 Green Occupational Titles have O*NET Data
count if stem == 1 & onet_data == 1				// 276 STEM Occupational Titles have O*NET Data
count if new_emerging == 1 & onet_data == 1		// 154 New & Emerging Occupational Titles have O*NET Data

/*export occupational titles as excel files
preserve
replace title = title + "*" if onet_data == 1
export excel using "/Users/alirkaya/Desktop/Project/STATA/bright_onet.xlsx" if bright == 1, firstrow(variables)
export excel using "/Users/alirkaya/Desktop/Project/STATA/green_onet.xlsx" if green == 1, firstrow(variables)
export excel using "/Users/alirkaya/Desktop/Project/STATA/stem_onet.xlsx" if stem == 1, firstrow(variables)
export excel using "/Users/alirkaya/Desktop/Project/STATA/new_emerging_onet.xlsx" if new_emerging == 1, firstrow(variables)
*/

count if bright == 1 & green == 1				// 64 Bright and Green Occupational Titles
count if bright == 1 & stem == 1				// 162 Bright and STEM Occupational Titles
count if bright == 1 & new_emerging == 1		// 75 Bright and New & Emerging Occupational Titles
count if green == 1 & stem == 1					// 82 Green and STEM Occupational Titles
count if green == 1 & new_emerging == 1			// 78 Green and New & Emerging Occupational Titles
count if stem == 1 & new_emerging == 1			// 100 STEM and New & Emerging Occupaitonal Titles

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"
label variable bright "Bright Occupational Titles"
label variable green "Green Occupational Titles"
label variable stem "STEM Occupational Titles"
label variable new_emerging "New & Emerging Occupational Titles"
label variable onet_data "Binary Variable if Occupational Title Has O*NET Data"

order bright green stem new_emerging, after(onet_title)

save dta_files/onet_occupational_categories
log close

*END
