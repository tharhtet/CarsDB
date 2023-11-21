//
//  CarModel.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/21/23.
//

import Foundation


struct CarVehicleModel: Decodable {
    var total_count: Int
    var results: [VehicleModel]
}

struct VehicleModel: Decodable {
    var make: String
    var model: String
    var drive: String
    var vclass: String
    var year: String
    var yousavespend: Int
    var mfrcode: String
    var createdon: String
    var basemodel: String
    var hlv: Int
    var hpv: Int
}
