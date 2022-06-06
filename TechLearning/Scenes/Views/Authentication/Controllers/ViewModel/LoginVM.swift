//
//  LoginVM.swift
//  TechLearning
//
//  Created by 2022M2 on 13/04/22.
//

import Foundation
import UIKit

class LoginVM {
    //MARK: - Varible -
    
    //MARK: - Method -
    private func validation(_ emailOrPhone: String , password: String) -> String {
        
        if emailOrPhone.isStringEmpty {
            return ValidationString.enterEmailPhone
        }
        
        if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: emailOrPhone)){
            if !Validation.isValiedMobileNumber(emailOrPhone) {
                return ValidationString.enterValidPhone
            }
        }else{
            if !Validation.isValiedEmail(emailOrPhone) {
                return ValidationString.enterValidEmail
            }
        }
        
        if password.isStringEmpty {
            return ValidationString.enterPassword
        }
        
        if !Validation.isValiedPassword(password){
            return ValidationString.enterValidPassword
        }
        
        return ""
    }
}

extension LoginVM{
    
    func apiLogin(_ emailOrPhone : String, password : String, Self:UIViewController) -> Bool{
        let errMsg = self.validation(emailOrPhone, password: password)
        if !errMsg.isEmpty {
            
            Self.showAlert(errMsg)
            return false
        }else{
            return true
        }
    }
}

