//
//  Seat.swift
//  GlossExample
//
//  Created by 夏敏 on 06/04/2017.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import UIKit

class Seat: NSObject,Henshine {
    
    var location:String?
    
    required init?(json: RBJSON) {
        guard let location:String = "location" <<- json  else {
            return nil
        }
        self.location = location
    }
    
    func toJson() -> RBJSON? {
        return jsonify([
            "location" ->> self.location
            ])
    }
}
