cd "/Users/alirkaya/Desktop/Project/STATA"
set more off

use dta_files/onet_acs_data, clear

********************************************************************************
***SKILLS
********************************************************************************

*skills regression outputs using factor-addition variables
eststo: quietly regress lnwage social_skills stem_skills technical_skills female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage social_skills stem_skills technical_skills female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage social_skills stem_skills technical_skills female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage social_skills stem_skills technical_skills female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage social_skills stem_skills technical_skills female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using skills_original.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*skills regression outputs using factor-addition rescaled variables
eststo: quietly regress lnwage social_skills_rs stem_skills_rs technical_skills_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage social_skills_rs stem_skills_rs technical_skills_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage social_skills_rs stem_skills_rs technical_skills_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage social_skills_rs stem_skills_rs technical_skills_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage social_skills_rs stem_skills_rs technical_skills_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using skills_original_rescaled.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*skills regression outputs using factor-addition 75 percentile dummy variables
eststo: quietly regress lnwage social_skills_75 stem_skills_75 technical_skills_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage social_skills_75 stem_skills_75 technical_skills_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage social_skills_75 stem_skills_75 technical_skills_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage social_skills_75 stem_skills_75 technical_skills_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage social_skills_75 stem_skills_75 technical_skills_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using skills_original_75_dummy.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*skills regression outputs using predicted variables
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using skills_predicted.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*skills regression outputs using predicted rescaled variables
eststo: quietly regress lnwage social_skills_pr_rs stem_skills_pr_rs technical_skills_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage social_skills_pr_rs stem_skills_pr_rs technical_skills_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage social_skills_pr_rs stem_skills_pr_rs technical_skills_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage social_skills_pr_rs stem_skills_pr_rs technical_skills_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage social_skills_pr_rs stem_skills_pr_rs technical_skills_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using skills_predicted_rescaled.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*skills regression outputs using predicted 75 percentile dummy variables
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using skills_predicted_75_dummy.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

********************************************************************************
***ABILITIES
********************************************************************************

*abilities regression outputs using factor-addition variables
eststo: quietly regress lnwage physical_abilities psychomotor_abilities sensory_abilities cognitive_abilities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage physical_abilities psychomotor_abilities sensory_abilities cognitive_abilities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage physical_abilities psychomotor_abilities sensory_abilities cognitive_abilities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage physical_abilities psychomotor_abilities sensory_abilities cognitive_abilities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage physical_abilities psychomotor_abilities sensory_abilities cognitive_abilities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using abilities_original.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*abilities regression outputs using factor-addition rescaled variables
eststo: quietly regress lnwage physical_abilities_rs psychomotor_abilities_rs sensory_abilities_rs cognitive_abilities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage physical_abilities_rs psychomotor_abilities_rs sensory_abilities_rs cognitive_abilities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_rs psychomotor_abilities_rs sensory_abilities_rs cognitive_abilities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_rs psychomotor_abilities_rs sensory_abilities_rs cognitive_abilities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_rs psychomotor_abilities_rs sensory_abilities_rs cognitive_abilities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using abilities_original_rescaled.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*abilities regression outputs using factor-addition 75 percentile dummy variables
eststo: quietly regress lnwage physical_abilities_75 psychomotor_abilities_75 sensory_abilities_75 cognitive_abilities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage physical_abilities_75 psychomotor_abilities_75 sensory_abilities_75 cognitive_abilities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_75 psychomotor_abilities_75 sensory_abilities_75 cognitive_abilities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_75 psychomotor_abilities_75 sensory_abilities_75 cognitive_abilities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_75 psychomotor_abilities_75 sensory_abilities_75 cognitive_abilities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using abilities_original_75_dummy.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*abilities regression outputs using predicted variables
eststo: quietly regress lnwage physical_abilities_pr psychomotor_abilities_pr sensory_abilities_pr cognitive_abilities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage physical_abilities_pr psychomotor_abilities_pr sensory_abilities_pr cognitive_abilities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_pr psychomotor_abilities_pr sensory_abilities_pr cognitive_abilities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_pr psychomotor_abilities_pr sensory_abilities_pr cognitive_abilities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_pr psychomotor_abilities_pr sensory_abilities_pr cognitive_abilities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using abilities_predicted.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*abilities regression outputs using predicted rescaled variables
eststo: quietly regress lnwage physical_abilities_pr_rs psychomotor_abilities_pr_rs sensory_abilities_pr_rs cognitive_abilities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage physical_abilities_pr_rs psychomotor_abilities_pr_rs sensory_abilities_pr_rs cognitive_abilities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_rs psychomotor_abilities_pr_rs sensory_abilities_pr_rs cognitive_abilities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_rs psychomotor_abilities_pr_rs sensory_abilities_pr_rs cognitive_abilities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_rs psychomotor_abilities_pr_rs sensory_abilities_pr_rs cognitive_abilities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using abilities_predicted_rescaled.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*abilities regression outputs using predicted 75 percentile dummy variables
eststo: quietly regress lnwage physical_abilities_pr_75 psychomotor_abilities_pr_75 sensory_abilities_pr_75 cognitive_abilities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage physical_abilities_pr_75 psychomotor_abilities_pr_75 sensory_abilities_pr_75 cognitive_abilities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_75 psychomotor_abilities_pr_75 sensory_abilities_pr_75 cognitive_abilities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_75 psychomotor_abilities_pr_75 sensory_abilities_pr_75 cognitive_abilities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_75 psychomotor_abilities_pr_75 sensory_abilities_pr_75 cognitive_abilities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using abilities_predicted_75_dummy.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

