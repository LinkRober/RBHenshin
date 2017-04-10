//
//  RBDecoder.swift
//  GlossExample
//
//  Created by 夏敏 on 05/04/2017.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import Foundation

struct RBDecoder {
    /**
     Convenience operator for decoding RBJSON to generic value
     */
    static func decode<T>(key: String,keyPathDelimiter:String = RBHenshineKeyPathDelimiter) -> (RBJSON) -> T? {
        return {
            json in
            if let value = json.valueForKeyPath(keyPath: key, withDelimiter: keyPathDelimiter) as? T {
                return value
            }
            return nil
        }
    }
    
    /**
     Convenience operator for decoding RBJSON to Decodable object
     */
    static func decode<T:RBDecodable>(decodableForKey key:String,keyPathDelimiter:String = RBHenshineKeyPathDelimiter) -> (RBJSON) -> T? {
        return {
            json in
            if let subJSON = json.valueForKeyPath(keyPath: key, withDelimiter: keyPathDelimiter) as? RBJSON{
                return T(json:subJSON)
            }
            return nil
        }
    }
    
    /**
     Convenience operator for decoding RBJSON to array of Decodable objects
     */
    static func decode<T:RBDecodable>(decodableArrayForKey key:String,keyPathDelimiter:String = RBHenshineKeyPathDelimiter) -> (RBJSON) -> [T]?{
        return {
            json in
            if let jsonArray = json.valueForKeyPath(keyPath: key, withDelimiter: keyPathDelimiter) as? [RBJSON]{
                var models:[T] = []
                
                for subJSON in jsonArray {
                    guard let model = T(json:subJSON) else {
                        return nil
                    }
                    models.append(model)
                }
                return models
            }
            return nil
        }
    }
    
    /**
     Decodes RBJSON to an enum value
     */
    static func decode<T:RawRepresentable>(enumForKey key:String,keyPathDelimiter:String = RBHenshineKeyPathDelimiter) -> (RBJSON) -> T? {
        return {
            json in
            if let rawValue = json.valueForKeyPath(keyPath: key, withDelimiter: keyPathDelimiter) as? T.RawValue {
                return T(rawValue:rawValue)
            }
            return nil
        }
    }
}
