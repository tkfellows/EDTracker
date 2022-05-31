//
//  SecondViewController.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-07.
//

import UIKit

class SecondViewController: UIViewController, GlobalUpdating {
    @Global var appSetttings: AppSettings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForUpdates()
    }
    
    func update() {
        print("Updating second view")
        title = appSetttings.language
    }
    
    @IBAction func languageChanged(_ sender:
                                    UISegmentedControl) {
        appSetttings.language =
            sender.titleForSegment(at:
                                    sender.selectedSegmentIndex) ?? "English"
    }
}