********************************************************************************
***ACTIVITIES
********************************************************************************

*activities regression outputs using factor-addition variables
eststo: quietly regress lnwage mental_activities interacting_activities work_activities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage mental_activities interacting_activities work_activities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage mental_activities interacting_activities work_activities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage mental_activities interacting_activities work_activities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage mental_activities interacting_activities work_activities female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using activities_original.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*activities regression outputs using factor-addition rescaled variables
eststo: quietly regress lnwage mental_activities_rs interacting_activities_rs work_activities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage mental_activities_rs interacting_activities_rs work_activities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage mental_activities_rs interacting_activities_rs work_activities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage mental_activities_rs interacting_activities_rs work_activities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage mental_activities_rs interacting_activities_rs work_activities_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using activities_original_rescaled.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*activities regression outputs using factor-addition 75 percentile dummy variables
eststo: quietly regress lnwage mental_activities_75 interacting_activities_75 work_activities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage mental_activities_75 interacting_activities_75 work_activities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage mental_activities_75 interacting_activities_75 work_activities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage mental_activities_75 interacting_activities_75 work_activities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage mental_activities_75 interacting_activities_75 work_activities_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using activities_original_75_dummy.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*activities regression outputs using predicted variables
eststo: quietly regress lnwage mental_activities_pr interacting_activities_pr work_activities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage mental_activities_pr interacting_activities_pr work_activities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage mental_activities_pr interacting_activities_pr work_activities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage mental_activities_pr interacting_activities_pr work_activities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage mental_activities_pr interacting_activities_pr work_activities_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using activities_predicted.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*activities regression outputs using predicted rescaled variables
eststo: quietly regress lnwage mental_activities_pr_rs interacting_activities_pr_rs work_activities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage mental_activities_pr_rs interacting_activities_pr_rs work_activities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage mental_activities_pr_rs interacting_activities_pr_rs work_activities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage mental_activities_pr_rs interacting_activities_pr_rs work_activities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage mental_activities_pr_rs interacting_activities_pr_rs work_activities_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using activities_predicted_rescaled.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*activities regression outputs using predicted 75 percentile dummy variables
eststo: quietly regress lnwage mental_activities_pr_75 interacting_activities_pr_75 work_activities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage mental_activities_pr_75 interacting_activities_pr_75 work_activities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage mental_activities_pr_75 interacting_activities_pr_75 work_activities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage mental_activities_pr_75 interacting_activities_pr_75 work_activities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage mental_activities_pr_75 interacting_activities_pr_75 work_activities_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using activities_predicted_75_dummy.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

********************************************************************************
***KNOWLEDGE
********************************************************************************

cd "/Users/alirkaya/Desktop/Project/STATA"
set more off

use dta_files/onet_acs_data, clear

