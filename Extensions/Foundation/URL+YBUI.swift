//
//  URL+YBUI.swift
//  YBUI
//
//  Created by yang bin on 2019/11/28.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import Foundation

extension URL {


    /**
    *  获取当前 query 的参数列表。
    *
    *  @return query 参数列表，以字典返回。如果 absoluteString 为 nil 则返回 ""
    */
    var queryItems: Dictionary<String, String>? {
        guard let urlComponents = URLComponents(string: absoluteString), let queryItems = urlComponents.queryItems else {
            return nil
        }
        var params = Dictionary<String, String>()
        for item in queryItems {
            params.updateValue(item.value ?? "", forKey: item.name)
        }
        return params
    }
}
