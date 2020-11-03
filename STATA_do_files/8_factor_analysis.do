*Kaiser Normalization is ON
*Do pre-factor analysis tests: KMO, Bartlett's and Parallel Analysis
*Installed packages: "FACTORTEST" and "PARAN"

log using "/Users/alirkaya/Desktop/Project/STATA/log_files/onet_factor_analysis_kaiser.log", replace
cd "/Users/alirkaya/Desktop/Project/STATA"
set more off

********************************************************************************
*ONET data KMO and Bartlett's test
use dta_files/onet, clear
factortest ability_1-ability_52
*KMO value is 0.966
*Bartlett's test is significant
factortest activity_1-activity_41
*KMO value is 0.942
*Bartlett's test is significant
factortest knowledge_1-knowledge_33
*KMO value is 0.840
*Bartlett's test is significant
factortest skill_1-skill_35
*KMO value is 0.950
*Bartlett's test is significant

********************************************************************************
*The PA conducted according to factor method pricipal axis factoring (ipf in STATA)
*All factors retained if adjusted eigenvalues > 1

/*ONET data Parallel Analysis
paran ability_1-ability_52, all factor(ipf) centile(95) quietly
*4 factors need to be retained.
paran activity_1-activity_41, all factor(ipf) centile(95) quietly
*4 factors need to be retained
paran knowledge_1-knowledge_33, all factor(ipf) centile(95) quietly
*6 factors need to be retained
paran skill_1-skill_35, all factor(ipf) centile(95) quietly
*4 factors need to be retained*/

********************************************************************************
do do_files/rename_onet_data.do
********************************************************************************
*ONET factor analysis
*Abilities
local abilities ArmHandSteadiness AuditoryAttention CategoryFlexibility ControlPrecision DeductiveReasoning DepthPerception DynamicFlexibility DynamicStrength ExplosiveStrength ExtentFlexibility FarVision FingerDexterity FlexibilityOfClosure FluencyOfIdeas GlareSensitivity GrossBodyCoordination GrossBodyEquilibrium HearingSensitivity InductiveReasoning InformationOrdering ManualDexterity MathematicalReasoning Memorization MultilimbCoordination NearVision NightVision NumberFacility OralComprehension OralExpression Originality PerceptualSpeed PeripheralVision ProblemSensitivity RateControl ReactionTime ResponseOrientation SelectiveAttention SoundLocalization SpatialOrientation SpeechClarity SpeechRecognition SpeedOfClosure SpeedOfLimbMovement Stamina StaticStrength TimeSharing TrunkStrength VisualColorDiscrimination Visualization WristFingerSpeed WrittenComprehension WrittenExpression

factor `abilities', factors(4) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

*the following abilities are dropped due to crossloadings               item no.
* Depth Perception                                                         6
* Far Vision                                                              11
* Hearing Sensitivity                                                     18
* Mathematical Reasoning                                                  22
* Multilimb Coordination											      24
* Near Vision                                                             25
* Number Facility                                                         27
* Oral Comprehension													  28
* Oral Expression                                                         29
* Rate Control                                                            34
* Reaction Time                                                           35
* Speech Clarity                                                          40
* Speech Recognition													  41
* Speed of Limb Movement                                                  43

local abilities ArmHandSteadiness AuditoryAttention CategoryFlexibility ControlPrecision DeductiveReasoning DynamicFlexibility DynamicStrength ExplosiveStrength ExtentFlexibility FingerDexterity FlexibilityOfClosure FluencyOfIdeas GlareSensitivity GrossBodyCoordination GrossBodyEquilibrium InductiveReasoning InformationOrdering ManualDexterity Memorization NightVision Originality PerceptualSpeed PeripheralVision ProblemSensitivity ResponseOrientation SelectiveAttention SoundLocalization SpatialOrientation SpeedOfClosure Stamina StaticStrength TimeSharing TrunkStrength VisualColorDiscrimination Visualization WristFingerSpeed WrittenComprehension WrittenExpression

factor `abilities', factors(4) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

