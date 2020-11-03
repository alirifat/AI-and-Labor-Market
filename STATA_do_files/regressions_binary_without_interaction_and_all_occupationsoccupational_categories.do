*cd "C:\Users\Ali R Kaya\Desktop\STATA"
set more off
use dta_files/onet_acs_data_occ_categories_kaiser, clear

*SKILL Interactive Terms
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if bright == 1, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if green == 1, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if new_emerging == 1, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if stem == 1, robust

esttab using skills_interactive_kaiser_predict_75.csv, se ar2 title(Skills)
eststo clear

*ABILITY INTERACTIVE TERMS
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if bright == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if green == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if new_emerging == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if stem == 1, robust

esttab using abilities_interactive_kaiser_predict_75.csv, se ar2 title(Abilities)
eststo clear

*ACTIVITY INTERACTIVE TERMS
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if bright == 1, robust
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if green == 1, robust
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if new_emerging == 1, robust
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if stem == 1, robust

esttab using activities_interactive_kaiser_predict_75.csv, se ar2 title(Activities)
eststo clear

*KNOWLEDGE INTERACTIVE TERMS
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if bright == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if green == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if new_emerging == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp if stem == 1, robust

esttab using knowledge_interactive_kaiser_predict_75.csv, se ar2 title(Knowledge)
eststo clear


***STATE FIXED EFFECTS
*cd "C:\Users\Ali R Kaya\Desktop\STATA"
set more off
use dta_files/onet_acs_data_occ_categories_kaiser, clear

*SKILL Interactive Terms
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if bright == 1, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if green == 1, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if new_emerging == 1, robust
eststo: quietly regress lnwage social_skills_pr_75 stem_skills_pr_75 technical_skills_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if stem == 1, robust

esttab using skills_interactive_state_kaiser_predict_75.csv, se ar2 title(Skills)
eststo clear

*ABILITY INTERACTIVE TERMS
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state, robust
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if bright == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if green == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if new_emerging == 1, robust
eststo: quietly regress lnwage physical_abilities_pr_75 cognitive_abilities_pr_75 sensory_abilities_pr_75 psychomotor_abilities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if stem == 1, robust

esttab using abilities_interactive_state_kaiser_predict_75.csv, se ar2 title(Abilities)
eststo clear

*ACTIVITY INTERACTIVE TERMS
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state, robust
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if bright == 1, robust
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if green == 1, robust
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if new_emerging == 1, robust
eststo: quietly regress lnwage interacting_activities_pr_75 mental_activities_pr_75 work_activities_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if stem == 1, robust

esttab using activities_interactive_state_kaiser_predict_75.csv, se ar2 title(Activities)
eststo clear

*KNOWLEDGE INTERACTIVE TERMS
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if bright == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if green == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if new_emerging == 1, robust
eststo: quietly regress lnwage art_humanities_knowledge_pr_75 engineering_prod_knowledge_pr_75 healt_sci_knowledge_pr_75 business_knowledge_pr_75 public_knowledge_pr_75 highschool somecollege college masters doctorate female c.potential_exp##c.potential_exp i.state if stem == 1, robust

esttab using knowledge_interactive_state_kaiser_predict_75.csv, se ar2 title(Knowledge)
eststo clear
