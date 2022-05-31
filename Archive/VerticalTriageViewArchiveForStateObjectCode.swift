//
//  TriageView2.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-03.
//

import SwiftUI

struct VerticalTriageViewArchiveForStateObjectCode: View {
    
    @Binding var triageViewToggle: Bool
    @StateObject var patient = EscapeEncounterViewModel()
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    triageViewToggle.toggle()
                }, label: {
                    Text("   Triage")
                        .foregroundColor(.darkGray)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                })
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .frame(height: 5)
                    .foregroundColor(Color.black.opacity(0.5))
                    .padding(10)
            }
            HStack(spacing:0) {
                Spacer(minLength: 30)
                VStack(alignment:.trailing) {
                    Spacer()
                    Text("ID: ")
                    Spacer()
                    Text("CC: ")
                    Spacer()
                    Text("CTAS: ")
                    Spacer()
                }.font(.system(size: 16, weight: .bold, design: .rounded))
//                .frame(width: 75)
                VStack(alignment:.leading) {
                    Spacer()
                    Text("\(patient.patientAge) year-old \(patient.patientGender)")
                    Spacer()
                    Text("\(patient.patientDescription)")
                    Spacer()
                    Text("\(patient.patientCTAS)")
                    Spacer()
                }.font(.system(size: 16, weight: .regular, design: .rounded))
                Spacer(minLength: 50)
                VStack(alignment: .leading) {
                    Text("Vitals")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundColor(.darkGray)
                    HStack{
                        VStack(alignment:.center){
                            Image("bodyTemperature")
                                .resizable()
                                .frame(width: 14.0, height: 26.0)
                            Spacer()
                            Image("bloodPressure")
                                .resizable()
                                .frame(width: 24.0, height: 28.0)
                            Spacer()
                            Image("heartRate")
                                .resizable()
                                .frame(width: 26.0, height: 26.0)
                            Spacer()
                            Image("respiratoryRate")
                                .resizable()
                                .frame(width: 26.0, height: 26.0)
                            Spacer()
                            Image("oxygenSaturation")
                                .resizable()
                                .frame(width: 14.0, height: 26.0)
                        }.frame(width:30)
                        VStack(alignment:.leading) {
                            Text("\(patient.patientTemp)")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .offset(x:5)
                            Spacer()
                            Text("\(patient.patientSBP)/\(patient.patientDBP)")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .offset(x:5)
                            Spacer()
                            Text("\(patient.patientHR)")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .offset(x:5)
                            Spacer()
                            Text("\(patient.patientRR)")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .offset(x:5)
                            Spacer()
                            Text("\(patient.patientOxygen)")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .offset(x:5)
                        }
                        Spacer()
                    }
                }
                
            }
        }
    }
}

struct VerticalTriageViewArchiveForStateObjectCode_Previews: PreviewProvider {
    static var previews: some View {
        VerticalTriageViewArchiveForStateObjectCode(
            triageViewToggle: .constant(false))
    }
}
