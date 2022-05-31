//
//  DemographicsTitleView.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-03.
//

import SwiftUI

struct TriageView: View {
    var body: some View {
        VStack {
            TriageHeader()
            VitalsInfo()
            PatientInfo()
        }
    }
}

struct TriageHeader: View {
    @EnvironmentObject var patient: EscapeEncounterViewModel
    @State var triageViewToggle: Bool = false
    
    var body: some View {
        HStack {
            Button(
                action: { triageViewToggle.toggle() },
                label: { Text("Triage").foregroundColor(.darkGray).font(.system(size: 20, weight: .bold, design: .rounded)).padding(.leading,10) }
            ).fullScreenCover(isPresented: $triageViewToggle) { TriageSymbolSheet() }
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(height: 5)
                .foregroundColor(Color.black.opacity(0.5))
                .padding(10)
        }
    }
}

struct VitalsInfo: View {
    @EnvironmentObject var patient: EscapeEncounterViewModel
    @State var vitalsButton: Bool = false
    @State var tempUnit: Bool = false
    
    var body: some View {
        // Vitals Title
        Button (
            action: { vitalsButton.toggle() },
            label: { Text("Vital Signs").font(.system(size: 20, weight: .regular, design: .rounded)).foregroundColor(.darkGray).padding(.top,10) }
        ).fullScreenCover(isPresented: $vitalsButton) { vitalsInfoSheet() }

        // Vital Icons
        HStack(alignment: .center, spacing: 12, content: {
            // Temperature
            Button(
                action: { tempUnit.toggle() },
                label: { Image("bodyTemperature").resizable().frame(width: 14.0, height: 26.0) }
            )
            if tempUnit {
                Text("\(patient.patientTempF, specifier: "%.1f")°").font(.system(size: 12, weight: .regular, design: .rounded)).offset(x:-5)
            } else {
                Text("\(patient.patientTempC, specifier: "%.1f")°").font(.system(size: 12, weight: .regular, design: .rounded)).offset(x:-5)
            }
            // BP
            Image("bloodPressure").resizable().frame(width: 24.0, height: 28.0)
            Text("\(patient.patientSBP)/\(patient.patientDBP)").font(.system(size: 12, weight: .regular, design: .rounded)).offset(x:-5)
            // HR
            Image("heartRate").resizable().frame(width: 26.0, height: 26.0)
            Text("\(patient.patientHR)").font(.system(size: 12, weight: .regular, design: .rounded)).offset(x:-5)
            // RR
            Image("respiratoryRate").resizable().frame(width: 26.0, height: 26.0)
            Text("\(patient.patientRR)").font(.system(size: 12, weight: .regular, design: .rounded)).offset(x:-5)
            // O2
            Image("oxygenSaturation").resizable().frame(width: 10.0, height: 26.0)
            Text("\(patient.patientOxygen)%").font(.system(size: 12, weight: .regular, design: .rounded)).offset(x:-5)
        })
    }
}

struct PatientInfo: View {
    @EnvironmentObject var patient: EscapeEncounterViewModel
    @State var patientSexArray: Array = ["patient","male","female"]
    @State var patientResidenceArray: Array = ["Unknown","Living in a Private Dwelling", "Living in a Residential Facility", "Homeless", "Shelter", "Nursing Home/Long-term Care", "Penal Institute","Unknown","unknown","unknown"]
    @State var idButton: Bool = false
    @State var vitalsButton: Bool = false
    @State var ccButton: Bool = false
    @State var ctasButton: Bool = false
    @State var tempUnit: Bool = false
    
    var body: some View {
        HStack(spacing:0) {
            if idButton {
                HStack(spacing:0) {
                    Spacer(minLength: 50)
                    VStack {
                        VStack {
                            Button (
                                action: { self.idButton.toggle() },
                                label: { Text("Personal Information").foregroundColor(.darkGray).multilineTextAlignment(.center) }
                            )
                        }.font(.system(size: 16, weight: .bold, design: .rounded)).padding(.top,10)
                        HStack {
                        VStack {
                            Spacer()
                            Text("Full name: \n\nPostal code: \n\nResidence type: ").font(.system(size: 14, weight: .bold, design: .rounded)).multilineTextAlignment(.trailing).lineSpacing(2.5)
                            Spacer()
                        }
                        VStack(alignment:.leading) {
                            Spacer()
                            Text("\(patient.patientFirstName) \(patient.patientMiddleName) \(patient.patientLastName)")
                            Spacer()
                            Text("\(patient.patientPostalCode)")
                            Spacer()
                            Text("\(patientResidenceArray[Int(patient.patientResidenceType) ?? 0])")
                            Spacer()
                        }.font(.system(size: 14, weight: .regular, design: .rounded)).padding(.leading,5).padding(.top,5)
                        }
                    }
                    Spacer(minLength: 50)
                }
            } else if ccButton {
                HStack(spacing:0) {
                    Spacer(minLength: 50)
                    VStack {
                        VStack {
                            Button (
                                action: { ccButton.toggle() },
                                label: { Text("History of illness (HPI)").foregroundColor(.darkGray).multilineTextAlignment(.center) }
                            )
                        }.font(.system(size: 16, weight: .bold, design: .rounded)).padding().padding(.top,10)
                        VStack(alignment:.leading) {
                            Text("\(patient.patientDescriptionOfInjury)")
                        }.font(.system(size: 12, weight: .regular, design: .rounded))
                        Spacer()
                    }
                    Spacer(minLength: 50)
                }
            } else {
                Spacer(minLength: 30)
                VStack(alignment:.trailing) {
                    Spacer()
                    Button (
                        action: { idButton.toggle() },
                        label: { Text("ID: ") }
                    )
                    Spacer()
                    Button (
                        action: { ccButton.toggle() },
                        label: { Text("CC: ") }
                    )
                    Spacer()
                    Button (
                        action: { ctasButton.toggle() },
                        label: { Text("CTAS: ") }
                    ).fullScreenCover(isPresented: $ctasButton) { ctasInfoSheet() }
                    Spacer()
                }.font(.system(size: 16, weight: .bold, design: .rounded))
                    VStack(alignment:.leading) {
                        Spacer()
                        Text("\(patient.patientAge) year-old \(patientSexArray[Int(patient.patientGender) ?? 0])")
                        Spacer()
                        Text("\(patient.patientDescription)")
                        Spacer()
                        Text("\(patient.patientCTAS)")
                        Spacer()
                    }.font(.system(size: 14, weight: .regular, design: .rounded)).padding(.leading,10)
                    Spacer()
            }
        }
    }
}

//struct TriageView_Previews: PreviewProvider {
//    static var previews: some View {
//        TriageView()
//    }
//}
