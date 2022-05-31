//
//  NetworkView.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-18.
//

import SwiftUI

struct NetworkView: View {
    
    @Binding var networkURL: String

    
    var body: some View {
        HStack {
            VStack {
                Spacer()
                TextField("Server URL", text: $networkURL)
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .regular, design: .rounded))
                    .padding()
                TextField("Server IP", text: $networkURL)
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .regular, design: .rounded))
                    .padding()
                Spacer()
            }
            Spacer()
        }.background(Color.lightBlue).edgesIgnoringSafeArea(.all)
    }
}

struct NetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkView(networkURL: .constant("https://edtracker.ca/edTracker_index.php"))
    }
}
