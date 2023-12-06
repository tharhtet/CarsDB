//
//  AlertView.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/28/23.
//

import Foundation
import UIKit
struct Alert {
    static let internetAlertMessage = "Please check your internet connection and try again"
    static let internetAlertTitle = "Internet Failure"

    private static func showAlert(on vc:UIViewController,with title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true, completion: nil)
        }
    }

    //Show Common Alert like internet failure
    static func showInternetFailureAlert(on vc:UIViewController){
        showAlert(on: vc, with: internetAlertTitle, message: internetAlertMessage)
    }
}
//
////Show Specific Alerts like Valid or Invalid
//static func showInternetFailureAlert(on vc:UIViewController){
//    showAlert(on: vc, with: “Alert”, message: “Invalid”)
//    }
//}
