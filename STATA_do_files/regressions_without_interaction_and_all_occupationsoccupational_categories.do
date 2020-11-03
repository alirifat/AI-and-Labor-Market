*cd "C:\Users\Ali R Kaya\Desktop\STATA"
set more off
use dta_files/onet_acs_data_occ_categories_kaiser, clear

*SKILL Interactive Terms
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if bright == 1, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if green == 1, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if new_emerging == 1, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if stem == 1, robust

esttab using skills_interactive_kaiser_predict.csv, se ar2 title(Skills)
eststo clear

*ABILITY INTERACTIVE TERMS
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if bright == 1, robust
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if green == 1, robust
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if new_emerging == 1, robust
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if stem == 1, robust

esttab using abilities_interactive_kaiser_predict.csv, se ar2 title(Abilities)
eststo clear

*ACTIVITY INTERACTIVE TERMS
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if bright == 1, robust
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if green == 1, robust
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if new_emerging == 1, robust
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if stem == 1, robust

esttab using activities_interactive_kaiser_predict.csv, se ar2 title(Activities)
eststo clear

*KNOWLEDGE INTERACTIVE TERMS
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if bright == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if green == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if new_emerging == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if stem == 1, robust

esttab using knowledge_interactive_kaiser_predict.csv, se ar2 title(Knowledge)
eststo clear


***STATE FIXED EFFECTS
*cd "C:\Users\Ali R Kaya\Desktop\STATA"
set more off
use dta_files/onet_acs_data_occ_categories_kaiser, clear

*SKILL Interactive Terms
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if bright == 1, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if green == 1, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if new_emerging == 1, robust
eststo: quietly regress lnwage social_skills_pr stem_skills_pr technical_skills_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if stem == 1, robust

esttab using skills_interactive_state_kaiser_predict.csv, se ar2 title(Skills)
eststo clear

*ABILITY INTERACTIVE TERMS
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state, robust
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if bright == 1, robust
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if green == 1, robust
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if new_emerging == 1, robust
eststo: quietly regress lnwage physical_abilities_pr cognitive_abilities_pr sensory_abilities_pr psychomotor_abilities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if stem == 1, robust

esttab using abilities_interactive_state_kaiser_predict.csv, se ar2 title(Abilities)
eststo clear

*ACTIVITY INTERACTIVE TERMS
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state, robust
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if bright == 1, robust
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if green == 1, robust
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if new_emerging == 1, robust
eststo: quietly regress lnwage interacting_activities_pr mental_activities_pr work_activities_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if stem == 1, robust

esttab using activities_interactive_state_kaiser_predict.csv, se ar2 title(Activities)
eststo clear

*KNOWLEDGE INTERACTIVE TERMS
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if bright == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if green == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if new_emerging == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr engineering_prod_knowledge_pr healt_sci_knowledge_pr business_knowledge_pr public_knowledge_pr highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if stem == 1, robust

esttab using knowledge_interactive_state_kaiser_predict.csv, se ar2 title(Knowledge)
eststo clear