*the following abilities are dropped due to crossloadings               item no.
* Auditory Attention                                                       2
* Response Orientation                                                    36
* Selective Attention													  37

local abilities ArmHandSteadiness CategoryFlexibility ControlPrecision DeductiveReasoning DynamicFlexibility DynamicStrength ExplosiveStrength ExtentFlexibility FingerDexterity FlexibilityOfClosure FluencyOfIdeas GlareSensitivity GrossBodyCoordination GrossBodyEquilibrium InductiveReasoning InformationOrdering ManualDexterity Memorization NightVision Originality PerceptualSpeed PeripheralVision ProblemSensitivity SoundLocalization SpatialOrientation SpeedOfClosure Stamina StaticStrength TimeSharing TrunkStrength VisualColorDiscrimination Visualization WristFingerSpeed WrittenComprehension WrittenExpression

factor `abilities', factors(4) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

*the following abilities are dropped due to crossloadings               item no.
* Perceptual Speed                                                        31
* Visual Color Discrimination                                             48
* Visualization															  49
* Written Expression													  52

local abilities ArmHandSteadiness CategoryFlexibility ControlPrecision DeductiveReasoning DynamicFlexibility DynamicStrength ExplosiveStrength ExtentFlexibility FingerDexterity FlexibilityOfClosure FluencyOfIdeas GlareSensitivity GrossBodyCoordination GrossBodyEquilibrium InductiveReasoning InformationOrdering ManualDexterity Memorization NightVision Originality PeripheralVision ProblemSensitivity SoundLocalization SpatialOrientation SpeedOfClosure Stamina StaticStrength TimeSharing TrunkStrength WristFingerSpeed WrittenComprehension

factor `abilities', factors(4) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

alpha Stamina GrossBodyCoordination GrossBodyEquilibrium DynamicStrength TrunkStrength ExtentFlexibility DynamicFlexibility StaticStrength ExplosiveStrength
* Cronbach's alpha value is 0.9655
alpha FingerDexterity ArmHandSteadiness ManualDexterity ControlPrecision WristFingerSpeed
* Cronbach's alpha value is 0.9505
alpha NightVision PeripheralVision SpatialOrientation GlareSensitivity SoundLocalization
* Cronbach's alpha value is 0.9782
alpha ProblemSensitivity SpeedOfClosure FlexibilityOfClosure DeductiveReasoning InformationOrdering InformationOrdering CategoryFlexibility FluencyOfIdeas Memorization Originality WrittenComprehension TimeSharing
* Cronbach's alpha value is 0.9312

*generating abilities factors using addition method
gen physical_abilities = Stamina + GrossBodyCoordination + GrossBodyEquilibrium + DynamicStrength + TrunkStrength + ExtentFlexibility + DynamicFlexibility + StaticStrength + ExplosiveStrength
gen psychomotor_abilities = FingerDexterity + ArmHandSteadiness + ManualDexterity + ControlPrecision + WristFingerSpeed
gen sensory_abilities = NightVision + PeripheralVision + SpatialOrientation + GlareSensitivity + SoundLocalization
gen cognitive_abilities = ProblemSensitivity + SpeedOfClosure + FlexibilityOfClosure + DeductiveReasoning + InformationOrdering + InformationOrdering + CategoryFlexibility + FluencyOfIdeas + Memorization + Originality + WrittenComprehension + TimeSharing

*generating abilities factors using 'predict' command
predict physical_abilities_pr psychomotor_abilities_pr sensory_abilities_pr cognitive_abilities_pr

