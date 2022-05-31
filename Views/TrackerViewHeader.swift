//
//  TrackerViewHeader.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-01.
//

import SwiftUI

struct TrackerViewHeader: View {
    
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    @Binding var localEncounterId: String
    @Binding var enteredMRN: String
    @Binding var authorizedMRN: Bool
    
    var body: some View {
        HStack{
            Button(
                action: {
                    // Returns back to title screen and wipes login information
                    self.localEncounterId = "1"
                    self.enteredMRN = ""
                    self.authorizedMRN = false
                    
                    // Wipes patient class information
                    patient.patientFirstName = ""
                    patient.patientLastName = ""
                    patient.patientDOB = ""
                    patient.patientMrn = ""
                    patient.patientDescription = ""
                    patient.patientCTAS = ""
                    patient.patientAge = ""
                    patient.patientGender = ""
                    patient.patientDescriptionOfInjury = ""
                    patient.patientTemp = ""
                    patient.patientTempC = 00.0
                    patient.patientTempF = 00.0
                    patient.patientSBP = ""
                    patient.patientDBP = ""
                    patient.patientHR = ""
                    patient.patientRR = ""
                    patient.patientOxygen = ""
                    patient.LOS = ""
                    patient.triageDateTime = Date()
                    patient.departureDateTime = Date()
                    
                    // Wipes milestone progress
                    patient.stage = 0
                    patient.isStageUpdated = false
                    patient.triageComplete = false
                    patient.assessmentComplete = false
                    patient.investigationsComplete = false
                    patient.reassessmentComplete = false
                    patient.dischargeComplete = false
                    
                    // Wipes sub-milestone progress
                    patient.arrivalComplete = false
                    patient.registerComplete = false
                    patient.firstRnAssessmentComplete = false
                    patient.firstMdAssessmentComplete = false
                    patient.initialMedicationsOrdered = false
                    patient.initialBloodworkOrdered = false
                    patient.initialXrayOrdered = false
                    patient.initialUltrasoundOrdered = false
                    patient.initialCTOrdered = false
                    patient.initialInvestigationsOrdered = false
                    patient.initialMedicationsComplete = false
                    patient.initialBloodworkComplete = false
                    patient.initialXrayComplete = false
                    patient.initialUltrasoundComplete = false
                    patient.initialCTComplete = false
                    patient.investigationsComplete = false
                    patient.secondRnAssessmentComplete = false
                    patient.secondMdAssessmentComplete = false
                    patient.consultCalledComplete = false
                    patient.consultFinishedComplete = false
                    patient.dispositionComplete = false
                    patient.dischargeComplete = false
                },
                label: {
                    Image("mainLogo")
                        .resizable()
                        .frame(minWidth: 10, idealWidth: 10, maxWidth: 75, minHeight: 10, idealHeight: 10, maxHeight: 75, alignment: .center)
                }
            )
            VStack(alignment: .leading) {
                Text("ED Tracker")
                    .frame(width: 75, alignment: .leading)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                Text("Your visit\nin realtime!")
                    .frame(width: 60, alignment: .leading)
                    .font(.system(size: 11, weight: .light, design: .rounded))
            }.padding(5)//.padding(.top,20)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            Spacer()
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(patient.patientFirstName) \(patient.patientLastName)")
                    Text("\(patient.patientMrn)")
                    Text("\(patient.patientDOB)")
                }.font(.system(size: 14, weight: .regular, design: .rounded))
                VStack(alignment: .leading) {
                    Text(":  ID")
                    Text(":  MRN")
                    Text(":  DOB")
                }.font(.system(size: 14, weight: .bold, design: .rounded))
            }
            .navigationBarHidden(true)
        }.padding()
    }
}

struct TrackerViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        TrackerViewHeader(localEncounterId: .constant("1"), enteredMRN: .constant(""), authorizedMRN: .constant(false))
    }
}
