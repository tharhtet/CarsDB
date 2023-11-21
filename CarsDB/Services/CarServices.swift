//
//  CarServices.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/21/23.
//

import Foundation
import Alamofire

class CarServices {
    static let shared = CarServices()
    
    func fetchCarApis() {
        
    }
    
    func fetchCarLists(completion: @escaping([VehicleModel])->()) {
        AF.request("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/all-vehicles-model/records?select=make%2C%20model%2C%20drive%2C%20id%2C%20vclass%2C%20year%2C%20yousavespend%2C%20mfrcode%2C%20createdon%2Cbasemodel%2C%20hlv%2C%20hpv&limit=20&refine=year%3A%222022%22&refine=vclass%3A%22Compact%20Cars%22") { urlRequest in
            urlRequest.timeoutInterval = 5
            urlRequest.allowsConstrainedNetworkAccess = false
        }
        .response { response in
            debugPrint(response)
        }
        AF.request("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/all-vehicles-model/records?select=make%2C%20model%2C%20drive%2C%20id%2C%20vclass%2C%20year%2C%20yousavespend%2C%20mfrcode%2C%20createdon%2Cbasemodel%2C%20hlv%2C%20hpv&limit=20&refine=year%3A%222022%22&refine=vclass%3A%22Compact%20Cars%22") { urlRequest in
            urlRequest.timeoutInterval = 5
            urlRequest.allowsConstrainedNetworkAccess = false
        }
        .responseData { response in
            print(response.result)
            switch response.result {
                case let .success(data):
                    do {
                        let result = try JSONDecoder().decode(CarVehicleModel.self, from: data)
                        // success
                        completion(result.results)
                    } catch {
                        print("decoding error:\n\(error)")
                        // error
                    }
                case let .failure(error): break
                    // error
            }
        }
        
        
    }
}