local abilities ArmHandSteadiness AuditoryAttention CategoryFlexibility ControlPrecision DeductiveReasoning DepthPerception DynamicFlexibility DynamicStrength ExplosiveStrength ExtentFlexibility FarVision FingerDexterity FlexibilityOfClosure FluencyOfIdeas GlareSensitivity GrossBodyCoordination GrossBodyEquilibrium HearingSensitivity InductiveReasoning InformationOrdering ManualDexterity MathematicalReasoning Memorization MultilimbCoordination NearVision NightVision NumberFacility OralComprehension OralExpression Originality PerceptualSpeed PeripheralVision ProblemSensitivity RateControl ReactionTime ResponseOrientation SelectiveAttention SoundLocalization SpatialOrientation SpeechClarity SpeechRecognition SpeedOfClosure SpeedOfLimbMovement Stamina StaticStrength TimeSharing TrunkStrength VisualColorDiscrimination Visualization WristFingerSpeed WrittenComprehension WrittenExpression
drop `abilities'

********************************************************************************
*Activities
local activities AnalyzingDataInformation AssistingCareOthers CoachingDevelopingOthers CommunicatingPersonOutside CommunicatingSupervisors ControllingMachincesProcesses CoordinatingWorkActivities DevelopingObjectivesStrategies DevelopingBuildingTeams DocumentingInformation DraftTechnicalDevices EstablishingInterpersonal EstimatingCharacteristicsProd EvaluatingInformationStandards GettingInformation GuidingSubordinates HandlingObjects IdentifyingObjects InspectingEquipment InteractingComputers InterpretingInformation JudgingThingsServices MakingDecisionsSolving MonitorProcesses MonitoringControllingResources OperatingVehicles OrganizingPlanningWork PerformingAdministrativeAct PerformingPhysicalAct PerformingDirectlyPublic ProcessingInformation ProvideConsultation RepairingElectronicEquipment RepairingMechanicalEquipment ResolvingNegotiating SchedulingWorkActivities SellingInfluencingOthers StaffingOrganicationalUnits ThinkingCreatively TrainingTeachingOthers UpdatingUsingKnowledge

factor `activities', factors(4) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

*the following activities are dropped due to crossloadings
* Communicating with Persons Outside Organization
* Drafting, Laying Out, and Specifying Technical Devices, Parts, and Equipment
* Establishing and Maintaining Interpersonal Relationships
* Estimating the Quantifiable Characteristics of Products, Events, or Information
* Making Decisions and Solving Problems
* Monitor Processes, Materials, or Surroundings
* Organizing, Planning, and Prioritizing Work
* Performing Administrative Activities
* Resolving Conflicts and Negotiating with Others

local activities AnalyzingDataInformation AssistingCareOthers CoachingDevelopingOthers CommunicatingSupervisors ControllingMachincesProcesses CoordinatingWorkActivities DevelopingObjectivesStrategies DevelopingBuildingTeams DocumentingInformation EvaluatingInformationStandards GettingInformation GuidingSubordinates HandlingObjects IdentifyingObjects InspectingEquipment InteractingComputers InterpretingInformation JudgingThingsServices MonitoringControllingResources OperatingVehicles PerformingPhysicalAct PerformingDirectlyPublic ProcessingInformation ProvideConsultation RepairingElectronicEquipment RepairingMechanicalEquipment SchedulingWorkActivities SellingInfluencingOthers StaffingOrganicationalUnits ThinkingCreatively TrainingTeachingOthers UpdatingUsingKnowledge

factor `activities', factors(3) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

*the following activities are dropped due to crossloadings
* Communicating with Supervisors, Peers, or Subordinates
* Provide Consultation and Advice to Others

local activities AnalyzingDataInformation AssistingCareOthers CoachingDevelopingOthers ControllingMachincesProcesses CoordinatingWorkActivities DevelopingObjectivesStrategies DevelopingBuildingTeams DocumentingInformation EvaluatingInformationStandards GettingInformation GuidingSubordinates HandlingObjects IdentifyingObjects InspectingEquipment InteractingComputers InterpretingInformation JudgingThingsServices MonitoringControllingResources OperatingVehicles PerformingPhysicalAct PerformingDirectlyPublic ProcessingInformation RepairingElectronicEquipment RepairingMechanicalEquipment SchedulingWorkActivities SellingInfluencingOthers StaffingOrganicationalUnits ThinkingCreatively TrainingTeachingOthers UpdatingUsingKnowledge

factor `activities', factors(3) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

