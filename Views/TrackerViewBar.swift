//
//  TrackerViewBar.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-01.
//

import SwiftUI

struct TrackerViewBar: View {
    
    // Importing patient environmental object and setting Boolean for Tracker subviews
    @EnvironmentObject var patient: EscapeEncounterViewModel
    @State var showTriageInfoSheet: Bool = false
    @State var showMdAssessmentInfoSheet: Bool = false
    @State var showInvestigationInfoSheet: Bool = false
    @State var showMdReassessmentInfoSheet: Bool = false
    @State var showDischargeInfoSheet: Bool = false
    @State var showTrackerBarInfoSheet: Bool = false
    
    // Tracker Bar Style specifications
    @State var width: CGFloat = UIScreen.main.bounds.width - CGFloat(20)
    @State var height: CGFloat = 40
    var color1 = Color(#colorLiteral(red: 0.5810810328, green: 0.8624158502, blue: 0.8796806931, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.9906339049, green: 0.472792685, blue: 0.6540002227, alpha: 1))
    var trackerProgress: Array =  [0, 10, 25, 47, 70, 90, 100]

    init() {
    }
    
    var body: some View {
        
        let multipler = width / 100
        
        VStack {
            HStack(alignment: .top) {
                Button(
                    action: { showTriageInfoSheet.toggle() },
                    label: { Text("Triage") }
                ).fullScreenCover(isPresented: $showTriageInfoSheet) { TriageInfoSheet() }
                Spacer()
                Button(
                    action: { showMdAssessmentInfoSheet.toggle() },
                    label: { Text("Primary Assessment").lineLimit(2).multilineTextAlignment(.center) }
                ).fullScreenCover(isPresented: $showMdAssessmentInfoSheet) { PhysicianAssessmentInfoSheet() }
                Spacer()
                Button(
                    action: { showInvestigationInfoSheet.toggle() },
                    label: { Text("Investigations") }
                ).fullScreenCover(isPresented: $showInvestigationInfoSheet) { InvestigationsInfoSheet() }
                Spacer()
                Button(
                    action: { showMdReassessmentInfoSheet.toggle() },
                    label: { Text("Physician Reassessment(s)").lineLimit(2).multilineTextAlignment(.center) }
                ).fullScreenCover(isPresented: $showMdReassessmentInfoSheet) { PhysicianReassessmentInfoSheet() }
                Spacer()
                Button(
                    action: { showDischargeInfoSheet.toggle() },
                    label: { Text("Disposition")}
                ).fullScreenCover(isPresented: $showDischargeInfoSheet) { DispositionInfoSheet() }
            }.padding().frame(width: width, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).font(.system(size: 9, weight: .bold, design: .rounded))
            
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: height, style: .continuous)
                    .frame(width: width, height: height)
                    .foregroundColor(Color.black.opacity(0.1))
                RoundedRectangle(cornerRadius: height,style: .continuous) //
                    .frame(width: CGFloat(trackerProgress[Int(patient.stage)]) * multipler, height: height,alignment: .leading)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                    )
                    .foregroundColor(.clear)
                    .animation(.easeIn)
                Button(
                    action: { showTrackerBarInfoSheet.toggle() },
                    label: { ZStack { Image(systemName: "list.bullet").foregroundColor(.black).scaleEffect(1.2).padding(.leading,15) } }
                ).fullScreenCover(isPresented: $showTrackerBarInfoSheet) { TrackerBarInfoSheet() }
                Spacer()
            }.offset(y:-10)
        }.background(Color.lightBlue).edgesIgnoringSafeArea(.all)
    }
}

struct TrackerViewBar_Previews: PreviewProvider {
    static var previews: some View {
        TrackerViewBar()
    }
}
