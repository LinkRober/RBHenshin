//
//  RBOperators.swift
//  RBHenshin
//
//  Created by 夏敏 on 10/04/2017.
//  Copyright © 2017 夏敏. All rights reserved.
//

import Foundation

precedencegroup DecodingPrecedence {
    associativity: left
    higherThan: CastingPrecedence
}

infix operator <<- : DecodingPrecedence

public func <<- <T>(key:String,json:RBJSON) -> T? {
    return RBDecoder.decode(key: key)(json)
}

public func <<- <T:RBDecodable>(key:String,json:RBJSON) -> T?{
    return RBDecoder.decode(decodableForKey: key)(json)
}

public func <<- <T:RBDecodable>(key:String,json:RBJSON) -> [T]? {
    return RBDecoder.decode(decodableArrayForKey: key)(json)
}

public func <<- <T: RawRepresentable>(key: String,json:RBJSON) -> T? {
    return RBDecoder.decode(enumForKey: key)(json)
}

precedencegroup EncodingPrecedence {
    associativity: left
    higherThan: CastingPrecedence
}

infix operator ->> : EncodingPrecedence

public func ->> <T>(key:String,property:T?) -> RBJSON?{
        return RBEncoder.encode(key: key)(property)
}

public func ->> <T:RBEncodable>(key:String,property:T?) -> RBJSON?{
    return RBEncoder.encode(encodeableForKey: key)(property)
}

public func ->> <T>(key:String,property:[T]?) -> RBJSON? {
    return RBEncoder.encode(arrayForKey: key)(property)
}

public func ->> <T:RBEncodable>(key:String,property:[T]?) -> RBJSON? {
    return RBEncoder.encode(arrayForEnableKey: key)(property)
}

public func ->> <T:RawRepresentable>(key:String,property:T?) -> RBJSON? {
    return RBEncoder.encode(enumForKey: key)(property)
}