*knowledge regression outputs using factor-addition variables
eststo: quietly regress lnwage healt_sci_knowledge engin_prod_knowledge business_knowledge art_human_knowledge public_knowledge female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage healt_sci_knowledge engin_prod_knowledge business_knowledge art_human_knowledge public_knowledge female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge engin_prod_knowledge business_knowledge art_human_knowledge public_knowledge female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge engin_prod_knowledge business_knowledge art_human_knowledge public_knowledge female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge engin_prod_knowledge business_knowledge art_human_knowledge public_knowledge female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using knowledge_original.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*knowledge regression outputs using factor-addition rescaled variables
eststo: quietly regress lnwage healt_sci_knowledge_rs engin_prod_knowledge_rs business_knowledge_rs art_human_knowledge_rs public_knowledge_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage healt_sci_knowledge_rs engin_prod_knowledge_rs business_knowledge_rs art_human_knowledge_rs public_knowledge_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_rs engin_prod_knowledge_rs business_knowledge_rs art_human_knowledge_rs public_knowledge_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_rs engin_prod_knowledge_rs business_knowledge_rs art_human_knowledge_rs public_knowledge_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_rs engin_prod_knowledge_rs business_knowledge_rs art_human_knowledge_rs public_knowledge_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using knowledge_original_rescaled.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*knowledge regression outputs using factor-addition 75 percentile dummy variables
eststo: quietly regress lnwage healt_sci_knowledge_75 engin_prod_knowledge_75 business_knowledge_75 art_human_knowledge_75 public_knowledge_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage healt_sci_knowledge_75 engin_prod_knowledge_75 business_knowledge_75 art_human_knowledge_75 public_knowledge_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_75 engin_prod_knowledge_75 business_knowledge_75 art_human_knowledge_75 public_knowledge_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_75 engin_prod_knowledge_75 business_knowledge_75 art_human_knowledge_75 public_knowledge_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_75 engin_prod_knowledge_75 business_knowledge_75 art_human_knowledge_75 public_knowledge_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using knowledge_original_75_dummy.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*knowledge regression outputs using predicted variables
eststo: quietly regress lnwage healt_sci_knowledge_pr engin_prod_knowledge_pr business_knowledge_pr art_human_knowledge_pr public_knowledge_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr engin_prod_knowledge_pr business_knowledge_pr art_human_knowledge_pr public_knowledge_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr engin_prod_knowledge_pr business_knowledge_pr art_human_knowledge_pr public_knowledge_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr engin_prod_knowledge_pr business_knowledge_pr art_human_knowledge_pr public_knowledge_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr engin_prod_knowledge_pr business_knowledge_pr art_human_knowledge_pr public_knowledge_pr female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using knowledge_predicted.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*knowledge regression outputs using predicted rescaled variables
eststo: quietly regress lnwage healt_sci_knowledge_pr_rs engin_prod_knowledge_pr_rs business_knowledge_pr_rs art_human_knowledge_pr_rs public_knowledge_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr_rs engin_prod_knowledge_pr_rs business_knowledge_pr_rs art_human_knowledge_pr_rs public_knowledge_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr_rs engin_prod_knowledge_pr_rs business_knowledge_pr_rs art_human_knowledge_pr_rs public_knowledge_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr_rs engin_prod_knowledge_pr_rs business_knowledge_pr_rs art_human_knowledge_pr_rs public_knowledge_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr_rs engin_prod_knowledge_pr_rs business_knowledge_pr_rs art_human_knowledge_pr_rs public_knowledge_pr_rs female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using knowledge_predicted_rescaled.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

*knowledge regression outputs using predicted 75 percentile dummy variables
eststo: quietly regress lnwage healt_sci_knowledge_pr_75 engin_prod_knowledge_pr_75 business_knowledge_pr_75 art_human_knowledge_pr_75 public_knowledge_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr_75 engin_prod_knowledge_pr_75 business_knowledge_pr_75 art_human_knowledge_pr_75 public_knowledge_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if bright_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr_75 engin_prod_knowledge_pr_75 business_knowledge_pr_75 art_human_knowledge_pr_75 public_knowledge_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if green_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr_75 engin_prod_knowledge_pr_75 business_knowledge_pr_75 art_human_knowledge_pr_75 public_knowledge_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if new_emerging_acs == 1, robust
eststo: quietly regress lnwage healt_sci_knowledge_pr_75 engin_prod_knowledge_pr_75 business_knowledge_pr_75 art_human_knowledge_pr_75 public_knowledge_pr_75 female highschool somecollege college masters doctorate c.potential_exp##c.potential_exp if stem_acs == 1, robust

esttab using knowledge_predicted_75_dummy.csv, se ar2 title(Skills) mtitle(All Bright Green New&Emerging STEM)
eststo clear

