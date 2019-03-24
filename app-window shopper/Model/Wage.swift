//
//  Wage.swift
//  app-window shopper
//
//  Created by Aman Meena on 24/03/19.
//  Copyright © 2019 Aman Meena. All rights reserved.
//

import Foundation

class Wage {
    
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
