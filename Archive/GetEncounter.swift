////
////  GetEncounterData.swift
////  ED-Tracker
////
////  Created by Tyee Fellows on 2021-07-03.
////
//
//import Foundation
//import SwiftUI
//
//struct EncounterStruct: Decodable {
//    var results: [EncounterStructure]
//}
//
//struct EncounterStructure: Decodable {
//    let mrn: String
//    let encounter: String
//    let firstName: String
//    let lastName: String
//    let gender: String
//    let age: String
//    let chiefComplaint: String
//    let description: String
//    let descriptionOfInjury: String
//    let lengthOfStay: String
//}
//
//public class GetEncounter {
//
//    @State private var results = [EncounterStructure]()
//
//    init(mrn: String, encounter: String) {
//        getJson(mrn: mrn, encounter: encounter)
////        sortJson()
//    }
//
//    func getJson(mrn: String, encounter: String) {
//
//        guard let url = URL(string: "https://edtracker.ca/edTracker_index.php?mrn=\(mrn)&encounter=\(encounter)") else {
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            if error != nil {
//                print("error = \(String(describing: error))")
//                return
//            }
//
//            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("responseString = \(String(describing: responseString))")
//
//            if let data = data {
//                if let dataFromJson = try? JSONDecoder().decode(EncounterStruct.self, from: data) {
////                print("\(String(describing: responseString))")
////                print(self.encounterData[0].age!)
////                self.encounterData = dataFromJson
//                DispatchQueue.main.async {
//                    self.results = dataFromJson.results
//                }
//            }
//        }
//    }.resume()
//
////    func sortJson() {
////        self.encounterData = self.encounterData.sorted(by: {$0.encounter < $1.encounter})
////    }
//    }
//}
//
//
