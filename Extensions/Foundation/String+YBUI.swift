//
//  String+YBUI.swift
//  YBUI
//
//  Created by yang bin on 2019/11/27.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import Foundation
import CommonCrypto


public extension String {

    /// 去掉头尾的空白字符
    var trimTopBottomSpace: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    /// 去掉整段文字内的所有空白字符（包括换行符）
    var  trimAllSpace: String {
        return replacingOccurrences(of: "\\s", with: "", options: .regularExpression, range: range(of: self))
    }

    /// 将文字中的换行符替换为空格
    var trimLinerBreakCharacter: String {
        return replacingOccurrences(of: "\n", with: " ", options: .regularExpression, range: range(of: self))
    }

    /// 把该字符串转换为对应的 md5
    var md5: String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)
        
        if let d = self.data(using: .utf8) {
            _ = d.withUnsafeBytes { body -> String in
                CC_MD5(body.baseAddress, CC_LONG(d.count), &digest)
                return ""
            }
        }
        return (0 ..< length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }

    /// 返回一个符合 query value 要求的编码后的字符串，例如&、#、=等字符均会被变为 %xxx 的编码
    var encodingUserInputQuery: String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlUserInputQueryAllowed)
    }

/// 把当前文本的第一个字符改为大写，其他的字符保持不变，例如 backgroundView.qmui_capitalizedString -> BackgroundView（系统的 capitalizedString 会变成 Backgroundview）
    var capitalizedString: String? {
        guard self.count > 0, let first = subString(to: 0), let other = subString(from: 1) else {return nil}

        return first.uppercased() + other
    }


    /**
    * 用正则表达式匹配的方式去除字符串里一些特殊字符，避免UI上的展示问题
    * @link http://www.croton.su/en/uniblock/Diacriticals.html @/link
    */
    var removeMagicalChar: String {
        guard count>0 else {return self}

        //初始化正则工具类
        let pattern = "([\\u0300-\\u036F])"
        let regex = try! Regex(pattern)
        //替换所有匹配项
        let out = regex.replacingMatches(in: self, with: "")
        return out
    }

    /**
    *  按照中文 2 个字符、英文 1 个字符的方式来计算文本长度
    */
    var countWhenCountingNonASCIICharacterAsTwo: Int {
        guard count > 0 else {return 0}

        var number = 0
        for i in 0 ..< count {
            let character: unichar = (self as NSString).character(at: i)
            if (character >= 0x4E00) {
                number += 2
            } else {
                number += 1
            }
        }
        return number
    }
}


//MARK:- SubString
extension String {

    /// 获取字符串 到index终止（包括Index）
    /// - Parameter index: 终止
    func subString(to index: Int) -> String? {
        return subString(from: 0, to: index)
    }

    /// 获取字符串 从index到结束
    /// - Parameter index: 起始
    func subString(from index: Int) -> String? {
        return subString(from: index, to: self.count-1)
    }

    /// 根据起始终止位置截取一个子字符串 [startIndex, endIndex] 包括起始和结束
    /// - Parameters:
    ///   - startIndex: 起始Index
    ///   - endIndex: 结束Index
    func subString(from startIndex: Int, to endIndex: Int) -> String? {
        assert(endIndex >= startIndex, "endIndex不能小于StartIndex")
        assert(self.count > endIndex, "endIndex超过了字符串长度")
        assert(startIndex >= 0, "startIndex不能为负数")

        guard endIndex >= startIndex, self.count > endIndex, startIndex >= 0 else {return nil}

        let startIndex = self.index(self.startIndex, offsetBy: startIndex)
        let endIndex = self.index(self.startIndex, offsetBy: endIndex)
        return String(self[startIndex...endIndex])
    }

    /// 根据Range截取子字符串
    /// - Parameters:
    ///   - location: location description
    ///   - length: length description

    func subString(location:Int, length: Int) -> String? {
        assert(location >= 0, "起始位置不能为负数")
        assert(length > 0, "长度必须大于0")

        guard location >= 0, length > 0 else {return nil}
        return subString(from: location, to: location+length-1)
    }
}



