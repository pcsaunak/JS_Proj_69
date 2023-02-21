//
//  Counter.m
//  JS_Proj_69
//
//  Created by Saunak on 18/02/23.
//



// RCT_EXTERN_MODULE macro - this is for exposing the Counter to JS class.

#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

/*
 
 @interface RCT_EXTERN_MODULE( Counter, NSObject)
 @end
 */


/*
 For giving the class a new name we can use below macro
 
  First argument - Name that will be exposed to JS
  2nd argument - Swift Class
  3rd argument - super class
 */

@interface RCT_EXTERN_REMAP_MODULE(RNCounter, Counter, RCTEventEmitter)
RCT_EXTERN_METHOD(increment)
RCT_EXTERN_METHOD(getCount: (RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(
                  decrement: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject
                  )
@end
