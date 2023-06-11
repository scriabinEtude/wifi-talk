//
//  LogUtil.swift
//  wifitalk
//
//  Created by escher on 2023/06/10.
//

import Foundation

struct LogUtil {
    static func error(_ message: String, error: some Error) {
        print("ERROR: \(message)\n\(error.localizedDescription)")
    }
}
