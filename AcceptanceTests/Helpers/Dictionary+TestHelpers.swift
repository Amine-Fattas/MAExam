//
//  Dictionary+TestHelpers.swift
//  AcceptanceTests
//
//  Created by Amine Fattas on 18/05/2022.
//

import Foundation

extension Dictionary {
    var toNSDictionary : NSDictionary {
        NSDictionary(dictionary: self, copyItems: true)
    }
}
