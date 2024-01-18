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
        viewModel.performLogin(completion: { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let loginModel):
                    //API Success WIP Navigation to Home screen
                    self.userModel = loginModel.user
                    if let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                        homeVC.viewModel.userModel = self.userModel
                        self.navigationController?.pushViewController(homeVC, animated: true)
                    }
                case .failure(_): break
                    //API Fail Show error
                }
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel = LoginViewModel()
        viewModel.getGuestToken(completion: {result in
            switch result{
            case .success(let guestTokenModel): break
                //API Success WIP
            case .failure(let error): break
                //API Fail WIP
            }
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
