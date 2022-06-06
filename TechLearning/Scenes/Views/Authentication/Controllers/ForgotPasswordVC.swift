//
//  ForgotPasswordVC.swift
//  TechLearning
//
//  Created by 2022M2 on 11/04/22.
//

import Foundation
import UIKit

class ForgotPasswordVC: UIViewController {
    
    //---------------------------------------------------------------------------------
    //MARK: - All Outlets -
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    @IBOutlet weak var txtPhoneEmail: UITextField!
    
    @IBOutlet weak var btnSubmit: ButtonRed!
    
    //MARK: - All Varibles -
    
    private var viewModel = ForgotPasswordVM()
    
    //---------------------------------------------------------------------------------
    //MARK: - Custom Funcations -
    
    func setup(){
        
    }
    
    func applyStyle(){
        self.view.backgroundColor = UIColor.appDarkBlue
        navigationController?.navigationBar.barTintColor = UIColor.appDarkBlue
        
        self.lblTitle.blackRoboto(size: 26.0, color: UIColor.black)
        self.lblSubTitle.regularRoboto(size: 18.0, color: UIColor.lightGray)
        self.lblSubTitle.setLineSpacing(lineSpacing: 7.0)
        
        self.txtPhoneEmail.textFieldTheme(placeHolder: "Email/Phone Number")
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
    
    @IBAction func btnBackTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSubmitTapped(_ sender: ButtonRed) {
        self.view.endEditing(true)
        if self.viewModel.apiLogin(self.txtPhoneEmail.text!, Self: self) {
            let vc = StoryboardScene.Authentication.otpVC.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//=================================================================================
//MARK: - UItextfiled Delegate & Datasource -

extension ForgotPasswordVC : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.txtPhoneEmail {
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

