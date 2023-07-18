//
//  SignUpViewController.swift
//  iShop
//
//  Created by Deepanshu Jain on 06/06/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UIPasswordField!
    @IBOutlet weak var confirmPassField: UIPasswordField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var signUpViewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDelegates()
    }
    
    @IBAction func tapOnCreateAccount(_ sender: Any) {
        updateUI(isLoading: true)
        checkSignUp()
    }
    
    @IBAction func tapOnLogin(_ sender: Any) {
        navigateToLogin()
    }
    
    private func setDelegates() {
        nameField.delegate = self
        emailField.delegate = self
        passField.delegate = self
        confirmPassField.delegate = self
    }
    
    private func checkSignUp(){
       let request = createRequest()
        signUpViewModel.signUpUser(request: request, completion: { response in
            self.updateUI(isLoading: false)
            self.checkResponse(response: response)
        })
    }
    
    private func checkResponse(response : SignUpResponse){
        if (response.status){
            self.navigateToHome()
        }
        else{
            self.showAlert(message: response.errorMessage ?? "Incorrect Details")
        }
    }
    
    private func createRequest() -> SignUpRequest {
        let request = SignUpRequest(name: nameField.text, email: emailField.text, password: passField.text, confirmPass: confirmPassField.text)
        return request
    }
    
    private func updateUI(isLoading : Bool){
        createAccountButton.isEnabled = !isLoading
        isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    private func navigateToLogin(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func navigateToHome(){
        let tabBarViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        self.navigationController?.pushViewController(tabBarViewController, animated: true)
    }
    
    private func showAlert(message : String){
        AlertManager.showAlert(title: "Incorrect", message: message, buttonTitle: "Try Again")
    }
}

// MARK: - Text Field Delegate Methods

extension SignUpViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        passField.resignFirstResponder()
        emailField.resignFirstResponder()
        confirmPassField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
