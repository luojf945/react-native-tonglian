//
//  RCTQiYu.h
//  RCTQiYu
//
//  Created by JackYu on 16/8/30.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import "RCTEventEmitter.h"
#import "TONGLIAN_SDK/include/APayLib/APay.h"

@interface RCTTongLianPay : NSObject <RCTBridgeModule, APayDelegate>

@end
