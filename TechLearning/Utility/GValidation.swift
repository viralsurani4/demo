//
//  Validation.swift
//  TechLearning
//
//  Created by 2022M2 on 28/02/22.
//

import Foundation
import UIKit

class Validation{
    //---------------------------------------------------------------------------------
    static func isValiedEmail(_ str:String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: str)
    }
    //---------------------------------------------------------------------------------
    static func isValiedName(_ str:String) -> Bool{
        let RegEx = "([A-Za-z ]+)"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: str)
    }
    //---------------------------------------------------------------------------------
    static func isValiedMobileNumber(_ str:String)  -> Bool{
        let regEx = "^[a-zA-Z0-9]{8,11}$"
        let Test = NSPredicate(format:"SELF MATCHES %@", regEx)
        return Test.evaluate(with: str)
    }
    //---------------------------------------------------------------------------------
    static func isValiedPassword(_ str:String)  -> Bool{
        let regEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let Test = NSPredicate(format:"SELF MATCHES %@", regEx)
        return Test.evaluate(with: str)
    }
}
