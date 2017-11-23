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
        button.addTarget(self, action: #selector(LoginRegisterButtonAction), for : .touchUpInside)
        return button
    }()
    
    let  profileImageView  : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named : "logo1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let loginRegisterSegmentControl : UISegmentedControl = {
      
        let segmentControl = UISegmentedControl(items : ["Login","Register"])
        segmentControl.tintColor = UIColor.white
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.selectedSegmentIndex = 1
        segmentControl.addTarget(self, action: #selector(HandleLoginSegementControl),for : .valueChanged)
        return segmentControl
        
    }()
    
    
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
    
    
    
    
    
            //MARK:  HandleLoginSegementControl
    @objc func HandleLoginSegementControl()
    {
        

        let title = loginRegisterSegmentControl.titleForSegment(at: loginRegisterSegmentControl.selectedSegmentIndex)
        print(title)
        logInRegisterButton.setTitle(title, for: .normal)
        
        if loginRegisterSegmentControl.selectedSegmentIndex == 0
        {
            inputContainerViewheight?.constant =  100
            nameTextFieldheight?.isActive = false
            nameTextFieldheight = nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 0)
            nameTextFieldheight?.isActive = true
            
            
            emailTextFieldheight?.isActive = false
            emailTextFieldheight = EmailAddressTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/2)
            emailTextFieldheight?.isActive = true
            
            passwordTextFieldheight?.isActive = false
            passwordTextFieldheight = passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/2)
            passwordTextFieldheight?.isActive = true
            
        }
        else
        {
            inputContainerViewheight?.constant =  150
            nameTextFieldheight?.isActive = false
            nameTextFieldheight = nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
            nameTextFieldheight?.isActive = true
            
            
            emailTextFieldheight?.isActive = false
            emailTextFieldheight = EmailAddressTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
            emailTextFieldheight?.isActive = true
            
            passwordTextFieldheight?.isActive = false
            passwordTextFieldheight = passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
            passwordTextFieldheight?.isActive = true
        }
       
    }
    
    //MARK:  Login Resistrer Button Action
    @objc func LoginRegisterButtonAction()
    {
       if loginRegisterSegmentControl.selectedSegmentIndex == 0
       {
        handleLogin()
       }else
       {
        handleRegister()
        }
    }
    
   
    func handleLogin()
    {
        let userEmail : String  = EmailAddressTextField.text!
        let userPassword : String  = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { (user, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    func handleRegister()
    {
     
        let userName :String = nameTextField.text!
        let UserEmail : String  = EmailAddressTextField.text!
        let UserPassword : String  = passwordTextField.text!
        
        Auth.auth().createUser(withEmail: UserEmail, password: UserPassword) { (userName, error) in
            
            
            if error != nil{
                print(error)
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
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
        profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentControl.topAnchor,constant : -5).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.28).isActive = true
        
    }
    
    
    func SetupSegementedControl(){
        loginRegisterSegmentControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginRegisterSegmentControl.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor,constant : -12).isActive = true
        loginRegisterSegmentControl.widthAnchor.constraint(equalTo: self.inputContainerView.widthAnchor).isActive = true
        loginRegisterSegmentControl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.055).isActive = true
        
    }
    
    
    var inputContainerViewheight : NSLayoutConstraint?
    var nameTextFieldheight : NSLayoutConstraint?
    var emailTextFieldheight : NSLayoutConstraint?
    var passwordTextFieldheight : NSLayoutConstraint?
    
    
    
    //MARK: SetupInputConatinerView
    func SetupInputContainerView()
    {
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor,constant : -25).isActive = true
        inputContainerViewheight = inputContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputContainerViewheight?.isActive = true
        
        
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(nameSperatorView)
        inputContainerView.addSubview(EmailAddressTextField)
        inputContainerView.addSubview(EmailSperatorView)
        inputContainerView.addSubview(passwordTextField)
        
        //need x,y ,width and height
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextFieldheight =   nameTextField.heightAnchor.constraint(equalTo : inputContainerView.heightAnchor,multiplier : 1/3)
        nameTextFieldheight?.isActive = true
        
        
        
        
        //need x,y ,width and height
        nameSperatorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        nameSperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSperatorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor,constant : -24).isActive = true
        nameSperatorView.heightAnchor.constraint(equalToConstant : 1).isActive = true
        
       
            //need x,y ,width and height
        EmailAddressTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        EmailAddressTextField.topAnchor.constraint(equalTo: nameSperatorView.bottomAnchor).isActive = true
        EmailAddressTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTextFieldheight = EmailAddressTextField.heightAnchor.constraint(equalTo : inputContainerView.heightAnchor,multiplier : 1/3)
            emailTextFieldheight?.isActive = true
        
        
        //need x,y ,width and height
        EmailSperatorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        EmailSperatorView.topAnchor.constraint(equalTo: EmailAddressTextField.bottomAnchor).isActive = true
        EmailSperatorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor,constant : -24).isActive = true
        EmailSperatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        
            //need x,y ,width and height
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor,constant :12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: EmailSperatorView.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextFieldheight = passwordTextField.heightAnchor.constraint(equalTo : inputContainerView.heightAnchor,multiplier : 1/3)
            passwordTextFieldheight?.isActive = true
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



