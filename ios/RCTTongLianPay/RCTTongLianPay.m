//
//  RCTQiYu.m
//  RCTQiYu
//
//  Created by JackYu on 16/8/30.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "RCTTongLianPay.h"
#import "RCTConvert.h"
#import "RCTBridge.h"
#import "RCTUIManager.h"
#import "RCTEventDispatcher.h"
#import "UIView+React.h"



@implementation RCTTongLianPay

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;
//RCT_EXPORT_METHOD(registerApp:(NSString*)appKey withSecret:(NSString*)appSecret) {
//    [SMSSDK registerApp:appKey withSecret:appSecret];
//}


//RCT_EXPORT_METHOD(getVerificationCodeByMethod:(NSInteger)method
//                  phoneNumber:(NSString *)phoneNumber
//                  zone:(NSString *)zone
//                  customIdentifier:(NSString *)customIdentifier
//                  //                  result:(RCTResponseErrorBlock)result) {
//                  callback:(RCTResponseErrorBlock)callback) {
//    
//    [SMSSDK getVerificationCodeByMethod:(SMSGetCodeMethod)method
//                            phoneNumber:phoneNumber
//                                   zone:zone
//                       customIdentifier:customIdentifier
//                                 result:^(NSError *error) {
//                                     NSMutableDictionary *body = [[NSMutableDictionary alloc] init];
//                                     if (error == NULL) {
//                                         body[@"code"] = @"0";
//                                     } else {
//                                         body[@"code"] = [NSString stringWithFormat: @"%ld", error.code];
//                                         NSDictionary *userInfo = [error userInfo];
//                                         body[@"message"] = [userInfo objectForKey:@"getVerificationCode"];
//                                     }
//                                     body[@"type"] = @"getVerificationCode.Resp";
//                                     
//                                     [self sendEventWithName:@"mobSMSEvent" body:body];
//                                     
//                                 }];
//}



//RCT_EXPORT_METHOD(commitVerificationCode:(NSString *)code
//                  phoneNumber:(NSString *)phoneNumber
//                  zone:(NSString *)zone
//                  //                  result:(SMSCommitCodeResultHandler)result) {
//                  callback:(RCTResponseErrorBlock)callback) {
//    
//    [SMSSDK commitVerificationCode:code
//                       phoneNumber:phoneNumber
//                              zone:zone
//                            result:^(SMSSDKUserInfo *userInfo, NSError *error) {
//                                NSMutableDictionary *body = [[NSMutableDictionary alloc] init];
//                                if (error == NULL) {
//                                    body[@"code"] = @"0";
//                                } else {
//                                    body[@"code"] = [NSString stringWithFormat: @"%ld", error.code];
//                                    NSDictionary *userInfo = [error userInfo];
//                                    body[@"message"] = [userInfo objectForKey:@"commitVerificationCode"];
//                                }
//                                body[@"type"] = @"commitVerificationCode.Resp";
//                                
//                                [self sendEventWithName:@"mobSMSEvent" body:body];
//                            }];
//}

RCT_EXPORT_METHOD(getViewController:(nonnull NSNumber *)reactTag
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    RCTUIManager *uiManager = self.bridge.uiManager;
    dispatch_async(uiManager.methodQueue, ^{
        [uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
            UIView *view = viewRegistry[reactTag];
            UIViewController *viewController = (UIViewController *)view.reactViewController;
            resolve(nil);
        }];
    });
}
         
RCT_EXPORT_METHOD(createPayment:(NSDictionary *)payData
                  :(NSString *)schema
                  :(RCTResponseSenderBlock)callback)
{
//    [Pingpp createPayment:charge appURLScheme:schema withCompletion:^(NSString *result, PingppError *error) {
//        callback(@[@(error.code), result]);
//    }];
    
    
    [APay startPay:payData viewController:self delegate:self mode:@"01"];
}

@end
