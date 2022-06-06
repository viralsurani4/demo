//
//  LoginVC.swift
//  TechLearning
//
//  Created by 2022M2 on 11/04/22.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    
    //---------------------------------------------------------------------------------
    //MARK: - All Outlets -
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblDonAccount: UILabel!
    
    @IBOutlet weak var txtEmailPhoneNo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: ButtonRed!
    @IBOutlet weak var btnHavingIssue: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    //MARK: - All Varibles -
    
    private var viewModel = LoginVM()
    
    //---------------------------------------------------------------------------------
    //MARK: - Custom Funcations -
    
    func setup(){
        self.txtPassword.delegate = self
        self.txtEmailPhoneNo.delegate = self
    }
    
    func applyStyle(){
        self.view.backgroundColor = UIColor.appDarkBlue
        navigationController?.navigationBar.barTintColor = UIColor.appDarkBlue
        
        self.lblTitle.blackRoboto(size: 26.0, color: UIColor.black)
        self.lblSubTitle.regularRoboto(size: 18.0, color: UIColor.lightGray)
        self.lblDonAccount.regularRoboto(size: 16.0, color: UIColor.white)
        
        self.txtPassword.textFieldTheme(placeHolder: "Password")
        self.txtEmailPhoneNo.textFieldTheme(placeHolder: "Email/Phone Number")
        
        self.btnHavingIssue.regularRoboto(size: 14.0, color: UIColor.black)
        self.btnRegister.boldRoboto(size: 16.0, color: UIColor.white)
    }
    
    //---------------------------------------------------------------------------------
    //MARK: - VIEW LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.applyStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //---------------------------------------------------------------------------------
    //MARK: - Button Actions -
    
    @IBAction func btnLoginTapped(_ sender: ButtonRed) {
        self.view.endEditing(true)
        if self.viewModel.apiLogin(self.txtEmailPhoneNo.text!, password:self.txtPassword.text!, Self: self) {
            kDefault.set(true, forKey: KeyName.isLogin)
            GFuncation.shared.setRootController()
        }
    }
    
    @IBAction func btnHavingIssueTapped(_ sender: UIButton) {
        let vc = StoryboardScene.Authentication.forgotPasswordVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnRegisterTapped(_ sender: UIButton) {
        let vc = StoryboardScene.Authentication.signUpVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//=================================================================================
//MARK: - UItextfiled Delegate & Datasource -

extension LoginVC : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.txtEmailPhoneNo {
            if kEMAIL_ACCEPTABLE_CHARACTERS.contains(string){
                return true
            }else if string == "" {
                
                return true
            }else{
                
                return false
            }
        }
        return true
    }
}
