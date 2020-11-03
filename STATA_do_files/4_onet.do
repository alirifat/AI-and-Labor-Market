* ACS 2016 Data & ONET Skill and Abilities Data
* Download ONET 22.3 Database - https://www.onetcenter.org/db_releases.html
* Download ACS 2016 1% Sample - https://usa.ipums.org/usa/
* Download ACS Codes -https://usa.ipums.org/usa-action/variables/US2016A_1125#description_section
* The following data from O*NET used in the research:
*    - Abilities
*	 - Knowledge
*	 - Skills
*	 - Work Activities
* The data converted to the .dta format
* "IM" scale represents the importance rating of the corresponding activity, "LV" scale represents the level rating.
* "data_#" represents the level rating and "data_IM_#" represents the importance rating. (# represents the unique number given by STATA to each activity in the encoding process)
* ONET data are available for 966 ONET detailed occupations 
* Data consist of 52 abilities, 41 activities, 33 Knowledge and 35 skills
 
log using "/Users/alirkaya/Desktop/Project/STATA/log_files/onet_data.log"
set more off
cd "/Users/alirkaya/Desktop/Project/STATA"
********************************************************************************
mkdir "/Users/alirkaya/Desktop/Project/STATA/onet_data"
import excel "/Users/alirkaya/Desktop/Project/STATA/db_22_3_excel/Abilities.xlsx", sheet("Abilities") firstrow case(lower) clear
save onet_data/ability
import excel "/Users/alirkaya/Desktop/Project/STATA/db_22_3_excel/Work Activities.xlsx", sheet("Work Activities") firstrow case(lower) clear
save onet_data/activity
import excel "/Users/alirkaya/Desktop/Project/STATA/db_22_3_excel/Knowledge.xlsx", sheet("Knowledge") firstrow case(lower) clear
save onet_data/knowledge
import excel "/Users/alirkaya/Desktop/Project/STATA/db_22_3_excel/Skills.xlsx", sheet("Skills") firstrow case(lower) clear
save onet_data/skill

***onet program
capture program drop onet
capture program onet
    use onet_data/`1'.dta, clear 
    encode elementname, generate(element_num)
    label drop element_num
    drop elementid scalename n standarderror lowercibound uppercibound date domainsource recommendsuppress notrelevant
	tempfile importance
    keep if scaleid == "IM" // to obtaine the level data replace with "LV"
    drop scaleid
    save "`importance'"
	sum element_num, meanonly
  forvalues s = 1/`r(max)'{
    tempfile `s'_
    use "`importance'", clear
    keep if element_num == `s'
    rename datavalue datavalueIM
    save "``s'_'" 
  } 
  	sum element_num, meanonly
    use "`1_'", clear
	foreach s of numlist 2/`r(max)'{
    append using "``s'_'"
  } 
    rename datavalueIM `1'_
	sort elementname
    encode (elementname), generate (`1')
    drop elementname element_num
    label drop `1'
    reshape wide `1'_, i(onetsoccode) j(`1')
    order title, after(onetsoccode)
    save dta_files/onet_`1'
end

capture onet ability
capture onet activity
capture onet knowledge
capture onet skill

***onet merge
use dta_files/onet_ability, clear
merge 1:1 onetsoccode using dta_files/onet_activity, nogenerate
merge 1:1 onetsoccode using dta_files/onet_knowledge, nogenerate
merge 1:1 onetsoccode using dta_files/onet_skill, nogenerate
rename title onet_title

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"
capture do do_files/label_do_files/label_onet_variables.do

shell rm -r "/Users/alirkaya/Desktop/Project/STATA/onet_data"

save dta_files/onet

*END 
log close


