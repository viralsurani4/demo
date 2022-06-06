//
//  OtpVC.swift
//  TechLearning
//
//  Created by 2022M2 on 11/04/22.
//

import Foundation
import UIKit

class OtpVC: UIViewController {
    
    //---------------------------------------------------------------------------------
    //MARK: - All Outlets -
    
    @IBOutlet weak var lblTitel: UILabel!
    @IBOutlet weak var lblSubTitel: UILabel!
    
    @IBOutlet weak var txtFirstDigit: OtpTextFiled!
    @IBOutlet weak var txtSecondDigit: OtpTextFiled!
    @IBOutlet weak var txtThirdDigit: OtpTextFiled!
    @IBOutlet weak var txtForthDigit: OtpTextFiled!
    
    //MARK: - All Varible -
    private var viewModel = OtpVM()
    
    //---------------------------------------------------------------------------------
    //MARK: - Custom Funcations -
    
    func setup(){
        self.txtFirstDigit.delegate = self
        self.txtSecondDigit.delegate = self
        self.txtThirdDigit.delegate = self
        self.txtForthDigit.delegate = self
        
        self.txtFirstDigit.becomeFirstResponder()
    }
    
    func applyStyle(){
        self.view.backgroundColor = UIColor.appDarkBlue
        navigationController?.navigationBar.barTintColor = UIColor.appDarkBlue
        
        self.lblTitel.blackRoboto(size: 26.0, color: UIColor.black)
        self.lblSubTitel.regularRoboto(size: 18.0, color: UIColor.lightGray)
        self.lblSubTitel.setLineSpacing(lineSpacing: 2.0)
        
        self.txtFirstDigit.textFiledOTP()
        self.txtSecondDigit.textFiledOTP()
        self.txtThirdDigit.textFiledOTP()
        self.txtForthDigit.textFiledOTP()
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
    
    @IBAction func btnVerifyTapped(_ sender: ButtonRed) {
        self.view.endEditing(true)
        if self.viewModel.apiLogin(firstDigit: self.txtFirstDigit.text!, secondDigit: self.txtSecondDigit.text!, thirdDigit: self.txtThirdDigit.text!, forthDigit: self.txtForthDigit.text!, Self: self){
            kDefault.set(true, forKey: KeyName.isLogin)
            kDefault.synchronize()
            GFuncation.shared.setRootController()
        }
    }
    
    @IBAction func btnBackTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

//=================================================================================
//MARK: - UITextFiled Delegate & DetaSource -

extension OtpVC : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = textField.text
        
        if  ((text?.count)! < 1) && (string.count > 0) {
            
            if textField == self.txtFirstDigit{
                txtSecondDigit.becomeFirstResponder()
            }
            
            if textField == self.txtSecondDigit{
                txtThirdDigit.becomeFirstResponder()
            }
            
            if textField == self.txtThirdDigit{
                txtForthDigit.becomeFirstResponder()
            }
            
            if textField == self.txtForthDigit{
                txtForthDigit.becomeFirstResponder()
                self.view.endEditing(true)
            }
            
            textField.text = string
            return false
            
        }else if ((text?.count)! >= 1) && (string.count == 0) {
            
            if textField == self.txtFirstDigit{
                txtFirstDigit.becomeFirstResponder()
            }
            
            if textField == self.txtSecondDigit{
                txtFirstDigit.becomeFirstResponder()
            }
            
            if textField == self.txtThirdDigit{
                txtSecondDigit.becomeFirstResponder()
            }
            
            if textField == self.txtForthDigit{
                txtThirdDigit.becomeFirstResponder()
            }
            
            textField.text = ""
            return false
            
        }else if (text?.count)! >= 1{
            
            textField.text = string
            return false
            
        }
        
        return true
    }
}
