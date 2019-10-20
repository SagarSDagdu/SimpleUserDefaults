/*
MIT License

Copyright (c) 2019 Sagar Dagdu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
//
//  ViewController.swift
//  SimpleUserDefaults
//
//  Created by Sagar Dagdu on 10/20/19.
//  Copyright © 2019 Sagar Dagdu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK:- Properties
    
    var dummyUser = UserDetails(id: 1, name: "Sagar", address: "Pune")

    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performUserLogout()
        refreshUI()
    }
    
    //MARK:- Helpers
    
    private func refreshUI() {
        if let isUserLoggedIn = Settings.isUserLoggedIn, isUserLoggedIn,
            let user = Settings.loggedInUserDetails {
            usernameLabel.text = "Username : \(user.name)"
            addressLabel.text = "Address : \(user.address)"
            loginButton.setTitle("Logout", for: .normal)
        } else {
            usernameLabel.text = ""
            addressLabel.text = ""
            loginButton.setTitle("Login", for: .normal)
        }
    }
    
    private func performUserLogout() {
        Settings.loggedInUserDetails = nil
        Settings.isUserLoggedIn = false
    }
    
    private func loginWithDummyUser() {
        Settings.isUserLoggedIn = true
        Settings.loggedInUserDetails = dummyUser
    }

    //MARK:- User Interaction
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        var alertText = ""
        if let isLoggedIn = Settings.isUserLoggedIn, isLoggedIn {
            performUserLogout()
            alertText = "Logged out successfully"
        } else {
            loginWithDummyUser()
            let username = Settings.loggedInUserDetails?.name ?? ""
            alertText = "Logged in with user : \(username)"
        }
        
        let alertController = UIAlertController(title: nil, message: alertText, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        refreshUI()
    }
    
}

