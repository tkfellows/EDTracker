//
//  TimelineInfoSheet.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-16.
//

import SwiftUI

struct TimelineInfoSheet: View {
        
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("currentProgressLogo")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .bottomLeading)
                        Text("Timeline").padding()
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .offset(y:24)
                        Spacer()
                    }.padding().padding(.top,20)
                    Text("\(Text("LOS:").font(.system(size: 22, weight: .bold, design: .rounded))) Length of Stay\n\n\(Text("Average LOS:").font(.system(size: 22, weight: .bold, design: .rounded))) Based on patients with similar CC and CTAS score\n\n\(Text("Predicted LOS:").font(.system(size: 22, weight: .bold, design: .rounded))) Based on the number of patients in the emergency department at the time of your presentation and your CTAS score").padding().padding(.top,40)
                        .font(.system(size: 18, weight: .regular, design: .rounded))
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

struct TimelineInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        TimelineInfoSheet()
    }
}
