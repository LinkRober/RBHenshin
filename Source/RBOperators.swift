//
//  RBOperators.swift
//  GlossExample
//
//  Created by 夏敏 on 05/04/2017.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import Foundation

precedencegroup EncodingPrecedence {
    associativity: left
    higherThan: CastingPrecedence
}

infix operator <<- : EncodingPrecedence

func <<- <T>(key:String,json:RBJSON) -> T? {
    return RBDecoder.decode(key: key)(json)
}

func <<- <T:RBDecodable>(key:String,json:RBJSON) -> T?{
    return RBDecoder.decode(decodableForKey: key)(json)
}

func <<- <T:RBDecodable>(key:String,json:RBJSON) -> [T]? {
    return RBDecoder.decode(decodableArrayForKey: key)(json)
}

func <<- <T: RawRepresentable>(key: String,json:RBJSON) -> T? {
    return RBDecoder.decode(enumForKey: key)(json)
}
