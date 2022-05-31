//
//  ctasSheetView.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-16.
//

import SwiftUI

struct ctasInfoSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("ambulanceLogo")
                            .resizable()
                            .frame(width: 100, height: 70, alignment: .topLeading)
                            .padding()
                        Text("Canadian Triage &\nAcuity Scale (CTAS)")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .offset(x:-5,y:7)
                        Spacer()
                    }.padding().padding(.top,40)
                    Text("During triage, patients are evaluated by a triage nurse who assigns a level based on the CTAS score. \n\nPatients are seen by a doctor in order of their priority on this scale. CTAS  has five levels and are assigned to every patient visiting an ED in Canada.").padding().padding(.leading)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    Image("ctasImage")
                        .scaleEffect(2)
                        .padding()
                        .padding(.top,20)
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

struct ctasInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        ctasInfoSheet()
    }
}
