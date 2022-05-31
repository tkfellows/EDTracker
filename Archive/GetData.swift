////
////  GetData.swift
////  ED-Tracker
////
////  Created by Tyee Fellows on 2021-07-05.
////
//
//import Foundation
//import SwiftUI
//
//struct Response: Codable {
//    var results: [Result]
//}
//
//struct Result: Codable, Identifiable {
//    let id = UUID()
//    var mrn: String?
//    var encounter: String?
//    var firstName: String?
//    var lastName: String?
//    var gender: String?
//    var age: String?
//    var chiefComplaint: String?
//    var description: String?
//    var descriptionOfInjury: String?
//    var lengthOfStay: String?
//}
//
//class Api {
//    func getPosts(completion: @escaping ([Result]) -> ()) {
//        guard let url = URL(string: "https://edtracker.ca/edTracker_index.php") else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            let posts = try JSONDecoder().decode([Result].self, from: data!)
//            DispatchQueue.main.async {
//                completion(posts)
//            }
//            
//        }
//        .resume()
//    }
//}
//
////struct GetData {
////
////    @State private var results = [Result]()
////
////    func loadData() {
////
////        guard let url = URL(string: "https://edtracker.ca/edTracker_index.php") else {
////            print("Invalid URL")
////            return
////        }
////
////        let request = URLRequest(url: url)
////
////        URLSession.shared.dataTask(with: request) { data, response, error in
////
////            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
////            print(responseString)
////
////            if let data = data {
////                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
////                    DispatchQueue.main.async {
////                        self.results = decodedResponse.results
////                    }
////                    return
////                }
////            }
////            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
////        }.resume()
////    }
////}
//
////var body: some View {
////    List(results, id: \.encounter) { item in
////        VStack(alignment: .leading) {
////            Text(item.description ?? "0")
////                .font(.headline)
////            Text(item.descriptionOfInjury ?? "0" )
////        }
////    }
////    .onAppear(perform: loadData)
////}
////                    ForEach(results, id: \.id) { item in
////                        VStack {
////                            Text(item.description!)
////                                .font(.headline)
////                        }
////                    }.onAppear(perform: loadData)
////                    Text("\(results)")
////                    List(results, id: \.encounter) { item in
////                        VStack(alignment: .leading) {
////                            Text(item.description ?? "0")
////                                .font(.headline)
////                            Text(item.descriptionOfInjury ?? "0")
////                        }
////                    }
////                    .onAppear(perform: loadData)
