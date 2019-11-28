//
//  Color+YBUI.swift
//  YBUI
//
//  Created by yang bin on 2019/11/28.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import UIKit

//MARK:- 增加基础属性
extension UIColor {

    func rgb() -> UInt32? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)
            //  (Bits 24-31 are alpha, 16-23 are red, 8-15 are green, 0-7 are blue).
            let rgb = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
            return UInt32(rgb)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }

    /**
    *  将当前色值转换为hex字符串，通道排序是AARRGGBB（与Android保持一致）
    *  @return 色值对应的 hex 字符串，以 # 开头，例如 #00ff00ff
    */
    func hexString() -> String {
        return ""
    }
    /**
    *  获取当前 UIColor 对象里的红色色值
    *
    *  @return 红色通道的色值，值范围为0.0-1.0
    */
    func redValue() -> CGFloat {
        guard let rgbInt = rgb() else {
            return CGFloat(0)
        }
        return CGFloat(rgbInt >> 24)
    }

    /**
     *  获取当前 UIColor 对象里的绿色色值
     *
     *  @return 绿色通道的色值，值范围为0.0-1.0
     */
    func greenValue() -> CGFloat {
        guard let rgbInt = rgb() else {
            return CGFloat(0)
        }
        return CGFloat((rgbInt >> 16) << 8)
    }
    /**
    *  获取当前 UIColor 对象里的蓝色色值
    *
    *  @return 蓝色通道的色值，值范围为0.0-1.0
    */
    func blueValue() -> CGFloat {
        guard let rgbInt = rgb() else {
            return CGFloat(0)
        }
        return CGFloat((rgbInt >> 16) << 8)
    }

    /**
    *  获取当前 UIColor 对象里的透明色值
    *
    *  @return 透明通道的色值，值范围为0.0-1.0
    */
    func alphaValue() -> CGFloat {

    }


}


//MARK:- 扩展构造工厂方法
extension UIColor {

    /**
    *  使用HEX命名方式的颜色字符串生成一个UIColor对象
    *
    *  @param hexString 支持以 # 开头和不以 # 开头的 hex 字符串
    *      #RGB        例如#f0f，等同于#ffff00ff，RGBA(255, 0, 255, 1)
    *      #ARGB       例如#0f0f，等同于#00ff00ff，RGBA(255, 0, 255, 0)
    *      #RRGGBB     例如#ff00ff，等同于#ffff00ff，RGBA(255, 0, 255, 1)
    *      #AARRGGBB   例如#00ff00ff，等同于RGBA(255, 0, 255, 0)
    *
    * @return UIColor对象
    */
    static func hexString(_ hexString: String) -> UIColor {
        guard hexString.count > 0 else {
            assert(false, "你敢传个色值吗")
            return .white
        }
        var alpha:Float = 1, red:Float = 1, blue:Float = 1, green:Float = 1

        let colorString = hexString.replacingOccurrences(of: "#", with: "").uppercased()
        switch colorString.count {
        case 3:// #RGB
            red   = component(from: colorString, start: 0, lenght: 1)
            green = component(from: colorString, start: 1, lenght: 1)
            blue  = component(from: colorString, start: 2, lenght: 1)
        case 4:// #ARGB
            alpha = component(from: colorString, start: 0, lenght: 1)
            red   = component(from: colorString, start: 1, lenght: 1)
            green = component(from: colorString, start: 2, lenght: 1)
            blue  = component(from: colorString, start: 3, lenght: 1)
        case 6:
            red   = component(from: colorString, start: 0, lenght: 2)
            green = component(from: colorString, start: 2, lenght: 2)
            blue  = component(from: colorString, start: 4, lenght: 2)
        case 8:
            alpha = component(from: colorString, start: 0, lenght: 2)
            red   = component(from: colorString, start: 2, lenght: 2)
            green = component(from: colorString, start: 4, lenght: 2)
            blue  = component(from: colorString, start: 6, lenght: 2)
        default:
            assert(false, "\(hexString)这玩意是啥？")
        }
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }

}


//MARK:- 私有方法不暴露
fileprivate extension UIColor {

    static func component(from hexString: String, start: Int, lenght: Int) -> Float {
        guard let subString = hexString.subString(location: start, length: lenght) else {
            return 1
        }
        let fullHex = (lenght == 2) ? subString : subString+subString
        var hexComponent: UInt64 = 0xff
        Scanner(string: fullHex).scanHexInt64(&hexComponent)
        return Float(hexComponent) / 255.0
    }
}