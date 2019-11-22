//
//  CALayer+YBUI.swift
//  YBUI
//
//  Created by yang bin on 2019/11/22.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit

struct QMUICornerMask: OptionSet {
    let rawValue: UInt

    static let minXminY = QMUICornerMask(rawValue: 1 << 0)
    static let maxXminY = QMUICornerMask(rawValue: 1 << 1)
    static let minXmaxY = QMUICornerMask(rawValue: 1 << 2)
    static let maxXmaxY = QMUICornerMask(rawValue: 1 << 4)
}


extension CALayer {

//    /// 是否为某个 UIView 自带的 layer
//    var ybui_isRootLayerOfView:Bool



}
