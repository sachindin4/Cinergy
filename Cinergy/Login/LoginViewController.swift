//
//  LoginViewController.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/17/24.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel: LoginViewModel!
    var userModel: LoginModel.UserModel?
    @IBAction func continueButtonClicked(_ sender: Any) {
        callGuestTokenAPI(completion: {
            self.callLoginAPI()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
    }
    
    func callGuestTokenAPI(completion: @escaping() -> Void) {
        viewModel.getGuestToken(completion: {_ in
            completion()
        })
    }
    
    func callLoginAPI() {
        self.viewModel.performLogin(completion: { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let loginModel):
                    self.navigateToHomeScreen(loginModel: loginModel)
                case .failure(_):
                    self.showFailureAlertView()
                }
            }
        })
    }
    
    func navigateToHomeScreen(loginModel: LoginModel) {
        self.userModel = loginModel.user
        if let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            homeVC.moviesListViewModel.userModel = self.userModel
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
    
    func showFailureAlertView() {
        let alert = UIAlertController(title: "Login Failed", message: "Something went wrong. Please try agin later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
