//
//  ViewController.swift
//  FireBase2
//
//  Created by Thar Htet San on 11/16/17.
//  Copyright © 2017 Thar Htet San. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.updateChildValues(["someValue" : 12345])
        
            
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "LogOut", style: .plain, target: self, action: #selector(handleLogout))
        
        
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with : nil, afterDelay : 0)
        }
        
        
    }
    
    @objc func handleLogout(){
        
        do {
        try  Auth.auth().signOut()
        }catch let logoutError {
            print(logoutError)
            
        }
        
        
        let loginControler = LoginController()
        present(loginControler, animated: true, completion: nil)
        
    }
    
}

