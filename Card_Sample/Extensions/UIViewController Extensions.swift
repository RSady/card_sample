//
//  UIViewController Extensions.swift
//  Card_Sample
//
//  Created by Ryan Sady on 5/3/19.
//  Copyright © 2019 Ryan Sady. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
