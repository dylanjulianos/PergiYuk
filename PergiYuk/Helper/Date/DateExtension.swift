//
//  DateExtension.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 17/11/22.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
