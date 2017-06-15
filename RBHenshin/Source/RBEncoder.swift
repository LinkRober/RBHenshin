//
//  RBEncoder.swift
//  RBHenshin
//
//  Created by 夏敏 on 10/04/2017.
//  Copyright © 2017 夏敏. All rights reserved.
//

import Foundation

struct RBEncoder {
    public static func encode<T>(key:String) -> (T?) -> RBJSON?{
        return {
            property in
            
            if let property = property {
                return [key:property]
            }
            return nil
        }
    }
    
    public static func encode<T:RBEncodable>(encodeableForKey key:String) -> (T?) -> RBJSON? {
        return {
            property in
            
            if let property = property?.toJson() {
                return [key:property]
            }
            return nil
        }
    }
    
    public static func encode<T>(arrayForKey key:String) -> ([T]?) -> RBJSON? {
        return {
            array in
            
            if let array = array {
                return [key : array]
            }
            return nil
            
        }
    }
    
    public static func encode<T:RBEncodable>(arrayForEnableKey key:String) -> ([T]?) -> RBJSON? {
        return {
            array in
            
            var enableArray = [RBJSON?]()
            
            if let array = array {
                for obj in array {
                    enableArray.append(obj.toJson())
                }
                return [key : enableArray]
            }
            return nil
        }
    }
    
    public static func encode<T:RawRepresentable>(enumForKey key:String) -> (T?) -> RBJSON? {
        return {
            property in
            if let property = property {
                return [key : property.rawValue]
            }
            return nil
        }
    }
    
    
    
}
