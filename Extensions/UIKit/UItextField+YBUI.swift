//
//  UItextField+YBUI.swift
//  YBUI
//
//  Created by yang bin on 2019/11/22.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit

extension UITextField {

///UITextField只有selectedTextRange属性（在<UITextInput>协议里定义），这里拓展了一个方法可以将UITextRange类型的selectedTextRange转换为NSRange类型的selectedRange
    var qmui_selectedRange: NSRange {
        return NSRange.init()
    }

    /// 输入框右边的 clearButton，在 UITextField 初始化后就存在
    var qmui_clearButton: UIButton {
        return UIButton()
    }

    /// 自定义 clearButton 的图片，设置成nil，恢复到系统默认的图片
    dynamic var qmui_clearButtonImage: UIImage {
        return UIImage()
    }
}
