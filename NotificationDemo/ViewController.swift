//
//  ViewController.swift
//  NotificationDemo
//
//  Created by Richard EV Simpson on 09/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {

    @IBOutlet var textLabel1: UILabel!
    @IBOutlet var textLabel2: UILabel!
    @IBOutlet var screenModeLabel: UILabel!
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.didReceiveSomeData, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.didReceiveSomeOtherData, object: demoClass.shared)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(UIDevice.orientationDidChangeNotification)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addNotifications()
        
    }

    func addNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(printSomeData(_:)), name: Notification.Name.didReceiveSomeData, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(printSomeOtherData(_:)), name: Notification.Name.didReceiveSomeOtherData, object: demoClass.shared)
        
        // This Notification does not has a post (like the others in ViewController 2) because it uses a build in functionality.
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(rotationDidChange), name:  UIDevice.orientationDidChangeNotification, object: nil)
    }

    @objc func printSomeData(_ notification: Notification) {
        
        // This will be excuted immidiatly in ViewController 1
        textLabel1.text = "Notification 1 is called!!"
        if let data = notification.userInfo as? [String: Int] {
            print("SomeOtherData is called with some passed values")
            data.forEach { (sleutel, waarde) in
                print("De key = \(sleutel) en de value = \(waarde)")
            }
        }
    }
    
    @objc func printSomeOtherData(_ notification:Notification){
        textLabel2.text = "Notification 2 is called!!"
        print("SomeOtherData is called without passed values")
    }
    
    @objc func rotationDidChange() {
        UIDevice.current.orientation.isPortrait ? (screenModeLabel.text = "Device is Portrait") : (screenModeLabel.text = "Device is Landscape")
    }
}

