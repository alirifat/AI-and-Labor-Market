log using "/Users/alirkaya/Desktop/Project/STATA/log_files/regression_ready_data_kaiser.log"
cd "/Users/alirkaya/Desktop/Project/STATA"
set more off

*Merge with ACS 2016
*ACS 2016
use acs_data/usa_00002, clear
rename occsoc onetsoccode
replace onetsoccode = substr(onetsoccode,1,2)+"-"+substr(onetsoccode,3,4)+".00"
merge m:1 onetsoccode using dta_files/onet_factor_results_average, nogenerate keep(3)

*prepare data for regression
gen lnwage = ln(incwage)
drop if lnwage == .                               //314.034 observations dropped
drop if age < 25 | age > 55                       //578.491 observations dropped

recode educd (0 1 2 10 11 12 13 14 15 16 17 20 21 22 23 24 25 26 30 40 50 60 61 = 1) ///
             (62 63 64 = 2) ///
			 (65 70 71 80 81 82 83 90 100 = 3) ///
			 (101 110 111 112 113 = 4) ///
			 (114 115 = 5) ///
			 (116 = 6), generate(education_completed)
sort education_completed
tabulate education_completed, generate(school)
rename (school1 school2 school3 school4 school5 school6) ///
	   (less_highschool highschool somecollege college masters doctorate)

recode race (4 5 6 = 4) ///
		    (7 8 9 = 5), generate(race_cat)
sort race_cat
tabulate race_cat, generate(race)
rename (race1 race2 race3 race4 race5) ///
	   (white black native asian other)

recode hispan (1 2 3 4 = 1), generate(hispanic)

recode sex (1 = 0) ///
		   (2 = 1), generate(female)

recode educd (2 11 12 = 0) ///
			 (14 = 1) ///
			 (15 = 2) ///
			 (16 = 3) ///
			 (17 = 4) ///
			 (22 = 5) ///
			 (23 = 6) ///
			 (25 = 7) ///
			 (26 = 8) ///
			 (30 = 9) ///
			 (40 = 10) ///
			 (50 = 11) ///
			 (61 63 64 = 12) ///
			 (65 71 = 13) ///
			 (81 = 14) ///
			 (101 = 16) ///
			 (114 115 = 18) ///
			 (116 = 22), generate(schooling)

generate potential_exp = age - schooling - 6
generate potential_exp_sq = potential_exp^2
drop education_completed race_cat

save dta_files/onet_acs_data
********************************************************************************
* identifying ACS 2016 occupational titles according to their corresponded O*NET occupational category
merge m:1 acs_title using dta_files/acs_title_occupational_categories, nogenerate

* generating dummy variables (1 = if variable >= p75)
foreach var of varlist physical_abilities-stem_skills_pr_rs {
	sum `var', detail
	gen `var'_75 = `var' >= `r(p75)' if `var' < .
}

*generate state variable
drop if statefip == 11					   // 2.647 observations // district of columbia

gen state = statefip
replace state = state - 1 if state >= 4 & state <= 6
replace state = state - 2 if state >= 8 & state <= 10
replace state = state - 3 if state >= 12 & state <= 13
replace state = state - 4 if state >= 15 & state <= 42
replace state = state - 5 if state >= 44 & state <= 51
replace state = state - 6 if state >= 53 & state <= 56

label define states 1 "Alabama" 2 "Alaska" 3 "Arizona" 4 "Arkansas" 5 "California" 6 "Colorado" 7 "Connecticut" 8 "Delaware" 9 "Florida" 10 "Georgia" 11 "Hawaii" 12 "Idaho" 13 "Illinois" 14 "Indiana" 15 "Iowa" 16 "Kansas" 17 "Kentucky" 18 "Louisiana" 19 "Maine" 20 "Maryland" 21 "Massachusetts" 22 "Michigan" 23 "Minnesota" 24 "Mississippi" 25 "Missouri" 26 "Montana" 27 "Nebraska" 28 "Nevada" 29 "New Hampshire" 30 "New Jersey" 31 "New Mexico" 32 "New York" 33 "North Carolina" 34 "North Dakota" 35 "Ohio" 36 "Oklahoma" 37 "Oregon" 38 "Pennsylvania" 39 "Rhode Island" 40 "South Carolina" 41 "South Dakota" 42 "Tennessee" 43 "Texas" 44 "Utah" 45 "Vermont" 46 "Virginia" 47 "Washington" 48 "West Virginia" 49 "Wisconsin" 50 "Wyoming"
label values state states


label variable social_skills "Social Skills"
label variable technical_skills "Technical Skills"
label variable stem_skills "STEM Skills"

label variable less_highschool "No Degree"
label variable highschool "High School Degree"
label variable somecollege "College Attendance"
label variable college "College Degree"
label variable masters "Master's Degree"
label variable doctorate "PhD Degree"

label variable schooling "Years of Education"
label variable potential_exp "Experience"
label variable female "Female"
 
save dta_files/onet_acs_data, replace

*END
log close

