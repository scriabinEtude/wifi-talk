//
//  WifiHistoryController.swift
//  wifitalk
//
//  Created by escher on 2023/06/13.
//

import Foundation
import CoreData

class WifiHistoryController: DataController {
    typealias Model = WifiHistory
    
    var context: NSManagedObjectContext
    var wifiHistories = [Model]()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetch() -> [Model] {
        if wifiHistories.isEmpty {
            self.wifiHistories = self.fetchAll()
        }
        return self.wifiHistories
    }
    
    func update(_ wifi: Wifi) -> [Model] {
        var wifiHistory = self.fetch().first(where: {
            $0.ssid == wifi.ssid || $0.bssid == wifi.bssid
        })
        
        if wifiHistory == nil {
            wifiHistory = self.save(wifi)
        } else {
            wifiHistory!.updatedAt = Date()
            self.saveContext(context)
        }
        
        return self.fetch()
    }
    
    private func save(_ wifi: Wifi) -> Model {
        let wifiHistory = WifiHistory(context: context)
        wifiHistory.ssid = wifi.ssid
        wifiHistory.bssid = wifi.bssid
        wifiHistory.updatedAt = Date()
        self.saveContext(context)
        return wifiHistory
    }
    
    
}
