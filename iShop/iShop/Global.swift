//
//  Global.swift
//  iShop
//
//  Created by Deepanshu Jain on 13/06/23.
//

import Foundation

class Global {
    public static var userURL = URL(string: "https://localhost:7210/User/4")
    public static var productsURL = URL(string: "https://localhost:7210/Product")
    public static let placeholderImage = "placeholderImage"
    public static let EmptyErrorMessage = "Username or password should not be empty"
    public static let IncorrectErrorMessage = "Incorrect Username or password"
    
    static func isValidEmail(email: String) -> Bool {
      
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
