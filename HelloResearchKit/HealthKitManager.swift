//
//  HealthKitManager.swift
//  HelloResearchKit
//
//  Created by tamurine on 2016/11/05.
//  Copyright © 2016年 toyama satoshi. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitManager : NSObject {
    
    static let healthKitStore = HKHealthStore()
    
    static func autholizeHealthKit() {
        
        if !HKHealthStore.isHealthDataAvailable() {
            print("Can't access HealthKit.")
        }
        
        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        ]
        
        healthKitStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
    }
}
