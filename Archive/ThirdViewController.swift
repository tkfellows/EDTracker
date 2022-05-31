//
//  ThirdViewController.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-07.
//

import UIKit

class ThirdViewController: UIViewController, GlobalUpdating {
    @Global var userSettings: UserSettings
    @Global var appSettings: AppSettings
    
    @IBOutlet var authenticationStatus: UILabel!
    @IBOutlet var language: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForUpdates()
    }
    
    func update() {
        print("Updating third view")
        self.authenticationStatus.text = userSettings.authenticationString
        self.language.text = appSettings.language
        title = "Summary"
    }
}
