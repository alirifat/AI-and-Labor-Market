*This do file provides how many times and when each onet occupational title data updated
*Only covers dabase until 23.0

log using "/Users/alirkaya/Desktop/Project/STATA/log_files/onet_update.log"
cd "/Users/alirkaya/Desktop/Project/STATA"
tempfile update_2000 update_2006 update_2009 update_2010

* TAXONOMY 2000 UPDATES
mkdir "/Users/alirkaya/Desktop/Project/STATA/onet_update"

capture program drop _update
capture program _update
     import delimited "/Users/alirkaya/Desktop/Project/STATA/csv_files/ONET_databases/UPDATES/ONET_`1'_Updates.csv", varnames(1) clear
     rename (onetsoc`2'code onetsoc`2'title) (onetsoccode update_`1')
	 save onet_update/update_`1'
end

*taxonomy 2000 updates
_update 50 2000
_update 60 2000
_update 70 2000
_update 80 2000
_update 90 2000
*taxonomy 2006 updates
_update 100 2006
_update 110 2006
_update 120 2006
_update 130 2006
*taxonomy 2009 updates
_update 140 2009
_update 150 2009
*taxonomy 2010 updates
_update 160 2010
_update 170 2010
_update 180 2010
_update 190 2010
_update 200 2010
_update 210 2010
_update 220 2010
_update 230 2010

use onet_update/update_50, clear
merge 1:1 onetsoccode using onet_update/update_60, nogenerate
merge 1:1 onetsoccode using onet_update/update_70, nogenerate
merge 1:1 onetsoccode using onet_update/update_80, nogenerate
merge 1:1 onetsoccode using onet_update/update_90, nogenerate

egen onet_title = concat(update_*)
for var update_* \ numlist "5(1)9" : generate _X = "Y" + ".0" if X != ""
egen update2000 = concat(_update_*)
drop update_* _update_* onetsoc2000description
save "`update_2000'"

********************************************************************************
use onet_update/update_100, clear
merge 1:1 onetsoccode using onet_update/update_110, nogenerate
merge 1:1 onetsoccode using onet_update/update_120, nogenerate
merge 1:1 onetsoccode using onet_update/update_130

egen onet_title = concat(update_*) if _merge != 3
for var update_* \ numlist "10(1)13" : generate _X = "Y" + ".0" if X != "" & _merge != 3
egen update2006_1 = concat(_update_*)
replace onet_title = onet_title + update_130 if onet_title == ""
replace update2006_1 = "10.0" if _merge == 3 
generate update2006_2 = "13.0" if _merge == 3
drop update_* _update_* _merge onetsoc2006description
save "`update_2006'"

********************************************************************************
use onet_update/update_140, clear
merge 1:1 onetsoccode using onet_update/update_150, nogenerate

egen onet_title = concat(update_*)
for var update_* \ numlist "14/15" : generate _X = "Y" + ".0" if X != ""
egen update2009 = concat(_update_*)
drop update_* _update_* onetsoc2009description
save "`update_2009'"

********************************************************************************
use onet_update/update_160, clear
merge 1:1 onetsoccode using onet_update/update_170, nogenerate
merge 1:1 onetsoccode using onet_update/update_180, nogenerate
merge 1:1 onetsoccode using onet_update/update_190, generate(merge_19)
merge 1:1 onetsoccode using onet_update/update_200, generate(merge_20)
merge 1:1 onetsoccode using onet_update/update_210, generate(merge_21)
merge 1:1 onetsoccode using onet_update/update_220, generate(merge_22)
merge 1:1 onetsoccode using onet_update/update_230, generate(merge_23)

generate onet_title = update_160
generate update2010_1 = "16.0" if onet_title != ""
foreach i of numlist 17/23 {
	replace onet_title = update_`i'0 if onet_title == ""
	replace update2010_1 = "`i'" + ".0" if onet_title != "" & update2010_1 == ""
}
generate update2010_2 = "19.0" if merge_19 == 3
foreach i of numlist 20/23 {
	replace update2010_2 = "`i'" + ".0" if merge_`i' == 3
}
drop update_* merge_* onetsoc2010description
save "`update_2010'"

********************************************************************************
shell rm -r "/Users/alirkaya/Desktop/Project/STATA/onet_update"
********************************************************************************
use "`update_2000'", clear
merge 1:1 onetsoccode using "`update_2006'", nogenerate
merge 1:1 onetsoccode using "`update_2009'", nogenerate
merge 1:1 onetsoccode using "`update_2010'", nogenerate
format update2000 update2006_* update2009 update2010_* %9s

label variable onetsoccode "O*NET-SOC 2010 Occupational Title Code"
label variable onet_title "O*NET-SOC 2010 Occupational Title"
label var update2000 "O*NET Version of Updated Occ. Titles During 2000-2005"
label var update2006_1 "O*NET Version of Updated Occ. Titles During 2006-2009"
label var update2006_2 "O*NET Version of Updated (Second) Occ. Titles During 2006-2009"
label var update2009 "O*NET Version of Updated Occ. Titles During 2009-2010"
label var update2010_1 "O*NET Version of Updated Occ. Titles After 2010"
label var update2010_2 "O*NET Version of Updated (Second) Occ. Titles After 2010"
save dta_files/onet_update

*END
log close