alpha ProcessingInformation AnalyzingDataInformation GettingInformation DocumentingInformation UpdatingUsingKnowledge InteractingComputers IdentifyingObjects InterpretingInformation EvaluatingInformationStandards
* Cronbach's alpha value is 0.9238
alpha GuidingSubordinates CoordinatingWorkActivities CoachingDevelopingOthers DevelopingBuildingTeams StaffingOrganicationalUnits SchedulingWorkActivities MonitoringControllingResources TrainingTeachingOthers DevelopingObjectivesStrategies JudgingThingsServices SellingInfluencingOthers AssistingCareOthers PerformingDirectlyPublic ThinkingCreatively
* Cronbach's alpha value is 0.9090
alpha InspectingEquipment ControllingMachincesProcesses RepairingMechanicalEquipment HandlingObjects OperatingVehicles RepairingElectronicEquipment PerformingPhysicalAct
* Cronbach's alpha value is 0.9389

*generating activities factors using addition method
gen mental_activities = ProcessingInformation + AnalyzingDataInformation + GettingInformation + DocumentingInformation + UpdatingUsingKnowledge + InteractingComputers + IdentifyingObjects + InterpretingInformation + EvaluatingInformationStandards
gen interacting_activities = GuidingSubordinates + CoordinatingWorkActivities + CoachingDevelopingOthers + DevelopingBuildingTeams + StaffingOrganicationalUnits + SchedulingWorkActivities + MonitoringControllingResources + TrainingTeachingOthers + DevelopingObjectivesStrategies + JudgingThingsServices + SellingInfluencingOthers + AssistingCareOthers + PerformingDirectlyPublic + ThinkingCreatively
gen work_activities = InspectingEquipment + ControllingMachincesProcesses + RepairingMechanicalEquipment + HandlingObjects + OperatingVehicles + RepairingElectronicEquipment + PerformingPhysicalAct

*generating activities factors using 'predict' command
predict mental_activities_pr interacting_activities_pr work_activities_pr

local activities AnalyzingDataInformation AssistingCareOthers CoachingDevelopingOthers CommunicatingPersonOutside CommunicatingSupervisors ControllingMachincesProcesses CoordinatingWorkActivities DevelopingObjectivesStrategies DevelopingBuildingTeams DocumentingInformation DraftTechnicalDevices EstablishingInterpersonal EstimatingCharacteristicsProd EvaluatingInformationStandards GettingInformation GuidingSubordinates HandlingObjects IdentifyingObjects InspectingEquipment InteractingComputers InterpretingInformation JudgingThingsServices MakingDecisionsSolving MonitorProcesses MonitoringControllingResources OperatingVehicles OrganizingPlanningWork PerformingAdministrativeAct PerformingPhysicalAct PerformingDirectlyPublic ProcessingInformation ProvideConsultation RepairingElectronicEquipment RepairingMechanicalEquipment ResolvingNegotiating SchedulingWorkActivities SellingInfluencingOthers StaffingOrganicationalUnits ThinkingCreatively TrainingTeachingOthers UpdatingUsingKnowledge
drop `activities'

********************************************************************************
*Knowledge
local knowledge AdministrationManagement Biology BuildingConstruction Chemistry Clerical CommunicationsMedia ComputersElectronics CustomerPersonalService Design EconomicsAccounting EducationTraining EngineeringTechnology EnglishLanguage FineArts FoodProduction ForeignLanguage Geography HistoryArcheology LawGovernment Mathematics_knowledge Mechanical MedicineDentistry PersonnelHumanResources PhilosophyTheology Physics ProductionProcessing Psychology PublicSafetySecurity SalesMarketing SociologyAnthropology Telecommunications TherapyCounseling Transportation

factor `knowledge', factors(6) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

