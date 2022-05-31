//
//  ContentView.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-01.
//

import SwiftUI

struct ContentView: View {
    
    // Database files
    var encounterServer = "https://edtracker.ca/edTracker_index.php"
    
    @StateObject var patient = EscapeEncounterViewModel()

    // State variables for GUI
    @State var localEncounterId = "1"
    @State var enteredMRN: String = ""
    @State var authorizedMRN = false
//    @State var isStageUpdated: Bool = false
    
    // State variables for sub-views
    @State var triageViewToggle: Bool = false

    var width: CGFloat = UIScreen.main.bounds.width - CGFloat(20)
        
    var body: some View {
        HStack {
            VStack {
                Spacer(minLength: 30)
                if authorizedMRN {
                    // Section 1
                    TrackerViewHeader(localEncounterId: $localEncounterId, enteredMRN: $enteredMRN, authorizedMRN: $authorizedMRN).foregroundColor(.black)
                    TrackerViewBar().foregroundColor(.black)
                    // Section 2
                    TriageView().foregroundColor(.black)
                    // Section 3
                    TimelineView().foregroundColor(.black)
                    Spacer()
                } else {
                    TitleView(localEncounterId: $localEncounterId, enteredMRN: $enteredMRN, authorizedMRN: $authorizedMRN)
                }
                Spacer(minLength: 10)
            }.environmentObject(patient)
        }.background(Color.lightBlue).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func encryptText(string: String) throws -> String {
    let encryptedText = string.data(using:.utf8)!
    return encryptedText.base64EncodedString()
}


extension String: Identifiable {
    public var id: String { self }
}
