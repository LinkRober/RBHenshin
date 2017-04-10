//
//  Seat.swift
//  GlossExample
//
//  Created by 夏敏 on 06/04/2017.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import UIKit

class Seat: NSObject,RBDecodable {
    
    var location:String?
    
    required init?(json: RBJSON) {
        guard let location = RBDecoder.decodeStringUppercase(key: "location", json: json)  else {
            return nil
        }
        self.location = location
    }
}
