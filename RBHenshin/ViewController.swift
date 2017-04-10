//
//  ViewController.swift
//  RBHenshin
//
//  Created by 夏敏 on 10/04/2017.
//  Copyright © 2017 夏敏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let carJson:RBJSON = [
            "name":"奔驰",
            "engine":"奔驰发动机",
            "wheel":4,
            "user":[
                "firstName":"xia"
            ],
            "seats":[
                ["location":"前"],
                ["location":"后"],
                ["location":"左"],
                ["location":"右"],
            ],
            "energy":"gas"
        ]
        
        guard let car = Car.init(json: carJson) else {
            print("解析失败")
            return
        }
        
        print(car.name ?? "")
        print(car.engine ?? "")
        print(car.wheel ?? 0)
        print(car.user?.firstName ?? "")
        
        guard let seats:[Seat] = car.seats, seats.count > 0 else {
            return
        }
        for seat in seats {
            print(seat.location ?? "error")
        }
        print(car.energy ?? "error")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

