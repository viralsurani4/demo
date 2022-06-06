//
//  GConstant.swift
//  TechLearning
//
//  Created by 2022M2 on 17/03/22.
//

import Foundation
import UIKit


let kAuthenticationStoryBoard = UIStoryboard(name: "Authentication", bundle: nil)
let kHomeStoryBoard = UIStoryboard(name: "Home", bundle: nil)

//---------------------------------------------------------------------------------
let kNAME_ACCEPTABLE_CHARACTERS = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
let kEMAIL_ACCEPTABLE_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@."

//---------------------------------------------------------------------------------
struct ValidationString{
    static let enterName = "Please enter name"
    static let enterEmail = "Please enter email"
    static let enterPhone = "Please enter phone"
    static let enterEmailPhone = "Please enter email/phone number"
    static let enterPassword = "Please enter password"
    static let enterValidName = "Please enter valid name"
    static let enterValidEmail = "Please enter valid email"
    static let enterValidPhone = " Please enter minimum 8 and \n maximum 11 digits for \nmobile number"
    static let enterValidImage = "Please insert valid image"
    static let enterValidBio = "Please enter valid bio"
    static let checkBox = "Please select term & condition"
    static let passwordMatch = "Password not match please try again!"
    static let enterValidPassword = "Password must contain \n at least 8 characters and 1 number \n and 1 special character"
    static let enterOTP = "Please enter valid OTP"
}

//---------------------------------------------------------------------------------
let kDefault = UserDefaults.standard

struct KeyName{
    static let isLogin = "isLogin"
}


