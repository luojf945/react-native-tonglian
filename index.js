"use strict";
//index.js
import React, {
  NativeEventEmitter,
  NativeModules
} from 'react-native';
import promisify from 'es6-promisify';
import { EventEmitter } from 'events';

const {TongLianPay} = NativeModules;
// Event emitter to dispatch request and response from WeChat.
const emitter = new EventEmitter();

const smsNativeEvent = new NativeEventEmitter(TongLianPay);  //创建自定义事件接口

// let smsListener = smsNativeEvent.addListener('mobSMSEvent', (resp) => {
//   emitter.emit(resp.type, resp);
// });  //对应了原生端的名字

export function getViewController(reactTag) {
  return new Promise((resolve, reject) => {
    TongLianPay.getViewController(reactTag,resolve,reject);
  });
}

// export function getVerificationCode(phoneNumber,zone,customIdentifier) {
//   return new Promise((resolve, reject) => {
//     MobSMS.getVerificationCodeByMethod(0,phoneNumber,zone,customIdentifier,() => {});
//     emitter.once('getVerificationCode.Resp', (resp) => {
//
//       //TODO 调用reject，会触发root has been cancelled 异常，
//       // if (result == '0') {
//       //   console.info("resolve:")
//       //   resolve(resp);
//       // } else {
//       //   console.info("reject:")
//       //   reject(resp);
//       // }
//
//       resolve(resp)
//     });
//   });
// }
//
// export function commitVerificationCode(code,phoneNumber,zone) {
//   return new Promise((resolve, reject) => {
//     MobSMS.commitVerificationCode(code,phoneNumber,zone,() => {});
//     emitter.once('commitVerificationCode.Resp', (resp) => {
//
//       //TODO 调用reject，会触发root has been cancelled 异常，
//       // if (result == '0') {
//       //   resolve(resp);
//       // } else {
//       //   console.info("reject:")
//       //   reject(result);
//       // }
//
//       resolve(resp)
//     });
//   });
// }
