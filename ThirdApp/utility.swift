//
//  utility.swift
//  ThirdApp
//
//  Created by Nandan R on 02/10/23.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(title: String? = nil, msg: String, okHandler: (() ->Void)? = nil){
        let alertVc = UIAlertController(title: "Confirmation", message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Okay", style: .default) { _ in
            print("clicked...")
            okHandler?()
        }
        
        alertVc.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertVc.addAction(cancelAction)
        present(alertVc, animated: true)
    }
}
