//
//  DischargeInfoSheet.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-14.
//

import SwiftUI

struct DispositionInfoSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    HStack {
                        Image("dischargeLogo")
                            .resizable()
                            .frame(width: 55, height: 75, alignment: .bottomLeading)
                        Text("Disposition").padding()
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .offset(y:24)
                        Spacer()
                    }.padding().padding(.top,20)
                    Text("Disposition involves making a safe plan that may include leaving the hospital with a follow-up plan with your family physician or admission to hospital.").padding().padding(.top,40)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                    HStack {
                        Image("warningLogo")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .bottomLeading)
                            .padding(.leading,25)
                            .padding(.trailing,20)
                        Text("No matter the outcome of your encounter, please know that you are \(Text("always").bold().foregroundColor(.red).font(.system(size: 15, design: .rounded))) welcome to return the hospital for emergent care at any time.").font(.system(size: 15, weight: .semibold, design: .rounded))
                    }.padding()
//
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

struct DispositionInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        DispositionInfoSheet()
    }
}
