//
//  Counter.swift
//  JS_Proj_69
//
//  Created by Saunak on 18/02/23.
//

import Foundation

@objc(Counter)
class Counter: RCTEventEmitter {
  
  private var count = 0
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  
  override func constantsToExport () -> [AnyHashable: Any]!{
    return ["initialCount": 0]
  }
  
  @objc
  func increment(){
    count += 1
    print("count is  \(count)")
    sendEvent(withName: "onIncrement", body: ["count": count])
  }
  
  
  override func supportedEvents() -> [String]! {
    return ["onIncrement"]
  }
  
  
  // https://www.codingem.com/swift-underscore/
  // Details on how _ can be used in Swift.
  
  @objc
  func getCount(_ callback: RCTResponseSenderBlock){
    callback([count])
  }
  
  @objc
  func decrement(
    _ resolve: RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock
  ) -> Void {
    if (count == 0){
      let error = NSError(domain: " ", code: 200, userInfo: nil)
      reject("E_Count","Count cannot be negative", error)
    } else {
      count -= 1
      resolve("count was decremented : \(count)")
    }
  }
}


