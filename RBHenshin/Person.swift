//
//  Person.swift
//  GlossExample
//
//  Created by 夏敏 on 06/04/2017.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import UIKit

class Person: NSObject,Henshine {
    func toJson() -> RBJSON? {
        return jsonify([
            "firstName" ->> self.firstName,
            "secondName" ->> self.secondName
            ])
    }

    var firstName:String?
    var secondName:String?
    
    required init?(json: RBJSON) {
        guard let firstName:String = "firstName" <<- json else {
            return nil
        }
        self.firstName = firstName
        self.secondName = "secondName" <<- json
    }
}
