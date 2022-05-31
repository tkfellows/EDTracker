//
//  GetEscapeEncounter.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-06.
//

import SwiftUI

class EscapeEncounterViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var encounterNumber: String = ""
    @Published var patientMrn: String = ""
    @Published var patientEncounter: String = ""
    @Published var patientFirstName: String = ""
    @Published var patientMiddleName: String = ""
    @Published var patientLastName: String = ""
    @Published var patientDOB: String = ""
    @Published var patientGender: String = ""
    @Published var patientAge: String = ""
    @Published var patientPostalCode: String = ""
    @Published var patientResidenceType: String = ""

    @Published var patientDescription: String = ""
    @Published var patientDescriptionOfInjury: String = ""
    @Published var patientCTAS: String = ""
    @Published var patientSBP: String = ""
    @Published var patientDBP: String = ""
    @Published var patientHR: String = ""
    @Published var patientRR: String = ""
    @Published var patientOxygen: String = ""
    @Published var patientTemp: String = ""
    @Published var patientTempC: Double = 00.0
    @Published var patientTempF: Double = 00.0
    
//  MARK: Boolean values for Tracker
    // Timestamp milestones variables
    @Published var scanTime: String = ""
    @Published var arrivalDate: String = ""
    @Published var arrivalTime: String = ""
    @Published var registrationDate: String = ""
    @Published var registrationTime: String = ""
    @Published var triageDate: String = ""
    @Published var triageTime: String = ""
    @Published var triageDateTime: Date = Date()
    @Published var seenByRnDate: String = ""
    @Published var seenByRnTime: String = ""
    @Published var seenByMdDate: String = ""
    @Published var seenByMdTime: String = ""
    @Published var labOrderedDate: String = ""
    @Published var labOrderedTime: String = ""
    @Published var labReportedDate: String = ""
    @Published var labReportedTime: String = ""
    @Published var xrayOrderedDate: String = ""
    @Published var xrayOrderedTime: String = ""
    @Published var xrayReportedDate: String = ""
    @Published var xrayReportedTime: String = ""
    @Published var ultrasoundOrderedDate: String = ""
    @Published var ultrasoundOrderedTime: String = ""
    @Published var ultrasoundReportedDate: String = ""
    @Published var ultrasoundReportedTime: String = ""
    @Published var ctOrderedDate: String = ""
    @Published var ctOrderedTime: String = ""
    @Published var ctReportedDate: String = ""
    @Published var ctReportedTime: String = ""
    @Published var medOrderedDate: String = ""
    @Published var medOrderedTime: String = ""
    @Published var medDeliveredDate: String = ""
    @Published var medDeliveredTime: String = ""
    @Published var consultantCalledDate: String = ""
    @Published var consultantCalledTime: String = ""
    @Published var consultantFinishedDate: String = ""
    @Published var consultantFinishedTime: String = ""
    @Published var rnRessessmentDate: String = ""
    @Published var rnRessessmentTime: String = ""
    @Published var mdRessessmentDate: String = ""
    @Published var mdRessessmentTime: String = ""
    @Published var dispositionDecisionDate: String = ""
    @Published var dispositionDecisionTime: String = ""
    @Published var departureDate: String = ""
    @Published var departureTime: String = ""
    @Published var departureDateTime: Date = Date()
    @Published var LOS: String = ""

    // Finished milestones
    @Published var isStageUpdated: Bool = false
    
    @Published var triageComplete: Bool = false
    @Published var assessmentComplete: Bool = false
    @Published var investigationsComplete: Bool = false
    @Published var reassessmentComplete: Bool = false
    @Published var dischargeComplete: Bool = false

    @Published var arrivalComplete: Bool = false
    @Published var registerComplete: Bool = false
    @Published var firstRnAssessmentComplete: Bool = false
    @Published var firstMdAssessmentComplete: Bool = false
    @Published var initialInvestigationsOrdered: Bool = false
    @Published var initialMedicationsOrdered: Bool = false
    @Published var initialBloodworkOrdered: Bool = false
    @Published var initialXrayOrdered: Bool = false
    @Published var initialUltrasoundOrdered: Bool = false
    @Published var initialCTOrdered: Bool = false
    @Published var initialMedicationsComplete: Bool = false
    @Published var initialBloodworkComplete: Bool = false
    @Published var initialXrayComplete: Bool = false
    @Published var initialUltrasoundComplete: Bool = false
    @Published var initialCTComplete: Bool = false
    @Published var secondRnAssessmentComplete: Bool = false
    @Published var secondMdAssessmentComplete: Bool = false
    @Published var consultCalledComplete: Bool = false
    @Published var consultFinishedComplete: Bool = false
    @Published var dispositionComplete: Bool = false
    
    var stage: Int = 0 {
        willSet {
            if isStageUpdated {
                objectWillChange.send()
            }
        }
    }
    
    init() {
    }
        
    var authenticationString: String {
        if isAuthenticated {
            return "Authenticated"
        } else {
            return "Anonymous"
        }
    }
    
    func getEncounter(patientId: String, encounterId: String) {
        
        self.isStageUpdated = false
        
        guard let url = URL(string: "https://edtracker.ca/edTracker_json.php?id=\(patientId)&encounter=\(encounterId)") else { return }

        downloadData(fromURL: url) { (returnedData) in
           let task = URLSession.shared.EncounterTask(with: url) { data, response, error in
             if let data = data {
                
                DispatchQueue.main.async {
                    self.scanTime = data.scanDateTime
                    self.patientMrn = data.results[0].mrn
                    self.patientEncounter = data.results[0].encounter
                    self.patientFirstName = data.results[0].firstName
                    self.patientMiddleName = data.results[0].middleName
                    self.patientLastName = data.results[0].lastName
                    self.patientDOB = data.results[0].birthdate
                    self.patientGender = data.results[0].gender
                    self.patientAge = data.results[0].age
                    self.patientPostalCode = data.results[0].postalCode
                    self.patientResidenceType = data.results[0].residenceType
                    self.patientDescription = data.results[0].cedisDescription
                    self.patientDescriptionOfInjury = data.results[0].descriptionOfInjury
                    self.patientCTAS = data.results[0].triageLevel
                    self.patientSBP = data.results[0].triageSBP
                    self.patientDBP = data.results[0].triageDBP
                    self.patientHR = data.results[0].triageHR
                    self.patientRR = data.results[0].triageRR
                    self.patientOxygen = data.results[0].triageOxygen
                    self.patientTemp = data.results[0].triageTemp
                    self.patientTempC = NumberFormatter().number(from: data.results[0].triageTemp)?.doubleValue ?? 00.0
                    self.patientTempF = ((NumberFormatter().number(from: data.results[0].triageTemp)?.doubleValue ?? 00.0) * 9 / 5) + 32
                    
                    // Setting time variables
                    // let components = Calendar.current.dateComponents([Calendar.Component.hour,Calendar.Component.minute, Calendar.Component.second], from: Date())
                    var dateFormatter: DateFormatter {
                            let fmtr = DateFormatter()
                            fmtr.dateFormat = "yyyy-MM-dd HH:mm:ss"
                            return fmtr
                    }
                    
                    
                    // MARK: - Triage Stage
                    if data.results[0].arrivalDate != "0000-00-00" {
                        self.arrivalDate = data.results[0].arrivalDate
                        self.arrivalTime = data.results[0].arrivalTime
                        self.arrivalComplete = true
                        print("Patient has arrived")
                    }
                    
                    if data.results[0].registrationDate != "0000-00-00" {
                        self.registrationDate = data.results[0].registrationDate
                        self.registrationTime = data.results[0].registrationTime
                        self.registerComplete = true
                        print("Patient has registered")
                    }
                    
                    if data.results[0].triageDate != "0000-00-00" {
                        self.triageDate = data.results[0].triageDate
                        self.triageTime = data.results[0].triageTime
                        self.triageDateTime = dateFormatter.date(from:  data.results[0].triageDate + " " + data.results[0].triageTime)!
                        self.triageComplete = true
                        print("Patient has been triaged")
                    }
                    
                    // MARK: - Assessment Stage
                    if data.results[0].dateFirstSeenByRn != "0000-00-00" {
                        self.seenByRnDate = data.results[0].dateFirstSeenByRn
                        self.seenByRnTime = data.results[0].timeFirstSeenByRn
                        self.firstRnAssessmentComplete = true
                        print("Patient has been assessed by the nurse")
                    }
                    
                    if data.results[0].dateFirstSeenByMd != "0000-00-00" {
                        self.seenByMdDate = data.results[0].dateFirstSeenByMd
                        self.seenByMdTime = data.results[0].timeFirstSeenByMd
                        self.firstMdAssessmentComplete = true
                        print("Patient has been assessed by the physician")
                    }
                    
                    if (self.firstRnAssessmentComplete && self.firstMdAssessmentComplete) {
                        self.assessmentComplete = true
                        print("Patient has been assessed")
                    }
                    
                    // MARK: - Investigation Stage
                    if data.results[0].dateLabOrdered != "0000-00-00" {
                        self.labOrderedDate = data.results[0].dateLabOrdered
                        self.labOrderedTime = data.results[0].timeLabOrdered
                        self.initialBloodworkOrdered = true
                        print("Bloodwork has been ordered")
                    }

                    if (self.initialBloodworkOrdered && data.results[0].dateLabReported != "0000-00-00") {
                        self.labReportedDate = data.results[0].dateLabReported
                        self.labReportedTime = data.results[0].timeLabReported
                        self.initialBloodworkComplete = true
                        print("Bloodwork has been reported")
                    }

                    if data.results[0].dateXrayRequested != "0000-00-00" {
                        self.xrayOrderedDate = data.results[0].dateXrayRequested
                        self.xrayOrderedTime = data.results[0].timeXrayRequested
                        self.initialXrayOrdered = true
                        print("X-ray(s) have been ordered")
                    }

                    if (self.initialXrayOrdered && data.results[0].dateXrayReported != "0000-00-00") {
                        self.xrayReportedDate = data.results[0].dateXrayReported
                        self.xrayReportedTime = data.results[0].timeXrayReported
                        self.initialXrayComplete = true
                        print("X-ray(s) have been reported")
                    }
                    
                    if data.results[0].dateUltrasoundRequested != "0000-00-00" {
                        self.ultrasoundOrderedDate = data.results[0].dateUltrasoundRequested
                        self.ultrasoundOrderedTime = data.results[0].timeUltrasoundRequested
                        self.initialUltrasoundOrdered = true
                        print("An ultrasound have been ordered")
                    }

                    if (self.initialUltrasoundOrdered && data.results[0].dateUltrasoundReported != "0000-00-00") {
                        self.ultrasoundReportedDate = data.results[0].dateUltrasoundReported
                        self.ultrasoundReportedTime = data.results[0].timeUltrasoundReported
                        self.initialUltrasoundComplete = true
                        print("The ultrasound has been reported")
                    }
                    
                    if data.results[0].dateCTRequested != "0000-00-00" {
                        self.ctOrderedDate = data.results[0].dateCTRequested
                        self.ctOrderedTime = data.results[0].timeCTRequested
                        self.initialCTOrdered = true
                        print("A CT have been ordered")
                    }

                    if (self.initialCTOrdered && data.results[0].dateCTReported != "0000-00-00") {
                        self.ctReportedDate = data.results[0].dateCTReported
                        self.ctReportedTime = data.results[0].timeCTReported
                        self.initialCTComplete = true
                        print("The ultrasound has been reported")
                    }

                    if data.results[0].edMedOrderedDate != "0000-00-00" {
                        self.medOrderedDate = data.results[0].edMedOrderedDate
                        self.medOrderedTime = data.results[0].edMedOrderedTime
                        self.initialMedicationsOrdered = true
                        print("Medication(s) have been ordered")
                    }

                    if (self.initialMedicationsOrdered && data.results[0].edMedDateDelivered != "0000-00-00") {
                        self.medDeliveredDate = data.results[0].edMedDateDelivered
                        self.medDeliveredTime = data.results[0].edMedTimeDelivered
                        self.initialMedicationsComplete = true
                        print("Medication(s) has been delivered")
                    }

                    if (self.initialBloodworkOrdered || self.initialXrayOrdered || self.initialMedicationsOrdered || self.initialUltrasoundOrdered || self.initialCTOrdered) {
                        self.initialInvestigationsOrdered = true
                        print("Initial orders have been entered")
                    }

                    if  (self.initialBloodworkOrdered && self.initialBloodworkComplete && self.initialXrayOrdered && self.initialXrayComplete && self.initialUltrasoundOrdered && self.initialUltrasoundComplete && self.initialCTOrdered && self.initialCTComplete) ||
                        (self.initialBloodworkOrdered && self.initialBloodworkComplete && self.initialXrayOrdered && self.initialXrayComplete && self.initialUltrasoundOrdered && self.initialUltrasoundComplete && !self.initialCTOrdered && !self.initialCTComplete) ||
                        (self.initialBloodworkOrdered && self.initialBloodworkComplete && self.initialXrayOrdered && self.initialXrayComplete && !self.initialUltrasoundOrdered && !self.initialUltrasoundComplete && self.initialCTOrdered && self.initialCTComplete) ||
                        (self.initialBloodworkOrdered && self.initialBloodworkComplete && !self.initialXrayOrdered && !self.initialXrayComplete && self.initialUltrasoundOrdered && self.initialUltrasoundComplete && self.initialCTOrdered && self.initialCTComplete) ||
                        (!self.initialBloodworkOrdered && !self.initialBloodworkComplete && self.initialXrayOrdered && self.initialXrayComplete && self.initialUltrasoundOrdered && self.initialUltrasoundComplete && self.initialCTOrdered && self.initialCTComplete) ||
                        (self.initialBloodworkOrdered && self.initialBloodworkComplete && !self.initialXrayOrdered && !self.initialXrayComplete && !self.initialUltrasoundOrdered && !self.initialUltrasoundComplete && !self.initialCTOrdered && !self.initialCTComplete) ||
                        (!self.initialBloodworkOrdered && !self.initialBloodworkComplete && self.initialXrayOrdered && self.initialXrayComplete && !self.initialUltrasoundOrdered && !self.initialUltrasoundComplete && !self.initialCTOrdered && !self.initialCTComplete) ||
                        (!self.initialBloodworkOrdered && !self.initialBloodworkComplete && !self.initialXrayOrdered && !self.initialXrayComplete && self.initialUltrasoundOrdered && self.initialUltrasoundComplete && !self.initialCTOrdered && !self.initialCTComplete) ||
                        (!self.initialBloodworkOrdered && !self.initialBloodworkComplete && !self.initialXrayOrdered && !self.initialXrayComplete && !self.initialUltrasoundOrdered && !self.initialUltrasoundComplete && self.initialCTOrdered && self.initialCTComplete) ||
                        (self.initialBloodworkOrdered && self.initialBloodworkComplete && self.initialXrayOrdered && self.initialXrayComplete && !self.initialUltrasoundOrdered && !self.initialUltrasoundComplete && !self.initialCTOrdered && !self.initialCTComplete) ||
                        (self.initialBloodworkOrdered && self.initialBloodworkComplete && !self.initialXrayOrdered && !self.initialXrayComplete && self.initialUltrasoundOrdered && self.initialUltrasoundComplete && !self.initialCTOrdered && !self.initialCTComplete) ||
                        (self.initialBloodworkOrdered && self.initialBloodworkComplete && !self.initialXrayOrdered && !self.initialXrayComplete && !self.initialUltrasoundOrdered && !self.initialUltrasoundComplete && self.initialCTOrdered && self.initialCTComplete) ||
                        (!self.initialBloodworkOrdered && !self.initialBloodworkComplete && self.initialXrayOrdered && self.initialXrayComplete && self.initialUltrasoundOrdered && self.initialUltrasoundComplete && !self.initialCTOrdered && !self.initialCTComplete) ||
                        (!self.initialBloodworkOrdered && !self.initialBloodworkComplete && self.initialXrayOrdered && self.initialXrayComplete && !self.initialUltrasoundOrdered && !self.initialUltrasoundComplete && self.initialCTOrdered && self.initialCTComplete) ||
                        (!self.initialBloodworkOrdered && !self.initialBloodworkComplete && !self.initialXrayOrdered && !self.initialXrayComplete && self.initialUltrasoundOrdered && self.initialUltrasoundComplete && self.initialCTOrdered && self.initialCTComplete) {
                        self.investigationsComplete = true
                        print("All initial investigations have returned")
                    }
                    
                    // MARK: - Reassessment Stage
                    if data.results[0].dateReassessedByRn != "0000-00-00" {
                        self.rnRessessmentDate = data.results[0].dateReassessedByRn
                        self.rnRessessmentTime = data.results[0].timeReassessedByRn
                        self.secondRnAssessmentComplete = true
                        print("Patient has been reassessed by the nurse")
                    }
                    
                    if data.results[0].dateReassessedByMd != "0000-00-00" {
                        self.mdRessessmentDate = data.results[0].dateReassessedByMd
                        self.mdRessessmentTime = data.results[0].timeReassessedByMd
                        self.secondMdAssessmentComplete = true
                        print("Patient has been reassessed by the physician")
                    }
                    
                    if data.results[0].dateConsultantCalled != "0000-00-00" {
                        self.consultantCalledDate = data.results[0].dateConsultantCalled
                        self.consultantCalledTime = data.results[0].timeConsultantCalled
                        self.consultCalledComplete = true
                        print("Consultant has been called")
                    }
                    
                    if data.results[0].dateConsultationCompleted != "0000-00-00" {
                        self.consultantFinishedDate = data.results[0].dateConsultationCompleted
                        self.consultantFinishedTime = data.results[0].timeConsultationCompleted
                        self.consultFinishedComplete = true
                        print("Consultant has finished their assessment")
                    }
                    
                    if (self.secondRnAssessmentComplete && self.secondMdAssessmentComplete && self.consultCalledComplete && self.consultFinishedComplete) ||
                       (self.secondRnAssessmentComplete && self.secondMdAssessmentComplete && !self.consultCalledComplete && !self.consultFinishedComplete)  {
                        self.reassessmentComplete = true
                        print("Patient has been reassessed")
                    }
                    
                    // MARK: - Discharge Stage
                    
                    if data.results[0].dispositionDecisionDate != "0000-00-00" {
                        self.dispositionDecisionDate = data.results[0].dispositionDecisionDate
                        self.dispositionDecisionTime = data.results[0].dispositionDecisionTime
                        self.dispositionComplete = true
                        print("Decision to admit or discharge has been made")
                    }
                    
                    if data.results[0].departureDate != "0000-00-00" {
                        self.departureDate = data.results[0].departureDate
                        self.departureDateTime = dateFormatter.date(from: data.results[0].departureDate + " " + data.results[0].departureTime)!
                        self.dischargeComplete = true
                        print("Patient has been discharged from the ED")
                    }
                    
                    if self.arrivalComplete && !self.triageComplete {
                        self.stage = 1
                        self.isStageUpdated = true
                    } else if self.triageComplete && !self.assessmentComplete {
                        self.stage = 2
                        self.isStageUpdated = true
                    } else if self.assessmentComplete && !self.investigationsComplete {
                        self.stage = 3
                        self.isStageUpdated = true
                    } else if self.investigationsComplete && !self.reassessmentComplete {
                        self.stage = 4
                        self.isStageUpdated = true
                    } else if self.reassessmentComplete && !self.dischargeComplete {
                        self.stage = 5
                        self.isStageUpdated = true
                    } else if self.dischargeComplete {
                        self.stage = 6
                        self.isStageUpdated = true
                    } else { self.stage = 0 }
                    
                    // Finds LOS. If departed, LOS is the departure from the arrial
                    if (data.results[0].departureDate == "0000-00-00" && data.results[0].departureTime == "00:00:00" && data.results[0].triageDate != "0000-00-00") {
                        self.LOS = getLOS(triageTime: dateFormatter.date(from: data.results[0].triageDate + " " + data.results[0].triageTime)!, departureTime: Date())
                    } else if data.results[0].triageDate != "0000-00-00" {
                        self.LOS = getLOS(triageTime: dateFormatter.date(from:  data.results[0].triageDate + " " + data.results[0].triageTime)!, departureTime: dateFormatter.date(from:  data.results[0].departureDate + " " + data.results[0].departureTime)!)
                    }
                }
             }
           }
           task.resume()
        }
    }
    
// MARK:  - Ensures URLSession is valid
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error dowloading data.")
                completionHandler(nil)
                return
            }
            completionHandler(data)
        }.resume()
    }
}


// Ionana Stochitoiu
extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
//        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    

}

func getLOS(triageTime: Date!, departureTime: Date?) -> String {
    let temp = Calendar.current.dateComponents([Calendar.Component.hour,Calendar.Component.minute, Calendar.Component.second],
                                               from: triageTime,
                                               to: departureTime ?? Date())
    return "\(temp.hour!) hour(s) and \(temp.minute!) minutes"
}