*the following knowledge are dropped due to crossloadings
* Chemistry
* Clerical
* Communications and Media
* Education and Training
* Food Production
* Geography
* Law and Government
* Sociology and Anthropology

local knowledge AdministrationManagement Biology BuildingConstruction ComputersElectronics CustomerPersonalService Design EconomicsAccounting EngineeringTechnology EnglishLanguage FineArts ForeignLanguage HistoryArcheology Mathematics_knowledge Mechanical MedicineDentistry PersonnelHumanResources PhilosophyTheology Physics ProductionProcessing Psychology PublicSafetySecurity SalesMarketing Telecommunications TherapyCounseling Transportation

factor `knowledge', factors(5) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

*the following knowledge are dropped due to crossloadings
* Building and Construction
* Computers and Electronics
* English Language
* Mechanical

local knowledge AdministrationManagement Biology CustomerPersonalService Design EconomicsAccounting EngineeringTechnology FineArts ForeignLanguage HistoryArcheology Mathematics_knowledge MedicineDentistry PersonnelHumanResources PhilosophyTheology Physics ProductionProcessing Psychology PublicSafetySecurity SalesMarketing Telecommunications TherapyCounseling Transportation

factor `knowledge', factors(5) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

alpha MedicineDentistry Biology TherapyCounseling Psychology
* Cronbach's alpha value is 0.8635
alpha EngineeringTechnology Physics Design Mathematics_knowledge ProductionProcessing
* Cronbach's alpha value is 0.8557
alpha EconomicsAccounting AdministrationManagement SalesMarketing PersonnelHumanResources CustomerPersonalService
* Cronbach's alpha value is 0.8182
alpha HistoryArcheology FineArts PhilosophyTheology ForeignLanguage
* Cronbach's alpha value is 0.7799
alpha PublicSafetySecurity Transportation Telecommunications
* Cronbach's alpha value is 0.6535

*generating knowledge factors using addition method
gen healt_sci_knowledge = MedicineDentistry + Biology + TherapyCounseling + Psychology
gen engin_prod_knowledge = EngineeringTechnology + Physics + Design + Mathematics_knowledge + ProductionProcessing
gen business_knowledge = EconomicsAccounting + AdministrationManagement + SalesMarketing + PersonnelHumanResources + CustomerPersonalService
gen art_human_knowledge = HistoryArcheology + FineArts + PhilosophyTheology + ForeignLanguage
gen public_knowledge = PublicSafetySecurity + Transportation + Telecommunications

*generating knowledge factors using 'predict' command
predict healt_sci_knowledge_pr engin_prod_knowledge_pr business_knowledge_pr art_human_knowledge_pr public_knowledge_pr

local knowledge AdministrationManagement Biology BuildingConstruction Chemistry Clerical CommunicationsMedia ComputersElectronics CustomerPersonalService Design EconomicsAccounting EducationTraining EngineeringTechnology EnglishLanguage FineArts FoodProduction ForeignLanguage Geography HistoryArcheology LawGovernment Mathematics_knowledge Mechanical MedicineDentistry PersonnelHumanResources PhilosophyTheology Physics ProductionProcessing Psychology PublicSafetySecurity SalesMarketing SociologyAnthropology Telecommunications TherapyCounseling Transportation
drop `knowledge'

********************************************************************************
*Skills
local skills ActiveLearning ActiveListening ComplexProblemSolving Coordination CriticalThinking EquipmentMaintenance EquipmentSelection Installation Instructing JudgementAndDecisonMaking LearningStrategies ManagementOfFinancialResources ManagementOfMaterialResources ManagementOfPersonnelResources Mathematics Monitoring Negotiation OperationMonitoring OperationAndControl OperationsAnalysis Persuasion Programming QualityControlAnalysis ReadingComprehension Repairing Science ServiceOrientation SocialPerceptiveness Speaking SystemsAnalysis SystemsEvaluation TechnologyDesign TimeManagement Troubleshooting Writing

factor `skills', factors(4) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

