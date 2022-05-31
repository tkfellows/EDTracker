//                    if ((patient.stage == 5 || patient.stage == 7)) && (patient.medicationsOrdered || patient.bloodworkOrdered || patient.xrayOrdered) {
//                        Text("Initial order(s) status: ").font(.system(size: 20, weight: .bold, design: .rounded)).padding()
//                    }
//                    if ((patient.stage == 5 || patient.stage == 7) && patient.medicationsOrdered) {
//                        HStack {
//                            Spacer(minLength: 100)
//                            if patient.medicationsComplete {
//                                Image(systemName: "checkmark.circle")
//                            } else { Image(systemName: "circle") }
//                            Text("Medication(s)").font(.system(size: 20, weight: .bold, design: .rounded)).padding(.leading,10).frame(width:200,height: 30,alignment: .leading)
//                            Spacer()
//                        }
//                    }
//                    if ((patient.stage == 5 || patient.stage == 7) && patient.bloodworkOrdered) {
//                        HStack {
//                            Spacer(minLength: 100)
//                            if patient.bloodworkComplete {
//                                Image(systemName: "checkmark.circle")
//                            } else { Image(systemName: "circle") }
//                            Text("Blookwork").font(.system(size: 20, weight: .bold, design: .rounded)).padding(.leading,10).frame(width:200,height: 30,alignment: .leading)
//                            Spacer()
//                        }
//                    }
//                    if ((patient.stage == 5 || patient.stage == 7) && patient.xrayOrdered) {
//                        HStack {
//                            Spacer(minLength: 100)
//                            if patient.xrayComplete {
//                                Image(systemName: "checkmark.circle")
//                            } else { Image(systemName: "circle") }
//                            Text("X-ray(s)").font(.system(size: 20, weight: .bold, design: .rounded)).padding(.leading,10).frame(width:200,height: 30,alignment: .leading)
//                            Spacer()
//                        }
//                    }
//
//                    if ((patient.stage == 8)) && (patient.consultatCalled) {
//                        Text("Additional order(s) status: ").font(.system(size: 20, weight: .bold, design: .rounded)).padding()
//                    }
//                    if ((patient.stage == 8) && patient.consultatCalled) {
//                        HStack {
//                            Spacer(minLength: 75)
//                            if patient.consultComplete {
//                                Image(systemName: "checkmark.circle")
//                            } else { Image(systemName: "circle") }
//                            Text("Consultation(s)").font(.system(size: 20, weight: .bold, design: .rounded)).padding(.leading,10).frame(width:200,height: 30,alignment: .leading)
//                            Spacer()
//                        }
//                    }
//
////    // Started milestones
//////    @Published var arrival
////    @Published var patientArrived: Bool = false
////    @Published var triageStarted: Bool = false
////    @Published var firstRnAssessmentStarted: Bool = false
////    @Published var firstMdAssessmentStarted: Bool = false
////    @Published var bloodworkOrdered: Bool = false
////    @Published var xrayOrdered: Bool = false
////    @Published var medicationsOrdered: Bool = false
////    @Published var investigationsOrdered: Bool = false
////    @Published var mdReassessmentStarted: Bool = false
////    @Published var consultatCalled: Bool = false
////    @Published var dischargeStarted: Bool = false
////
////    // Finished milestones
////    @Published var triageComplete: Bool = false
////    @Published var firstRnAssessmentComplete: Bool = false
////    @Published var firstMdAssessmentComplete: Bool = false
////    @Published var physicianAssessmentComplete: Bool = false
////    @Published var bloodworkComplete: Bool = false
////    @Published var xrayComplete: Bool = false
////    @Published var medicationsComplete: Bool = false
////    @Published var investigationsComplete: Bool = false
////    @Published var mdReassessmentComplete: Bool = false
////    @Published var consultComplete: Bool = false
////    @Published var physicianReassessmentComplete: Bool = false
////    @Published var dischargeComplete: Bool = false
//
//
////
////
////                    if data.results[0].arrivalDate != "0000-00-00" {
////                        self.arrivalDate = data.results[0].arrivalDate
////                        self.arrivalTime = data.results[0].arrivalTime
////                        self.patientArrived = true
////                        print("Patient has arrived")
////                    }
////
////                    if (self.patientArrived && data.results[0].registrationDate != "0000-00-00") {
////                        self.registrationDate = data.results[0].registrationDate
////                        self.registrationTime = data.results[0].registrationTime
////                        self.triageStarted = true
////                        print("Patient has registered and awaiting triage")
////                    }
////
////                    if (self.triageStarted && data.results[0].triageDate != "0000-00-00") {
////                        self.triageDate = data.results[0].triageDate
////                        self.triageTime = data.results[0].triageTime
////                        self.triageDateTime = dateFormatter.date(from: data.results[0].triageDate + " " + data.results[0].triageTime)!
////                        self.triageComplete = true
////                        self.firstRnAssessmentStarted = true
////                        print("Patient has been triaged")
////
////                    }
////
////                    if (self.firstRnAssessmentStarted && data.results[0].dateFirstSeenByRn != "0000-00-00") {
////                        self.seenByRnDate = data.results[0].dateFirstSeenByRn
////                        self.firstRnAssessmentComplete = true
////                        self.firstMdAssessmentStarted = true
////                        print("Patient has been assessed by the nurse")
////                    }
////
////                    if (self.firstMdAssessmentStarted && data.results[0].dateFirstSeenByMd != "0000-00-00") {
////                        self.seenByMdDate = data.results[0].dateFirstSeenByMd
////                        self.firstMdAssessmentComplete = true
////                        self.physicianAssessmentComplete = true
////                        print("Patient has been assessed by the physician")
////                    }
////
////                    if data.results[0].dateLabOrdered != "0000-00-00" {
////                        self.labOrderedDate = data.results[0].dateLabOrdered
////                        self.bloodworkOrdered = true
////                        print("Bloodwork has been ordered")
////                    }
////
////                    if (self.bloodworkOrdered && data.results[0].dateLabReported != "0000-00-00") {
////                        self.labReportedDate = data.results[0].dateLabReported
////                        self.bloodworkComplete = true
////                        print("Bloodwork has been reported")
////                    }
////
////                    if data.results[0].dateXrayRequested != "0000-00-00" {
////                        self.xrayOrderedDate = data.results[0].dateXrayRequested
////                        self.xrayOrdered = true
////                        print("X-rays have been ordered")
////                    }
////
////                    if (self.xrayOrdered && data.results[0].dateXrayReported != "0000-00-00") {
////                        self.xrayReportedDate = data.results[0].dateXrayReported
////                        self.xrayComplete = true
////                        print("X-rays have been reported")
////                    }
////
////                    if data.results[0].edMedOrderedDate != "0000-00-00" {
////                        self.medOrderedDate = data.results[0].edMedOrderedDate
////                        self.medicationsOrdered = true
////                        print("Medication(s) have been ordered")
////                    }
////
////                    if (self.medicationsOrdered && data.results[0].edMedDateDelivered != "0000-00-00") {
////                        self.medDeliveredDate = data.results[0].edMedDateDelivered
////                        self.medicationsComplete = true
////                        print("Medication(s) has been delivered")
////                    }
////
////                    if (self.bloodworkOrdered || self.xrayOrdered) {
////                        self.investigationsOrdered = true
////                        print("Initial investigations have been ordered")
////                    }
////
////                    if (self.bloodworkOrdered && self.xrayOrdered && self.bloodworkComplete && self.xrayComplete) || (self.bloodworkOrdered && !self.xrayOrdered && self.bloodworkComplete && !self.xrayComplete) {
////                        self.investigationsComplete = true
////                        self.mdReassessmentStarted = true
////                        print("All initial investigations have returned")
////                    }
////
//////                    if (self.investigationsComplete && data.results[0].dateReassessedByRn != "0000-00-00") {
//////                        self.mdRessessmentDate = data.results[0].dateReassessedByMd
//////                        self.mdRessessmentTime = data.results[0].dateReassessedByMd
//////                        self.mdReassessmentStarted = true
//////                        print("Patient has been reassessed by the physician")
//////                    }
////
////                    if (self.investigationsComplete && data.results[0].dateReassessedByMd != "0000-00-00") {
////                        self.mdRessessmentDate = data.results[0].dateReassessedByMd
////                        self.mdRessessmentTime = data.results[0].dateReassessedByMd
////                        self.mdReassessmentComplete = true
////                        self.physicianReassessmentComplete = true
////                        print("Patient has been reassessed by the physician")
////                    }
////
////                    // Second MD assessment is a consultant; See if you can find another custom variable for ED physician reassessment
////                    if data.results[0].dateConsultantCalled != "0000-00-00" {
////                        self.consultantCalledDate = data.results[0].dateConsultantCalled
////                        self.mdReassessmentStarted = true
////                        self.consultatCalled = true
////                        self.physicianReassessmentComplete = false
////                        print("Consultant has been called")
////                    }
////
////                    if data.results[0].dateConsultationCompleted != "0000-00-00" {
////                        self.consultantFinishedDate = data.results[0].dateConsultationCompleted
////                        self.mdReassessmentComplete = true
////                        self.consultComplete = true
////                        self.physicianReassessmentComplete = true
////                        print("Consultantation has finished")
////                    }
////
////                    if data.results[0].dispositionDecisionDate != "0000-00-00" {
////                        self.dispositionDecisionDate = data.results[0].dispositionDecisionDate
////                        self.dischargeStarted = true
////                        print("Discharge planning has begun")
////                    }
////
////                    if data.results[0].departureDate != "0000-00-00" {
////                        self.departureDate = data.results[0].departureDate
////                        self.departureDateTime = "\(dateFormatter.date(from: data.results[0].departureDate + " " + data.results[0].departureTime)!)"
////                        self.dischargeComplete = true
////                        print("Patient has been discharged from hospital")
////                    }
////
//////                    if self.triageStarted && !self.triageComplete {
//////                        self.stage = 1
//////                        self.isStageUpdated = true
//////                    } else if self.triageComplete && !self.firstMdAssessmentStarted {
//////                        self.stage = 2
//////                        self.isStageUpdated = true
//////                    } else if self.firstMdAssessmentStarted && !self.firstMdAssessmentComplete {
//////                        self.stage = 3
//////                        self.isStageUpdated = true
//////                    } else if self.firstMdAssessmentComplete && !self.investigationsOrdered {
//////                        self.stage = 4
//////                        self.isStageUpdated = true
//////                    } else if self.investigationsOrdered && !self.investigationsComplete {
//////                        self.stage = 5
//////                        self.isStageUpdated = true
//////                    } else if self.investigationsComplete && !self.mdReassessmentStarted {
//////                        self.stage = 6
//////                        self.isStageUpdated = true
//////                    } else if self.mdReassessmentStarted && !self.mdReassessmentComplete {
//////                        self.stage = 7
//////                        self.isStageUpdated = true
//////                    } else if self.mdReassessmentComplete && !self.dischargeStarted  {
//////                        self.stage = 8
//////                        self.isStageUpdated = true
//////                    } else if self.dischargeStarted && !self.dischargeComplete {
//////                        self.stage = 9
//////                        self.isStageUpdated = true
//////                    } else if self.dischargeComplete {
//////                        self.stage = 10
//////                        self.isStageUpdated = true
//////                    } else { self.stage = 0 }
