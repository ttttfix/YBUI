//
//  Regex+Common.swift
//  YBUI
//
//  Created by yang bin on 2019/11/27.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import Foundation


struct RegexTools {

    /// 验证Email
    /// - Parameter email: email description
    static func regex(email: String) -> Bool {
        let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let regex = try! Regex(pattern)
        return regex.matches(email)
    }


}
