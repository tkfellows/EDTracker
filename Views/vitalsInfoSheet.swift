//
//  vitalsInfoSheet.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-16.
//

import SwiftUI

struct vitalsInfoSheet: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("ecgLogo")
                            .resizable()
                            .frame(width: 100, height: 80, alignment: .topLeading)
                            .padding()
                        Text("Vital signs")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .offset(y:27)
                        Spacer()
                    }.padding().padding(.top,30)
                    Image("vitalsImage2")
                        .resizable()
                        .frame(width: 275, height: 170, alignment: .topLeading)
                        .padding()
                        .padding(.top,0)
                    Text("Vital signs are measurements of the body’s most basic functions and are useful in detecting or monitoring medical problems\n\nFive vital signs are measured for all patients visiting the ED:").padding().padding(.leading).padding(.top,-10)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    Text("1. Blood Pressure (BP)\n2. Heart rate (HR)\n3. Respiration rate (RR)\n4. Body temperature (°)\n5. Oxygen Saturation (SpO2)").lineSpacing(6).padding(.top,-10)
                    Spacer()
                }
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

struct vitalsInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        vitalsInfoSheet()
    }
}


