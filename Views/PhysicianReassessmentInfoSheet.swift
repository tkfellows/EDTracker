//
//  PhysicianReassessmentInfoSheet.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-14.
//

import SwiftUI

struct PhysicianReassessmentInfoSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("reassessmentPhysicianLogo")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .bottomLeading)
                            .padding(.leading,-10)
                        Text("Physician Reassessment").padding()
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .offset(x:-10,y:10)
                            .frame(width:210)
//                        Spacer()
                    }.padding().padding(.top,20)
                    Text("The physician reassessment involves reviewing your entire clinical encounter since presentation. This includes reviewing their initial assessment, the results from their ordered investigations, and/or your response to ongoing therapy while in our ED.\n\nPlease note that depending on the nature of your visit, type of investigation(s), and the result(s), the time required for a thorough reassessment can vary greatly.\n\nWe greatly appreciate your patience and understanding!").padding(.leading).padding(.top,40)
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

struct PhysicianReassessmentInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        PhysicianReassessmentInfoSheet()
    }
}
