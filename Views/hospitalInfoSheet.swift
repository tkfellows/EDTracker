//
//  cgmhInfoSheet.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-20.
//

import SwiftUI

struct hospitalInfoSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var patient: EscapeEncounterViewModel
    
    var body: some View {
        NavigationView {
//            ScrollView(.vertical) {
                HStack {
                    VStack {
                        HStack {
                            Image("hospitalLogo")
                                .resizable()
                                .frame(width: 100, height: 50, alignment: .bottomLeading)
                            Text("Our hospital").padding()
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                
                            Spacer()
                        }.padding().padding(.top,40)
//                        Text("The \(Text("Collingwood General and Marine Hospital").font(.system(size: 16)).bold().italic()) is a 74-bed facility serving more than 60,000 permanent residents and 3.5 Million annual visitors to the communities of Wasaga Beach, Collingwood, Clearview and the Blue Mountains. CGMH is an acute care hospital providing emergency care, diagnostic services including lab, imaging and cardio respiratory therapy, as well as two inpatient units (medicine and surgery).\n\nIn addition, CGMH also provides care in speciality areas including obstetrics, orthopaedics, intensive care and surgery. The Hospital also provides outpatient care including dialysis and a wide range of clinics including mental health and rehabilitation services. CGMH continues to provide care close to home for our community and plays a key role as an integrated orthopaedic centre for our region.\n\nThe hospital is also an integral part of the North Simcoe Muskoka Local Health Integration Network. By working co-operatively with other hospitals, CGMH can maximize its efficiencies, reduce costs and ensure that the people of the area are educated about their own health and always have access, within the region, to the health services they require."
//                        ).font(.system(size: 14, weight: .regular, design: .rounded)).padding()
                        
                        Text("Welcome to \(Text("Grey Bruce Health Services").font(.system(size: 16)).bold().italic()) We operate six hospitals that are located in the Grey Bruce region. Our mission is to offer Quality Health Care, Right Here. We have 1,600 dedicated and compassionate staff and over 150 physicians who work together delivering excellent patient care to residents and visitors across Grey Bruce.\n\nOur Regional Hospital in Owen Sound is the largest of our sites, and offers a full range of specialty services, including complex surgeries, total joint replacements, cancer surgeries, MRI and CT diagnostic services. Across the six hospitals, we have more than 100,000 patient visits per year.\n\nOur rural hospitals in Lion’s Head, Markdale, Meaford, Southampton and Wiarton offer a wide range of primary and ambulatory care services and all have 24/7 Emergency departments.").font(.system(size: 14, weight: .regular, design: .rounded)).padding()
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
//        }
    }
}

    

    struct PhysicianAssessmentInfoSheet_Previews: PreviewProvider {
        static var previews: some View {
            PhysicianAssessmentInfoSheet()
        }
    }

}

struct hospitalInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        hospitalInfoSheet()
    }
}
