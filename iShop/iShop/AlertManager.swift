//
//  AlertManager.swift
//  iShop
//
//  Created by Deepanshu Jain on 08/06/23.
//

import Foundation
import UIKit

class AlertManager {
    
    static func showAlert(title: String, message: String, buttonTitle: String) {
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(action)
        
        if let topViewControll = window?.rootViewController?.topMostViewController() {
            topViewControll.present(alertController, animated: true, completion: nil)
        }
    }
}
