//
//  demoClass.swift
//  NotificationDemo
//
//  Created by Richard EV Simpson on 09/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation

class demoClass {
    static let shared = demoClass()
    
    func getData() {
        // Door self mee te geven kan bij de addObserver worden geluisterd naar alleen dit object elk andere post met .didReceiveSomeOtherData wordt dan geblokkeerd omdat deze niet van deze class komt.
        NotificationCenter.default.post(name: .didReceiveSomeOtherData, object: self)
    }
}
