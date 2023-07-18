//
//  UITextFieldExtension.swift
//  iShop
//
//  Created by Deepanshu Jain on 14/07/23.
//

import Foundation
import UIKit

class UIEmailField : UITextField {
    
    func isValidEmail(email: String) -> Bool {
      
      let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = email as NSString
          let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              return false
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          return false
      }
      
      return true
  }
    
}

class UIPasswordField : UITextField {
    
    func isValid(textField : UIPasswordField){
        
    }
}
