//
//  SignUpVM.swift
//  TechLearning
//
//  Created by 2022M2 on 13/04/22.
//

import Foundation
import UIKit

class SignUpVM {
    //MARK: - Varible -
    
    //MARK: - Method -
    private func validation(_ name:String, email:String, phoneNumber:String, password:String, isSelecated:Bool) -> String {
        
        if name.isStringEmpty {
            return ValidationString.enterName
        }
        
        if email.isStringEmpty {
            return ValidationString.enterEmail
        }
        
        if !Validation.isValiedEmail(email) {
            return ValidationString.enterValidEmail
        }
        
        if phoneNumber.isStringEmpty {
            return ValidationString.enterPhone
        }
        
        if !Validation.isValiedMobileNumber(phoneNumber) {
            return ValidationString.enterValidPhone
        }
        
        if password.isStringEmpty {
            return ValidationString.enterPassword
        }
        
        if !Validation.isValiedPassword(password) {
            return ValidationString.enterValidPassword
        }
        
        if !isSelecated {
            return ValidationString.checkBox
        }
        
        return ""
    }
}

extension SignUpVM {
    func apiLogin(_ name:String, email:String, phoneNumber:String, password:String, isSelecated:Bool, Self:UIViewController) -> Bool{
        let errMsg = self.validation(name, email: email, phoneNumber: phoneNumber, password: password, isSelecated: isSelecated)
        if !errMsg.isEmpty {
            
            Self.showAlert(errMsg)
            return false
        }else{
            return true
        }
    }
}


