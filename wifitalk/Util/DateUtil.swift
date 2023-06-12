//
//  DateUtil.swift
//  wifitalk
//
//  Created by escher on 2023/06/12.
//

import Foundation

extension Date {
    func format(_ formatString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formatString
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: self)
    }
}
