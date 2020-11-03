***INSTALLED PACKAGE: SAVESOME

***EXPLANATIONS ON COMPRESSING DATA FROM ONET TO BLS TO ACS***
* !!! Please, see "title_acs_bls_onet.dta" to see how occupational titles from each data ///
* correspon to each other.

// BEFORE merging occupational titles with O*NET 2010 data, ///
// The number of occupational titles for each data is as follow:

// i.   ACS 2016 Occupational Titles :                  477
// ii.  BLS SOC 2010 (Detailed) Occupational Titles :   840
// iii. O*NET 2010 (Detailed) Occupational Titles :    1110

// AFTER the merging, the number of occupational titles for each data is as follow:

// i.   ACS 2016 Occupational Titles :                  464(*)
// ii.  BLS SOC 2010 (Detailed) Occupational Titles :   772(**) 
// iii. O*NET 2010 (Detailed) Occupational Titles :     966

// The reason of decrease in the number of ACS 2016 and BLS SOC 2010 occupational titles is the change in the ///
// number of O*NET occupations. There are 1.110 O*NET occupations; however, only 966 of them have O*NET data. ///
// Since 144 O*NET occupational titles do not have O*NET data then their corresponding BLS SOC 2010 occupational ///
// titles are do not have O*NET data, as well. It is best for the sake of the data to drop those from the analysis.


// (*) The list of ACS 2016 occupational titles that are dropped from the sample, ///
// becasue there are no data provided by O*NET for their corresponding O*NET occupations.
/* | ACS Code |                               Occupational Title                                    |  Count |
*  -----------------------------------------------------------------------------------------------------------
*  |  553010  | Military Enlisted Tactical Operations And Air/Weapons Specialists And Crew Members  |  2.058 | 
*  |  552010  | First-Line Enlisted Military Supervisors                                            |  1.037 |
*  |  551010  | Military Officer Special And Tactical Operations Leaders                            |    465 |
*  |  533099  | Motor Vehicle Operators, All Other                                                  |    763 |
*  |  513099  | Food Processing Workers, All Other                                                  |  1.468 |
*  |  434199  | Information and Record Clerks, All Other                                            |  1.702 |
*  |  433099  | Financial Clerks, All Other                                                         |  1.409 |
*  |  432099  | Communications Equipment Operators, All Other                                       |    121 |
*  |  419099  | Sales and Related Workers, All Other                                                |  3.300 |
*  |  399099  | Personal Care and Service Workers, All Other                                        |  1.964 |
*  |  331099  | First-Line Supervisors of Protective Service Workers, All Other                     |    922 |
*  |  272099  | Entertainers and Performers, Sports and Related Workers, All Other                  |    567 |
*  |  212099  | Religious Workers, All Other                                                        |  1.099 |
   -----------------------------------------------------------------------------------------------------------
                                                                                              total | 16.875 |
*/

// (**) There are 68 BLS SOC 2010 Detailed occupational titles that are dropped in the merging process
/* |  BLS Code  |                               Occupational Title                                              |
*  --------------------------------------------------------------------------------------------------------------
   | 11-1031.00 | Legislators                                                                                   |
   | 15-2099.00 | Mathematical Science Occupations, All Other                                                   |
   | 17-3019.00 | Drafters, All Other                                                                           |
   | 19-1099.00 | Life Scientists, All Other                                                                    |
   | 21-1019.00 | Counselors, All Other                                                                         |
   | 21-1029.00 | Social Workers, All Other                                                                     |
   | 21-1099.00 | Community And Social Service Specialists, All Other                                           |
   | 21-2099.00 | Religious Workers, All Other                                                                  |
   | 23-2099.00 | Legal Support Workers, All Other                                                              |
   | 25-1069.00 | Social Sciences Teachers, Postsecondary, All Other                                            |
   | 25-1199.00 | Postsecondary Teachers, All Other                                                             |
   | 25-2051.00 | Special Education Teachers, Preschool                                                         |
   | 25-9099.00 | Education, Training, And Library Workers, All Other                                           |
   | 27-1019.00 | Artists And Related Workers, All Other                                                        |
   | 27-1029.00 | Designers, All Other                                                                          |
   | 27-2099.00 | Entertainers And Performers, Sports And Related Workers, All Other                            |
   | 27-3099.00 | Media And Communication Workers, All Other                                                    |
   | 27-4099.00 | Media And Communication Equipment Workers, All Other                                          |
   | 29-1029.00 | Dentists, All Other Specialists                                                               |
   | 29-1129.00 | Therapists, All Other                                                                         |
   | 33-1099.00 | First-Line Supervisors Of Protective Service Workers, All Other                               |
   | 35-2019.00 | Cooks, All Other                                                                              |
   | 35-9099.00 | Food Preparation And Serving Related Workers, All Other                                       |
   | 37-2019.00 | Building Cleaning Workers, All Other                                                          |
   | 37-3019.00 | Grounds Maintenance Workers, All Other                                                        |
   | 39-3019.00 | Gaming Service Workers, All Other                                                             |
   | 39-3099.00 | Entertainment Attendants And Related Workers, All Other                                       |
   | 39-9099.00 | Personal Care And Service Workers, All Other                                                  |
   | 41-9099.00 | Sales And Related Workers, All Other                                                          |
   | 43-2099.00 | Communications Equipment Operators, All Other                                                 |
   | 43-3099.00 | Financial Clerks, All Other                                                                   |
   | 43-4199.00 | Information And Record Clerks, All Other                                                      |
   | 43-9199.00 | Office And Administrative Support Workers, All Other                                          |
   | 45-2099.00 | Agricultural Workers, All Other                                                               |
   | 45-4029.00 | Logging Workers, All Other                                                                    |
   | 47-3019.00 | Helpers, Construction Trades, All Other                                                       |
   | 47-5049.00 | Mining Machine Operators, All Other                                                           |
   | 47-5099.00 | Extraction Workers, All Other                                                                 |
   | 49-9069.00 | Precision Instrument And Equipment Repairers, All Other                                       |
   | 51-2099.00 | Assemblers And Fabricators, All Other                                                         |
   | 51-3099.00 | Food Processing Workers, All Other                                                            |
   | 51-4199.00 | Metal Workers And Plastic Workers, All Other                                                  |
   | 51-6099.00 | Textile, Apparel, And Furnishings Workers, All Other                                          |
   | 51-7099.00 | Woodworkers, All Other                                                                        |
   | 53-3099.00 | Motor Vehicle Operators, All Other                                                            |
   | 53-4099.00 | Rail Transportation Workers, All Other                                                        |
   | 53-6099.00 | Transportation Workers, All Other                                                             |
   | 53-7199.00 | Material Moving Workers, All Other                                                            |
   | 55-1011.00 | Air Crew Officers                                                                             |
   | 55-1012.00 | Aircraft Launch And Recovery Officers                                                         |
   | 55-1013.00 | Armored Assault Vehicle Officers                                                              |
   | 55-1014.00 | Artillery And Missile Officers                                                                |
   | 55-1015.00 | Command And Control Center Officers                                                           |
   | 55-1016.00 | Infantry Officers                                                                             |
   | 55-1017.00 | Special Forces Officers                                                                       |
   | 55-1019.00 | Military Officer Special And Tactical Operations Leaders, All Other                           |
   | 55-2011.00 | First-Line Supervisors Of Air Crew Members                                                    |
   | 55-2012.00 | First-Line Supervisors Of Weapons Specialists/Crew Members                                    |
   | 55-2013.00 | First-Line Supervisors Of All Other Tactical Operations Specialists                           |
   | 55-3011.00 | Air Crew Members                                                                              |
   | 55-3012.00 | Aircraft Launch And Recovery Specialists                                                      |
   | 55-3013.00 | Armored Assault Vehicle Crew Members                                                          |
   | 55-3014.00 | Artillery And Missile Crew Members                                                            |
   | 55-3015.00 | Command And Control Center Specialists                                                        |
   | 55-3016.00 | Infantry                                                                                      |
   | 55-3017.00 | Radar And Sonar Technicians                                                                   |
   | 55-3018.00 | Special Forces                                                                                |
   | 55-3019.00 | Military Enlisted Tactical Operations And Air/Weapons Specialists And Crew Members, All Other |
*  --------------------------------------------------------------------------------------------------------------
*/

