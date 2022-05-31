//
//  InvestigationsInfoSheet.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-14.
//

import SwiftUI

struct InvestigationsInfoSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("testTubeLogo")
                            .resizable()
                            .frame(width: 30, height: 75, alignment: .bottomLeading)
                        Image("xrayLogo")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .bottomLeading)
                        Text("Investigations").padding()
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .offset(x:-10,y:25)
                            .frame(width:210)
//                        Spacer()
                    }.padding().padding(.top,20)
                    Text("ED physicians provide care of illnesses or injuries requiring \(Text("immediate medical attention").bold()) for unscheduled and undifferentiated patients of all ages. As first-line providers, their primary responsibility is to initiate resuscitation and stabilization, and to start investigations and interventions to diagnose and treat illnesses in the acute phase\n\nIf indicated, investigations ordered by your ED physician may include blood work, imaging studies, and/or consultation from a specialist\n\nDepending on the number and type of investigations ordered, your length of stay may vary from other patients\n\nWe greatly appreciate your patience, cooperation, and understanding during this period!").padding(.leading).padding(.bottom,10).padding(.top,40)
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

struct InvestigationsInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        InvestigationsInfoSheet()
    }
}
