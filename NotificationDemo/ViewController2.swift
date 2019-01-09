//
//  ViewController2.swift
//  NotificationDemo
//
//  Created by Richard EV Simpson on 09/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     }
    
    @IBAction func activateFirstNotificationTapped(_ sender: Any) {
        let someDemoDate = ["key1":1, "key2":2,"key3":3]
        NotificationCenter.default.post(name: .didReceiveSomeData, object: nil, userInfo: someDemoDate)
    }
    
    @IBAction func activateSecondNotificationTapped(_ sender: Any) {
            demoClass.shared.getData()
    }
    
    
    @IBAction func activateSecondNotficationTheWrongWayTapped(_ sender: Any) {
        // This will not work because the obeserver listens to democlass and now we are only ViewController2 so it will not work
        NotificationCenter.default.post(name: .didReceiveSomeOtherData, object: self, userInfo: nil)
    }
}
