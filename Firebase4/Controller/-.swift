//
//  LoginController.swift
//  FireBase2
//
//  Created by Thar Htet San on 11/16/17.
//  Copyright © 2017 Thar Htet San. All rights reserved.
//

import UIKit
import Firebase
class LoginController: UIViewController {

    
    let inputContainerView :UIView = {
        
        let ContainerView = UIView()
        ContainerView.translatesAutoresizingMaskIntoConstraints = false
        ContainerView.backgroundColor = UIColor.white
        return ContainerView
    }()
    
    
    let logInRegisterButton : UIButton = {
        let button = UIButton(type : .system)
        button.backgroundColor = UIColor(r : 80,g :101 , b :161)
        button.setTitle("Register ", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(RegisterButtonAction), for : .touchUpInside)
        return button
    }()
    
    let  profileImageView  : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named : "logo1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let loginRegisterSegmentControl : UISegmentedControl = {
      
        let segmentControl = UISegmentedControl(items ["Login,"Register"])
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
        
    }()
    
    @objc func RegisterButtonAction()
    {
        
        
           let userName :String = nameTextField.text!
        let email : String  = EmailAddressTextField.text!
        let password : String  = passwordTextField.text!
        
            Auth.auth().createUser(withEmail: email, password: email) { (userName, error) in
       
            
    
            print("Successfully register")
            return
           
        }
    }
    
    
    let nameTextField : UITextField = {
        let txt = UITextField()
        txt.placeholder = "Name"
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let nameSperatorView : UIView = {
        let view = UIView ()
        view.backgroundColor = UIColor(r : 220,g :220 , b :220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    let EmailAddressTextField : UITextField = {
        let txt = UITextField()
        txt.placeholder = "Email address"
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let EmailSperatorView : UIView = {
        let view = UIView ()
        view.backgroundColor = UIColor(r : 220,g :220 , b :220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    let passwordTextField : UITextField = {
        let txt = UITextField()
        txt.placeholder = "Password"
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor  = UIColor(r: 61, g: 91, b: 151)
      
        
        view.addSubview(inputContainerView)
        view.addSubview(logInRegisterButton)
        view.addSubview(profileImageView)
        view.addSubview(loginRegisterSegmentControl)
        
        SetupInputContainerView()
        SetupRegisterButton()
        SetupProfileImageView()
        SetupSegementedControl()
        
        
    }
    


    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func SetupProfileImageView()
    {
        profileImageView.centerXAnchor.constraint(equalTo : self.view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentControl.topAnchor,constant : -10).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.65).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.32).isActive = true
        
    }
    
    
    func SetupSegementedControl(){
        loginRegisterSegmentControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginRegisterSegmentControl.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor,constant : -12).isActive = true
        loginRegisterSegmentControl.widthAnchor.constraint(equalToConstant : 150).isActive = true
        loginRegisterSegmentControl.heightAnchor.constraint(equalToConstant : 50).isActive = true
        
    }
    
    func SetupInputContainerView()
    {
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor,constant : -25).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(nameSperatorView)
        inputContainerView.addSubview(EmailAddressTextField)
        inputContainerView.addSubview(EmailSperatorView)
        inputContainerView.addSubview(passwordTextField)
        
        //need x,y ,width and height
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo : inputContainerView.heightAnchor,multiplier : 1/3).isActive = true
        
        
        
        
        //need x,y ,width and height
        nameSperatorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        nameSperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSperatorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor,constant : -24).isActive = true
        nameSperatorView.heightAnchor.constraint(equalToConstant : 1).isActive = true
        
       
            //need x,y ,width and height
        EmailAddressTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        EmailAddressTextField.topAnchor.constraint(equalTo: nameSperatorView.bottomAnchor).isActive = true
        EmailAddressTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        EmailAddressTextField.heightAnchor.constraint(equalTo : inputContainerView.heightAnchor,multiplier : 1/3).isActive = true
        
        
        //need x,y ,width and height
        EmailSperatorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        EmailSperatorView.topAnchor.constraint(equalTo: EmailAddressTextField.bottomAnchor).isActive = true
        EmailSperatorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor,constant : -24).isActive = true
        EmailSperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
            //need x,y ,width and height
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: EmailSperatorView.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo : inputContainerView.heightAnchor,multiplier : 1/3).isActive = true
    }
    
    
    
    func SetupRegisterButton(){
        logInRegisterButton.topAnchor.constraint (equalTo: inputContainerView.bottomAnchor,constant :12).isActive = true
        logInRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logInRegisterButton.widthAnchor.constraint(equalTo: view.widthAnchor,constant : -25).isActive = true
        logInRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }


}
extension UIColor {
    
    convenience init (r : CGFloat , g : CGFloat , b :  CGFloat)
    {
        self.init(red : r/255 ,green : g/255, blue : b/255, alpha : 1)
    }
}
