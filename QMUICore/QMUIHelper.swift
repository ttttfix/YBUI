//
//  QMUIHelper.swift
//  YBUI
//
//  Created by yang bin on 2019/11/22.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit




class QMUIHelper: NSObject {

    enum keys {
        static let kQMUIResourcesBundleName = "QMUIResources"
    }

    static let shared: QMUIHelper = {
        let instance = QMUIHelper()
        return instance
    }()
    private override init() {}
}


//MARK:- Bundle
extension QMUIHelper {

    static var resourceBundle:Bundle?
    /// 获取 QMUIKit.framework Images.xcassets 内的图片资源
    /// - Parameter name: 图片名
    class func image(name: String) -> UIImage? {

        guard resourceBundle == nil else {
            return UIImage(named: name, in: resourceBundle, compatibleWith: nil)
        }
        resourceBundle = Bundle(for: QMUIHelper.self)
        if let resourcePath = resourceBundle?.path(forResource: keys.kQMUIResourcesBundleName, ofType: "bundle"),
            let resBundle = Bundle(path: resourcePath) {
            resourceBundle = resBundle
        }
        return UIImage(named: name, in: resourceBundle, compatibleWith: nil)

    }
}

//MARK:- DynamicType
extension QMUIHelper {
    static func preferredContentSizeLevel() -> Int {
        switch UIApplication.shared.preferredContentSizeCategory {
        case .extraSmall:
            return 0
        case .small:
            return 1
        case .medium:
            return 2
        case .large:
            return 3;
        case .extraLarge:
            return 4
        case .extraExtraLarge:
            return 5;
        default:
            return 6
        }
    }

    //FIXME: 待验证
    static func heightForDynamicTypeCell(heights: Array<Float>) -> Float {
        let index = QMUIHelper.preferredContentSizeLevel()
        return Float(heights[index])
    }

}


//MARK:- Keyboard
extension QMUIHelper {

    func handleKeyboardWillShow(notification: Notification) {
        
    }

}


