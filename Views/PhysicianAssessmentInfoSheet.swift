//
//  PhysicianAssessmentInfoSheet.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-14.
//

import SwiftUI

struct PhysicianAssessmentInfoSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("physicianAssessmentLogo2")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .bottomLeading)
                        Text("Physician Assessment").padding()
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .offset(y:7)
                        Spacer()
                    }.padding().padding(.top,20)
                    Text("The physician assessment involves taking a thorough history and a focused physical exam based on your chief complaint.\n\nPlease note \(Text("Grey Bruce Health Services").font(.system(size: 20)).bold().italic()) is an academic teaching hospital that has learners at all stages of training. You may therefore be assessed by multiple healthcare professionals during your hospital encounter.\n\nWe greatly appreciate your patience, cooperation and understanding!").font(.system(size: 20, weight: .regular, design: .rounded)).padding().padding(.top,40)
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

struct PhysicianAssessmentInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        PhysicianAssessmentInfoSheet()
    }
}
