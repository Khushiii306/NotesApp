//
//  ViewController.swift
//  NotesApp
//
//  Created by DCS on 15/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let token = UserDefaults.standard.string(forKey: "sesionToken")
    let name = UserDefaults.standard.string(forKey: "username")
    
    private let logout_btn2:UIButton = {
        let button = UIButton()
        button.setTitle("Tap Here To Create Notes!", for: .normal)
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    private let username_lbl : UILabel = {
        let welcome = UILabel()
        welcome.text = ""
        welcome.textColor = .white
        welcome.textAlignment = .center
        welcome.shadowColor = .darkGray
        welcome.font = UIFont(name: "Helveticaneue-Bold", size: 16.0)
        return welcome
    }()
    
    
    private let myNote:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(note), for: .touchUpInside)
        button.setImage(UIImage(named: "note"),for: .normal)
        return button
    }()
    
    private let logout_btn:UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    @objc private func logoutTapped(){
        
        UserDefaults.standard.setValue(nil, forKey: "sesionToken")
        UserDefaults.standard.setValue(nil, forKey: "username")
        
        let lv = LoginVC()
        let nav = UINavigationController(rootViewController: lv)
        nav.modalPresentationStyle = .fullScreen
        nav.setNavigationBarHidden(true, animated: false)
        present(nav,animated: false)
        
    }
    
    
    @objc private func note(){
        
        let nt = NotesVC()
        navigationController?.pushViewController(nt, animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes 🖊"
        print("run")
        view.addSubview(username_lbl)
        view.addSubview(logout_btn2)
        view.addSubview(myNote)
        view.addSubview(logout_btn)
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "b7.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
       
    }
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkUserAuth()
    }
    
    private func checkUserAuth(){
        
        if let token  = UserDefaults.standard.string(forKey: "sesionToken"),
            let name = UserDefaults.standard.string(forKey: "username"){
            print(" token :  \(token)")
            username_lbl.text = "Welcome, \(name)"
        } else {
            
            let lv = LoginVC()
            let nav = UINavigationController(rootViewController: lv)
            nav.modalPresentationStyle = .fullScreen
            nav.setNavigationBarHidden(true, animated: false)
            present(nav,animated: false)
        }
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        username_lbl.frame = CGRect(x: 20, y: 80, width: (view.width-40), height: 40)
        myNote.frame = CGRect(x: 140, y: username_lbl.bottom + 200, width: 100, height: 100)
        logout_btn.frame = CGRect(x: 20, y: myNote.bottom + 20, width: (view.width-40), height: 40)
        logout_btn2.frame = CGRect(x: 20, y: myNote.bottom - 60, width: (view.width-40), height: 40)
    }
    
    
}


