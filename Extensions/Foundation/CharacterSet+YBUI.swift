//
//  CharacterSet+YBUI.swift
//  YBUI
//
//  Created by yang bin on 2019/11/27.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import Foundation


extension CharacterSet {
    /**
    也即在系统的 urlQueryAllowed 基础上去掉“#&=”这3个字符，专用于 URL query 里来源于用户输入的 value，避免服务器解析出现异常。
    */
    public static var urlUserInputQueryAllowed: CharacterSet {
        get{
            var set = CharacterSet.urlQueryAllowed
            set.remove(charactersIn: "#&=")
            return set
        }
    }
}