*the following skills are dropped due to crossloadings
* Active Learning
* Complex Problem Solving
* Critical Thinking
* Judgment and Decision Making
* Writing

local skills ActiveListening Coordination EquipmentMaintenance EquipmentSelection Installation Instructing LearningStrategies ManagementOfFinancialResources ManagementOfMaterialResources ManagementOfPersonnelResources Mathematics Monitoring Negotiation OperationMonitoring OperationAndControl OperationsAnalysis Persuasion Programming QualityControlAnalysis ReadingComprehension Repairing Science ServiceOrientation SocialPerceptiveness Speaking SystemsAnalysis SystemsEvaluation TechnologyDesign TimeManagement Troubleshooting

factor `skills', factors(3) ipf
*screeplot, yline(1)
estat structure
rotate, promax blanks(.3)
sortl
estat common
estat summarize
rotate, clear

*the following skills are dropped due to crossloadings
* Management of Financial Resources
* Management of Material Resources
* Reading Comprehension

local skills ActiveListening Coordination EquipmentMaintenance EquipmentSelection Installation Instructing LearningStrategies ManagementOfPersonnelResources Mathematics Monitoring Negotiation OperationMonitoring OperationAndControl OperationsAnalysis Persuasion Programming QualityControlAnalysis Repairing Science ServiceOrientation SocialPerceptiveness Speaking SystemsAnalysis SystemsEvaluation TechnologyDesign TimeManagement Troubleshooting

factor `skills', factors(3) ipf
*screeplot, yline(1)
estat structure
rotate, promax kaiser
sortl
estat common
estat summarize
rotate, clear

alpha Coordination SocialPerceptiveness ManagementOfPersonnelResources Monitoring Negotiation TimeManagement Persuasion Instructing ServiceOrientation LearningStrategies Speaking ActiveListening
* Cronbach's alpha value is 0.9542
alpha Troubleshooting EquipmentMaintenance OperationMonitoring Repairing EquipmentSelection OperationAndControl QualityControlAnalysis Installation
* Cronbach's alpha value is 0.9600
alpha Programming Mathematics TechnologyDesign SystemsAnalysis OperationsAnalysis SystemsEvaluation Science
* Cronbach's alpha value is 0.8851

*generating skills factors using addition method
gen social_skills = Coordination + SocialPerceptiveness + ManagementOfPersonnelResources + Monitoring + Negotiation + TimeManagement + Persuasion + Instructing + ServiceOrientation + LearningStrategies + Speaking + ActiveListening
gen technical_skills = Troubleshooting + EquipmentMaintenance + OperationMonitoring + Repairing + EquipmentSelection + OperationAndControl + QualityControlAnalysis + Installation
gen stem_skills = Programming + Mathematics + TechnologyDesign + SystemsAnalysis + OperationsAnalysis + SystemsEvaluation + Science

*generating skills factors using 'predict' command
predict social_skills_pr technical_skills_pr stem_skills_pr

local skills ActiveLearning ActiveListening ComplexProblemSolving Coordination CriticalThinking EquipmentMaintenance EquipmentSelection Installation Instructing JudgementAndDecisonMaking LearningStrategies ManagementOfFinancialResources ManagementOfMaterialResources ManagementOfPersonnelResources Mathematics Monitoring Negotiation OperationMonitoring OperationAndControl OperationsAnalysis Persuasion Programming QualityControlAnalysis ReadingComprehension Repairing Science ServiceOrientation SocialPerceptiveness Speaking SystemsAnalysis SystemsEvaluation TechnologyDesign TimeManagement Troubleshooting Writing
drop `skills'

save dta_files/onet_factor_results

*END
log close


