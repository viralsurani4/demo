//
//  OtpVM.swift
//  TechLearning
//
//  Created by 2022M2 on 16/04/22.
//

import Foundation
import UIKit

class OtpVM {
    //MARK: - Varible -
    
    //MARK: - Method -
    private func validation(firstDigit:String, secondDigit:String, thirdDigit:String, forthDigit:String) -> String {
        
        if firstDigit.isStringEmpty {
            return ValidationString.enterOTP
        }
        
        if secondDigit.isStringEmpty {
            return ValidationString.enterOTP
        }
        
        if thirdDigit.isStringEmpty {
            return ValidationString.enterOTP
        }
        
        if forthDigit.isStringEmpty {
            return ValidationString.enterOTP
        }
        
        return ""
    }
}

extension OtpVM {
    func apiLogin(firstDigit:String, secondDigit:String, thirdDigit:String, forthDigit:String, Self:UIViewController) -> Bool{
        let errMsg = self.validation(firstDigit: firstDigit, secondDigit: secondDigit, thirdDigit: thirdDigit, forthDigit: forthDigit)
        if !errMsg.isEmpty {
            
            Self.showAlert(errMsg)
            return false
        }else{
            return true
        }
    }
}


