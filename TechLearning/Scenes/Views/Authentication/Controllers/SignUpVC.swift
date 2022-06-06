//
//  SignUpVC.swift
//  TechLearning
//
//  Created by 2022M2 on 11/04/22.
//

import Foundation
import UIKit

class SignUpVC: UIViewController {
    
    //---------------------------------------------------------------------------------
    //MARK: - All Outlets -
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var lblTermCondition: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var btnSignUp: ButtonRed!
    
    //MARK: - All Varibles -
    
    var isSelecated = Bool()
    
    private var viewModel = SignUpVM()
    
    //---------------------------------------------------------------------------------
    //MARK: - Custom Funcations -
    
    func setup(){
        self.txtName.delegate = self
        self.txtPhoneNumber.delegate = self
        self.txtEmail.delegate = self
        self.txtPassword.delegate = self
    }
    
    func applyStyle(){
        self.view.backgroundColor = UIColor.appDarkBlue
        navigationController?.navigationBar.barTintColor = UIColor.appDarkBlue
        
        self.lblTitle.blackRoboto(size: 26.0, color: UIColor.black)
        self.lblSubTitle.regularRoboto(size: 18.0, color: UIColor.lightGray)
        
        self.txtName.textFieldTheme(placeHolder: "Full Name")
        self.txtEmail.textFieldTheme(placeHolder: "Email")
        self.txtPhoneNumber.textFieldTheme(placeHolder: "Phone Number")
        self.txtPassword.textFieldTheme(placeHolder: "Password")
        
        btnCheckBox.setImage(UIImage(named: "unCheckMark"), for: .normal)
        btnCheckBox.setImage(UIImage(named: "checkMark"), for: .selected)        
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: FontFamily.Roboto.regular.name, size: 14.0) as Any
        ]
        
        let attributes2: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont(name: FontFamily.Roboto.light.name, size: 14.0) as Any
        ]
        
        let string = NSMutableAttributedString(string: "I agree to ",attributes: attributes2)
        let terms = NSMutableAttributedString(string: "Terms & Condition ", attributes: attributes)
        let and  = NSMutableAttributedString(string: "and \n",attributes: attributes2)
        let condition  = NSMutableAttributedString(string: "Privacy Policy.",attributes: attributes)
        
        string.append(terms)
        string.append(and)
        string.append(condition)
        
        self.lblTermCondition.attributedText = string
        self.lblTermCondition.setLineSpacing(lineSpacing: 2.0)
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
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
    
    @IBAction func btnChackTapped(_ sender: UIButton) {
        self.btnCheckBox.isSelected.toggle()
        self.isSelecated.toggle()
    }
    
    @IBAction func btnSignUpTapped(_ sender: ButtonRed) {
        self.view.endEditing(true)
        if self.viewModel.apiLogin(self.txtName.text!, email: self.txtEmail.text!, phoneNumber: self.txtPhoneNumber.text!, password: self.txtPassword.text!, isSelecated: self.isSelecated, Self: self) {
            let vc = StoryboardScene.Authentication.otpVC.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func btnBackTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

//=================================================================================
//MARK: - UITextfiled Delegate -

extension SignUpVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.txtName{
            
            if ((textField.text?.count)! == 0 && string.rangeOfCharacter(from: .whitespaces) != nil) || ((textField.text?.count)! > 0 && textField.text?.last  == " " && string.rangeOfCharacter(from: .whitespaces) != nil)  {
                
                return false
            }else{
                return true
            }
            
        }else if textField == self.txtPhoneNumber{
            
            let newLength = textField.text!.count + string.count - range.length
            
            if newLength <= 11 {
                return true
            }else{
                return false
            }
            
        }else if textField == self.txtEmail{
            
            if kEMAIL_ACCEPTABLE_CHARACTERS.contains(string){
                return true
            }else if string == "" {
                
                return true
            }else{
                
                return false
            }
            
        }else{
            return true
        }
    }
}
