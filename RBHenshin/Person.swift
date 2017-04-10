//
//  Person.swift
//  GlossExample
//
//  Created by 夏敏 on 06/04/2017.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import UIKit

class Person: NSObject,Henshine {
    var firstName:String?
    
    required init?(json: RBJSON) {
        guard let firstName:String = RBDecoder.decodeStringUppercase(key: "firstName", json: json) else {
            return nil
        }
        self.firstName = firstName
    }
}
