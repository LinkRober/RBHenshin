//
//  RBHenshin.swift
//  GlossExample
//
//  Created by 夏敏 on 05/04/2017.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import Foundation

typealias RBJSON = [String:Any]

public private(set) var RBHenshineKeyPathDelimiter:String = {
    return "."
}()

protocol Henshine:RBDecodable,RBEncodable {}

protocol RBDecodable {
    init?(json:RBJSON)
}

protocol RBEncodable {}
