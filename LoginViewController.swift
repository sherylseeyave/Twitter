//
//  LoginViewController.swift
//  Twitter
//
//  Created by Sheryl Seeyave on 3/5/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "loggedIn") == true{
            self.performSegue(withIdentifier: "LoginSegue", sender: self)
        }
    }
    
    @IBAction func loginTap(_ sender: UIButton) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            UserDefaults.standard.set(true, forKey: "loggedIn")
            self.performSegue(withIdentifier: "LoginSegue", sender: self)
        }, failure: { (Error) in
            print("Could not log in")
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