log using "/Users/alirkaya/Desktop/Project/STATA/log_files/onet_factor_acs_kaiser.log", replace
cd "/Users/alirkaya/Desktop/Project/STATA"
set more off

********************************************************************************
use dta_files/onet_factor_results, clear
merge 1:1 onetsoccode using dta_files/title_acs_bls_onet, nogenerate keep(3) // we only keep the occupational titles that have O*NET data

// First, merge O*NET detailed occupational titles with BLS SOC 2010 detailed occupational titles ///
// which means compressing the number of occupational titles from 966 to 772.

// Because ACS 2016 occupational title belong/combined a unique category of BLS SOC 2010 detaild occupational titles, ///
// take mean seperately for those categories such as detailed, broad, minor, or combined, then merge them into one variable.
// This process is tedious; however, it ensures the safety of merging process.

capture foreach i of varlist physical_abilities-stem_skills_pr {
	bysort bls_title : egen `i'_d = mean(`i') if acs_detailed == 1
	bysort bls_title : egen `i'_b = mean(`i') if acs_broad == 1
	bysort bls_title : egen `i'_m = mean(`i') if acs_minor == 1
	bysort bls_title : egen `i'_c = mean(`i') if acs_combined == 1
	egen `i'_a = rowtotal(`i'_d `i'_b `i'_m `i'_c)
	}
duplicates drop bls_title, force
drop *_d *_b *_m *_c physical_abilities-stem_skills_pr
rename *_a *

/* Excel list of dropped ACS 2016 and BLS SOC 2016 Occupational Titles
preserve
tempfile dummy1 dummy2
savesome bls_title using "`dummy1'"
duplicates drop acs_title, force
savesome acs_title using "`dummy2'"

use dta_files/title_acs_bls_onet, clear
duplicates drop bls_title, force
merge 1:1 bls_title using "`dummy1'", nogenerate keep(1)
export excel using ".../bls_title_dropped.xlsx", firstrow(variables)

use dta_files/title_acs_bls_onet, clear
duplicates drop acs_title, force
merge 1:1 acs_title using "`dummy2'", nogenerate keep(1)
export excel using ".../acs_title_dropped.xlsx", firstrow(variables)
restore
*/

// Second, merge BLS SOC occupational titles with ACS 2016 occupational titles ///
// which means compressing the number of occupational titles from 772 to 464.

capture foreach i of varlist physical_abilities-stem_skills_pr {
	bysort acs_title : egen `i'_a = mean(`i')
	}

duplicates drop acs_title, force
drop physical_abilities-stem_skills_pr
rename *_a *

// Finally, rescale the data to make interpretability of the regression results easier

capture foreach i of varlist physical_abilities-stem_skills_pr {
	summarize `i', meanonly
	generate `i'_rs = ((`i' - `r(min)') / (`r(max)' - `r(min)')) * 10
	}

recast str128 acs_title
drop onetsoccode
merge 1:1 acs_title using dta_files/title_acs, nogenerate keep(3) keepusing(onetsoccode)
save dta_files/onet_factor_results_average

*END
log close
