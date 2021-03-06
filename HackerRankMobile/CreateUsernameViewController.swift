//
//  CreateUsernameViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 6/26/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    
    @IBOutlet weak var createUsernameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
            let username = textfield.text, !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                // handle error
                return
            }
            FirebaseUser.setCurrent(user, writeToUserDefaults: true)
            
            let storyboard:UIStoryboard = UIStoryboard(name: "Lukestagram", bundle: .main)
            let controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController
            
            self.present(controller, animated: true, completion: nil)
        }
    }
    
}
