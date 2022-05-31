//
//  EncounterView.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-03.
//

import SwiftUI

struct TimelineView: View {
    var body: some View {
        VStack {
            TimelineHeader()
            PatientTimeline()
        }
    }
}

struct TimelineHeader: View {
    @EnvironmentObject var patient: EscapeEncounterViewModel
    @State var timelineViewToggle: Bool = false

    var body: some View {
        HStack {
            Button(action: {
                self.timelineViewToggle.toggle()
            }, label: {
                Text("Timeline")
                    .foregroundColor(.darkGray)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.leading,10)
            }).fullScreenCover(isPresented: $timelineViewToggle) { TimelineInfoSheet() }
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(height: 5)
            .foregroundColor(Color.black.opacity(0.5))
            .padding(10)
        }
    }
}

struct PatientTimeline: View {
    @EnvironmentObject var patient: EscapeEncounterViewModel
    @State var predictedLOSToggle: Bool = false
    @State var hospitalLogoToggle: Bool = false
    @State var averageLOS: String = "8 hours"
//    var dateFormatter: DateFormatter {
//            let fmtr = DateFormatter()
//            fmtr.dateFormat = "yyyy-MM-dd HH:mm:ss"
//            return fmtr
//    }
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment:.trailing) {
                    Text("ED Arrival:")
                        .padding(.top,20)
                        .padding(.bottom,50)
                        .frame(height:50)
                    Text("ED LOS: \nPredicted LOS: ")
                        .lineSpacing(20)
                        .multilineTextAlignment(.trailing)
                    Button(action: { predictedLOSToggle.toggle() }, label: {
                        Text("Predicted LOS")
                            .foregroundColor(.darkGray)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding(.leading,10)
                    }).fullScreenCover(isPresented: $predictedLOSToggle) { TimelineInfoSheet() }
                    Spacer()
                }
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .padding(.leading,40)
                
                VStack(alignment:.leading) {
                    Text("\(patient.triageDateTime.description(with: Locale.current))")
                        .lineLimit(3)
                        .frame(width: 150, height: 50,alignment: .leading)
                    Text("\(patient.LOS)\n\(averageLOS)")
                        .padding(.top,3)
                        .lineSpacing(23)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .font(.system(size: 13, weight: .regular, design: .rounded))
                .padding(.leading,10)
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Button(
                        action: { hospitalLogoToggle.toggle() },
                        label: {
                    Image("hospitalLogo")
                        .resizable()
                        .frame(width: 125, height: 65, alignment: .center)
                        .padding().padding(.trailing,20)
                    }).fullScreenCover(isPresented: $hospitalLogoToggle) { hospitalInfoSheet() }
                }
            }
        }
    }
}

//struct TimelineView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimelineView()
//    }
//}
