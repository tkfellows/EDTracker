//
//  TriageSymbolSheet.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-16.
//

import SwiftUI

struct TriageSymbolSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
        
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("medicineSignLogo")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .bottomLeading)
                            .padding()
                        Text("Triage Symbols").padding()
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .offset(y:10)
                        Spacer()
                    }.padding().padding(.top,20)
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("ID\nCC\nCTAS")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .lineSpacing(30)
                                    .padding(.leading,-30)
                                    .multilineTextAlignment(.trailing)
                                Text("Identification\nCheif Complaint\nCanadian Triage & Acuity Scale")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .lineSpacing(35)
                                    .padding(.leading,10)
                                    .multilineTextAlignment(.leading)
                            }.padding(.top,30)
                            HStack{
                                VStack(alignment:.center){
                                    Image("bodyTemperature")
                                        .resizable()
                                        .frame(width: 10.0, height: 22.0)
                                        .padding(.bottom,10)
                                    Image("bloodPressure")
                                        .resizable()
                                        .frame(width: 20.0, height: 24.0)
                                        .padding(.bottom,10)
                                    Image("heartRate")
                                        .resizable()
                                        .frame(width: 22.0, height: 22.0)
                                        .padding(.bottom,10)
                                    Image("respiratoryRate")
                                        .resizable()
                                        .frame(width: 22.0, height: 22.0)
                                        .padding(.bottom,10)
                                    Image("oxygenSaturation")
                                        .resizable()
                                        .frame(width: 8.0, height: 22.0)
                                        .padding(.bottom,10)
                                }.scaleEffect(1.4).padding(.leading,-10).padding(.top,-40)
                                VStack {
                                    Text("Body Temperature (°)\nBlood Pressure (mmHg)\nHeart Rate (beats/min)\nRespiratory Rate (breaths/min)\nBlood Oxygen Saturation (%)")
                                    Spacer()
                                }.font(.system(size: 14, weight: .bold, design: .rounded))
                                .lineSpacing(42)
                                .padding(.leading,20)
                                .frame(width: 300, height: 300, alignment: .leading)
                                Spacer()
                            }.padding(.top,30)
                        }
                    }.padding(.leading,70)
                    Spacer()
                }.padding()
                Spacer()
            }.background(Color.lightBlue).edgesIgnoringSafeArea(.all)
            .navigationBarItems(
                trailing:
                    Button(
                        action: { presentationMode.wrappedValue.dismiss() },
                        label: { Image(systemName: "xmark.circle").resizable().scaleEffect(2,anchor: .center).padding(.top,20).padding(.trailing,10) }
                    )
            )
        }
    }
}

struct TriageSymbolSheet_Previews: PreviewProvider {
    static var previews: some View {
        TriageSymbolSheet()
    }
}
