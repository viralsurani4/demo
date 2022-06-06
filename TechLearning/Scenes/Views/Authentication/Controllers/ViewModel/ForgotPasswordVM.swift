//
//  ForgotPasswordVM.swift
//  TechLearning
//
//  Created by 2022M2 on 13/04/22.
//

import Foundation
import UIKit

class ForgotPasswordVM {
    //MARK: - Varible -
    
    //MARK: - Method -
    private func validation(_ emailOrPhone:String) -> String {
        
        if emailOrPhone.isStringEmpty {
            return ValidationString.enterEmailPhone
        }
        
        if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: emailOrPhone)){
            if !Validation.isValiedMobileNumber(emailOrPhone) {
                return ValidationString.enterValidPhone
            }
        }else{
            if !Validation.isValiedEmail(emailOrPhone) {
                return ValidationString.enterEmail
            }
        }
        
        return ""
    }
}

extension ForgotPasswordVM{
    func apiLogin(_ emailOrPhone : String, Self:UIViewController) -> Bool{
        let errMsg = self.validation(emailOrPhone)
        if !errMsg.isEmpty {
            
            Self.showAlert(errMsg)
            return false
        }else{
            return true
        }
    }
}

