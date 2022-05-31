//
//  TriageInfoView.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-14.
//

import SwiftUI

struct TriageInfoSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("triageLogo2")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .bottomLeading)
                        Text("Triage").padding()
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .offset(y:24)
                        Spacer()
                    }.padding().padding(.top,20)
                    Text("Triage is utilized in the healthcare community to categorize patients based on the severity of their injuries and, by extension, the order in which multiple patients require medical care and monitoring\n\nThis process involves collecting your unique healthcare information, vital signs, and if necessary, early investigations to facilitate your healthcare").padding().padding(.top,40)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
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

struct TriageInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        TriageInfoSheet()
    }
}
