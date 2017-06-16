//
//  Car.swift
//  GlossExample
//
//  Created by 夏敏 on 05/04/2017.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import UIKit

enum Energy:String {
    case gas = "gas"
    case electricity = "electricity"
}


class Car: NSObject,Henshine {
    var name:String?
    var wheel:Int?
    var engine:String?
    var user:Person?
    var seats:[Seat]?
    var energy:Energy?
    var test:String?
    
    required init?(json: RBJSON) {
        guard let name:String = "name" <<- json,
              let wheel:Int = "wheel" <<- json,
              let engine:String = "engine" <<- json,
              let user:Person =  "user" <<- json,
              let seats:[Seat] = "seats" <<- json,
              let energy:Energy = "energy" <<- json  else {
            return nil
        }
        self.name = name
        self.wheel = wheel
        self.engine = engine
        self.user = user
        self.seats = seats
        self.energy = energy
    }
    
    func toJson() -> RBJSON? {
        return jsonify([
            "name" ->> self.name,
            "wheel" ->> self.wheel,
            ("user" ->> self.user)!,
            ("seats" ->> self.seats)!,
            "energy" ->> self.energy,
            "engine" ->> self.engine,
            ])
    }
}

extension RBDecoder {
    static func decodeStringUppercase(key:String,json:RBJSON) -> String? {
        if let string = json[key] as? String {
            return string
        }
        return nil
    }
}
