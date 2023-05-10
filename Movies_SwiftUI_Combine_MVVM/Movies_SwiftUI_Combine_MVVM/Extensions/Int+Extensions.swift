//
//  Int+Extensions.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import Foundation

extension Int {

    var stringValue: String {
        return String(self)
    }
    
    mutating func increment() {
       self += 1
    }
}

extension Int64 {
    var intValue: Int {
        return Int(self)
    }
}
