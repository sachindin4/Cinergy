//
//  LoginViewController.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/17/24.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel: LoginViewModel!
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        viewModel.performLogin(completion: { result in
            switch result{
            case .success(let loginModel): break
                //API Success WIP Navigation to Home screen
            case .failure(let error): break
                //API Fail Show error
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
