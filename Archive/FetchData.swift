////
////  FetchData.swift
////  ED-Tracker
////
////  Created by Tyee Fellows on 2021-07-06.
////
//
//import SwiftUI
//
//enum NetworkError: Error {
//    case badURL, requestFailed, unknown
//}
//
//struct FetchData: View {
//    
//    @Binding var test: String
//    
//    func fetchData(from urlString: String, completion: @escaping (Result<String,NetworkError>) -> Void) {
//
//        guard let url = URL(string: urlString) else {
//            completion(.failure(.badURL))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            DispatchQueue.main.async {
//                if let data = data {
//                    let stringData = String(decoding: data, as: UTF8.self)
//                    self.test = stringData
//                    completion(.success(stringData))
//                } else if error != nil {
//                    completion(.failure(.requestFailed))
//                } else {
//                    completion(.failure(.unknown))
//                }
//            }
//        }.resume()
//    }
//    
//    var body: some View {
//
//        Button(action: {
//            fetchData(from: "https://edtracker.ca/edTracker_index.php?id=123123") { result in
//                switch result {
//                case .success(let str):
//                    print(str)
//                case .failure(let error):
//                    switch error {
//                    case .badURL:
//                        print("Bad URL")
//                    case .requestFailed:
//                        print("Network problems")
//                    case .unknown:
//                        print("Unknown error")
//                    }
//                }
//            }
//        }, label: {
//            Text("Pull Data")
//        })
//    }
//}
//
//struct FetchData_Previews: PreviewProvider {
//    static var previews: some View {
//        FetchData(test: .constant(""))
//    }
//}
