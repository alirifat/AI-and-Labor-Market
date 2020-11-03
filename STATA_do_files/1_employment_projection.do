*Employment Projection
/* We will use the following tables:
     - Table 1.2 Employment by detailed occupation, 2016 and projected 2026
	 - Table 1.7 Occupational projections, 2016-26, and worker characteristics, 2016
	 - Table 1.10 Occupational separations and openings, projected 2016-26 */
* There are four type of occupations - major, minor, broad and detailed occupations
* We are particularly interested in detailed occupations so that the remaning types will be dropped from the data
* Download the projection from - https://www.bls.gov/emp/ind-occ-matrix/occupation.xlsx
log using "/Users/alirkaya/Desktop/Project/STATA/log_files/bls_projection.log"
cd "/Users/alirkaya/Desktop/Project/STATA"
tempfile projection_1 projection_2 projection_3
set more off

* Table 1.2 Employment by detailed occupation, 2016 and projected 2026
import excel "/Users/alirkaya/Desktop/Project/STATA/csv_files/occupation.xlsx", sheet("Table 1.2") clear
rename (A B C D E F G H I J) ///
       (bls_title onetsoccode type emp_number_2016 emp_number_2026 per_distr_2016 per_distr_2026 chng_number chng_perc open_average)
drop in 1/4
drop if type == "Summary" || onetsoccode == ""
drop type
save "`projection_1'"
********************************************************************************
********************************************************************************

* Table 1.7 Occupational projections, 2016-26, and worker characteristics, 2016
import excel "/Users/alirkaya/Desktop/Project/STATA/csv_files/occupation.xlsx", sheet("Table 1.7") clear
rename (A B C D E F G H I J K L M) ///
       (bls_title onetsoccode type emp_number_2016 emp_number_2026 chng_number chng_perc self_employed open_average median_wage education experience training)
drop in 1/3
drop if type == "Summary" || onetsoccode == ""
drop type
********************************************************************************
label define education1 1 "No formal educational credential" ///
					    2 "High school diploma or equivalent" ///
					    3 "Associate's degree" ///
					    4 "Some college, no degree" ///
					    5 "Bachelor's degree" ///
					    6 "Postsecondary nondegree award" ///
					    7 "Master's degree" ///
					    8 "Doctoral or professional degree"

replace education = "1" if education == "No formal educational credential"
replace education = "2" if education == "High school diploma or equivalent"
replace education = "3" if education == "Associate's degree"
replace education = "4" if education == "Some college, no degree"
replace education = "5" if education == "Bachelor's degree"
replace education = "6" if education == "Postsecondary nondegree award"
replace education = "7" if education == "Master's degree"
replace education = "8" if education == "Doctoral or professional degree"
destring (education), replace

label values education education1
********************************************************************************

label define experience1 1 "None" ///
				         2 "Less than 5 years" ///
				         3 "5 years or more"

replace experience = "1" if experience == "None"
replace experience = "2" if experience == "Less than 5 years"
replace experience = "3" if experience == "5 years or more"
destring (experience), replace

label values experience experience1
********************************************************************************

label define training1 1 "None" ///
					   2 "Appreticeship" ///
					   3 "Internship/residency" ///
					   4 "Short-term on-the-job training" ///
					   5 "Moderate-term on-the-job training" ///
					   6 "Long-term on-the-job training"

replace training = "1" if training == "None"
replace training = "2" if training == "Apprenticeship"
replace training = "3" if training == "Internship/residency"
replace training = "4" if training == "Short-term on-the-job training"
replace training = "5" if training == "Moderate-term on-the-job training"
replace training = "6" if training == "Long-term on-the-job training"
destring (training), replace

label values training training1

save "`projection_2'"
********************************************************************************
********************************************************************************

* Table 1.10 Occupational separations and openings, projected 2016-26
import excel "/Users/alirkaya/Desktop/Project/STATA/csv_files/occupation.xlsx", sheet("Table 1.10") clear
rename (A B C D E F G H I J K L M N) ///
	   (bls_title onetsoccode type emp_number_2016 emp_number_2026 chng_number chng_perc lab_force_exit_rate occ_transfer_rate total_rate lab_force_exit_number occ_transfer_number total_number open_average)
drop in 1/3
drop if type == "Summary" || onetsoccode == ""
drop type
save "`projection_3'"

* Merge Table 1.2, 1.7 and 1.10
use "`projection_1'", clear
merge 1:1 onetsoccode using "`projection_2'", nogenerate
merge 1:1 onetsoccode using "`projection_3'", nogenerate

replace onetsoccode = onetsoccode + ".00"
destring emp_number_2016 per_distr_2016 chng_number chng_perc open_average self_employed median_wage lab_force_exit_rate occ_transfer_rate total_rate lab_force_exit_number occ_transfer_number total_number, replace force
compress
********************************************************************************
********************************************************************************

label variable bls_title "BLS 2010 Occupational Title"
label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable emp_number_2016 "Employment in 2016"
label variable emp_number_2026 "Employment in 2026"
label variable per_distr_2016 "Employment Percent Distribution in 2016"
label variable per_distr_2026 "Employment Percent Distribution in 2026"
label variable chng_number "Change in Employment: Number"
label variable chng_perc "Change in Employment: Percentage"
label variable open_average "Occupational Opennings 2016-26: Annual Average"
label variable self_employed "Percent of Self Employed"
label variable median_wage "Median Annual Wage, 2017"
label variable education "Typical Education Needed for Entry"
label variable experience "Work Experience in a Related Occupation"
label variable training "Typical on-the-job Training for attaining competency"
label variable lab_force_exit_rate "Occupational Seperations Rate 2016-26: Labor Force Exit Rate"
label variable occ_transfer_rate "Occupational Seperations Rate 2016-26 Annual Average: Occupational Transfers Rate"
label variable total_rate "Labor Force Exit Rate + Occupational Transfers Rate"
label variable lab_force_exit_number "Occupational Seperations 2016-26 Annual Average: Labor Force Exit"
label variable occ_transfer_number "Occupational Seperations 2016-26 Annual Average: Occupational Transfers"
label variable total_number "Labor Force Exit + Occupational Transfers"

save dta_files/bls_projection

*END
log close


