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

/// converience operator for edcode json to generic value
///
/// - Parameters:
///   - key: json key for value to decode
///   - json: json
/// - Returns: decode result when successful, nil otherwise
public func <<- <T>(key:String,json:RBJSON) -> T? {
    return RBDecoder.decode(key: key)(json)
}


/// convenience operator for decode json to object value
///
/// - Parameters:
///   - key: json key for value to decode
///   - json: json
/// - Returns: decode value when successful, nil otherwise
public func <<- <T:RBDecodable>(key:String,json:RBJSON) -> T?{
    return RBDecoder.decode(decodableForKey: key)(json)
}


/// convenience operator for decode json to array of decode objects
///
/// - Parameters:
///   - key: json key for value to decode
///   - json: json
/// - Returns: decode value when successful,nil otherwise
public func <<- <T:RBDecodable>(key:String,json:RBJSON) -> [T]? {
    return RBDecoder.decode(decodableArrayForKey: key)(json)
}


/// convenience operator for decode json to enum value.
///
/// - Parameters:
///   - key: json key for value to decode
///   - json: json
/// - Returns: decode value when success,nil other wise
public func <<- <T: RawRepresentable>(key: String,json:RBJSON) -> T? {
    return RBDecoder.decode(enumForKey: key)(json)
}

precedencegroup EncodingPrecedence {
    associativity: left
    higherThan: CastingPrecedence
}

infix operator ->> : EncodingPrecedence

/// convenience operator for encode generic value to json
///
/// - Parameters:
///   - key: json key for value to encode
///   - property: generic value to encode to json
/// - Returns: json when success,nil otherwise
public func ->> <T>(key:String,property:T?) -> RBJSON?{
        return RBEncoder.encode(key: key)(property)
}

/// convenience operator for encode object value to json
///
/// - Parameters:
///   - key: json key for value to encode
///   - property: object to encode to json
/// - Returns: json when success,nil other
public func ->> <T:RBEncodable>(key:String,property:T?) -> RBJSON?{
    return RBEncoder.encode(encodeableForKey: key)(property)
}

/// convenience operator for encode array of generic values to json
///
/// - Parameters:
///   - key: json key for value to encode
///   - property: array of generic values to json
/// - Returns: json when success,nil otherwise
public func ->> <T>(key:String,property:[T]?) -> RBJSON? {
    return RBEncoder.encode(arrayForKey: key)(property)
}

/// convenience operator for encode array of objecs to json
///
/// - Parameters:
///   - key: json key for array of objects to encode
///   - property: array of objects to json
/// - Returns: json when success,nil otherwise
public func ->> <T:RBEncodable>(key:String,property:[T]?) -> RBJSON? {
    return RBEncoder.encode(arrayForEnableKey: key)(property)
}

/// convenience operator for value of enum to json
///
/// - Parameters:
///   - key: json key for value of enum to encode
///   - property: value of enum to json
/// - Returns: json when success,nil otherwise
public func ->> <T:RawRepresentable>(key:String,property:T?) -> RBJSON? {
    return RBEncoder.encode(enumForKey: key)(property)
}









