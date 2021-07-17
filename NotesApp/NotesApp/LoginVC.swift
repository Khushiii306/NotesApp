//
//  LoginVC.swift
//  NotesApp
//
//  Created by DCS on 15/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    
    private let username_txt: UITextField = {
        let usr = UITextField()
        usr.borderStyle = .roundedRect
        usr.textAlignment = .center
        usr.textColor = .black
        usr.placeholder = "Enter Username"
        usr.autocapitalizationType = .none
        usr.layer.cornerRadius = 25
        
        return usr
        
    } ()
    
    
    
    
    private let password_txt: UITextField = {
        let psw = UITextField()
        psw.borderStyle = .roundedRect
        psw.textAlignment = .center
        psw.textColor = .black
        psw.placeholder = "Enter Password"
        psw.isSecureTextEntry = true
        psw.layer.cornerRadius = 25
        return psw
        
    } ()
    
    
    
    private let login : UIButton = {
        let con = UIButton()
        con.setTitle("Login", for: .normal)
        con.addTarget(self, action: #selector(logginTapped), for: .touchUpInside)
        con.backgroundColor = .black
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        return con
    } ()
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myImageView)
        view.addSubview(username_txt)
        view.addSubview(password_txt)
        view.addSubview(login)
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "b1.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
        myImageView.frame = CGRect(x: 140, y: 260, width: 100, height: 100)
        username_txt.frame = CGRect(x: 40, y: myImageView.bottom+30, width: view.width - 80, height: 30)
        password_txt.frame = CGRect(x: 40, y: username_txt.bottom + 20, width: view.width - 80, height: 30)
        login.frame = CGRect(x: 40, y: password_txt.bottom + 20, width: view.width - 80, height: 40)
    }
    
    @objc func logginTapped(){
        
        if username_txt.text == "khushbu" && password_txt.text == "khushbu"{
            
            UserDefaults.standard.setValue("VdiiVhjjGvTYvvHUVvyvVyVyv", forKey: "sesionToken")
            UserDefaults.standard.setValue(username_txt.text, forKey: "username")
            print("session start")
            self.dismiss(animated: true)
        } else {
            
            let alert = UIAlertController(title: "Oops!", message: "Please Enter Valid Username And Password, Please Try Again..", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert,animated: true,completion: nil)
            }
            
        }
    }
    
    
}
