//
//  Delay.swift
//  wifitalk
//
//  Created by escher on 2023/06/12.
//

import Foundation

struct Delay {
    
    typealias Handler = ((Date) -> Void)
    
    var workItem: DispatchWorkItem?
    let delay: Int!
    let handler: Handler?
    
    init(milliseconds delay: Int, handler: Handler?) {
        self.delay = delay
        self.handler = handler
    }
    
    func run() {}
}
