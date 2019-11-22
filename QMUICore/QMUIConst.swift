//
//  QMUIConst.swift
//  YBUI
//
//  Created by yang bin on 2019/11/22.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import Foundation

//MARK:- 变量-编译相关
/// 判断当前是否debug编译模式
#if DEBUG
let IS_DEBUG = true
#else
let IS_DEBUG = false
#endif



//暂时未解决
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 90000
///// 当前编译使用的 Base SDK 版本为 iOS 9.0 及以上
//#define IOS9_SDK_ALLOWED YES
//#endif

//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
///// 当前编译使用的 Base SDK 版本为 iOS 10.0 及以上
//#define IOS10_SDK_ALLOWED YES
//#endif
//
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
///// 当前编译使用的 Base SDK 版本为 iOS 11.0 及以上
//#define IOS11_SDK_ALLOWED YES
//#endif
//
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120000
///// 当前编译使用的 Base SDK 版本为 iOS 12.0 及以上
//#define IOS12_SDK_ALLOWED YES
//#endif
//
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000
///// 当前编译使用的 Base SDK 版本为 iOS 13.0 及以上
//#define IOS13_SDK_ALLOWED YES
//#endif

//MARK:- Clang

///忽略返回值警告
//@discardableResult


//MARK:- 忽略 iOS 13 KVC 访问私有属性限制


//MARK:- 变量-设备相关

//let IS_IPAD = 
