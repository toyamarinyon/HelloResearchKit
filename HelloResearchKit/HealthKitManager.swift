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
    
    static var timer : Timer?
    
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
    
    static func saveMockHeartData() {
        
        let heartRateType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        let heartRateQuantity = HKQuantity(unit: HKUnit(from: "count/min"), doubleValue: Double(arc4random_uniform(80) + 100))
        let heartSample = HKQuantitySample(type: heartRateType, quantity: heartRateQuantity, start: Date(), end: Date())
        healthKitStore.save(heartSample) { (success, error) -> Void in
            if let error = error  {
                print("Error saving heart sample: \(error.localizedDescription)")
            }
        }
    }
    
    static func startMockHeartData() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: "saveMockHeartData", userInfo: nil, repeats: true)
    }
    
    static func stopMockHeartData() {
        self.timer?.invalidate()
    }
}
