//
//  FirstView.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-07.
//

import SwiftUI
import UIKit

class EscapeEncounterViewController: UIViewController, GlobalUpdating {
    
    @Global var patientInfo: EscapeEncounterViewModel
    
    @IBOutlet var authenticationStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForUpdates()
    }
    
    func update() {
        print("Updating first view")
        print(patientInfo.authenticationString)
        title = patientInfo.authenticationString
    }
    
    @IBAction func authenticated(_ sender: Any) {
        patientInfo.isAuthenticated.toggle()
    }
}

struct EscapeEncounterRep: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> EscapeEncounterViewController {
        let picker = EscapeEncounterViewController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: EscapeEncounterViewController, context: Context) {
    }
}
