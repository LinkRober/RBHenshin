//
//  RBHenshin.swift
//  RBHenshin
//
//  Created by 夏敏 on 10/04/2017.
//  Copyright © 2017 夏敏. All rights reserved.
//

import Foundation

public typealias RBJSON = [String:Any]

public private(set) var RBHenshineKeyPathDelimiter:String = {
    return "."
}()

public protocol Henshine:RBDecodable,RBEncodable {}

public protocol RBDecodable {
    init?(json:RBJSON)
}

public protocol RBEncodable {
    func toJson() -> RBJSON?
}

public func jsonify(_ array:[RBJSON?],keyPathDelimiter:String = RBHenshineKeyPathDelimiter) -> RBJSON? {
    var json:RBJSON = [:]
    for j in array {
        if j != nil {
            for (key,value) in j! {
                setValue(inJson: &json, value: value, forKeyPath: key)
            }
        }
    }
    return json
}

private func setValue(inJson json:inout RBJSON,value:Any,forKeyPath keyPath:String,withDelimiter delimiter: String = RBHenshineKeyPathDelimiter){
    var keyComponents = keyPath.components(separatedBy: delimiter)
    guard let firstKey = keyComponents.first else {
        return
    }
    keyComponents.remove(at: 0)
    if keyComponents.isEmpty {
        json[firstKey] = value
    }else {
        //
    }
}
