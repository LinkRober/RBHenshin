//
//  RBExtensionDictionary.swift
//  GlossExample
//
//  Created by 夏敏 on 05/04/2017.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import Foundation

extension Dictionary {
    func valueForKeyPath(keyPath:String,withDelimiter delimiter:String = RBHenshineKeyPathDelimiter) -> Any?{
        //"wheel.name"
        let keys = keyPath.components(separatedBy: delimiter)
        
        guard keys.first as? Key != nil else {
            return nil
        }
        //["wheel","name"]
        return self.findValue(keys: keys)
    }
    
    func findValue(keys:[String],depthLevel:Int = 0) -> Any? {
        if let currentKey = keys[depthLevel] as? Key {
            if depthLevel == keys.count - 1 {
                return self[currentKey]
            }else if let newDict = self[currentKey] as? Dictionary {
                return newDict.findValue(keys: keys, depthLevel: depthLevel + 1)
            }
        }
        return nil
    }
    
}
