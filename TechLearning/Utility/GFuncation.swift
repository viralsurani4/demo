//
//  GFuncation.swift
//  SettingApp
//
//  Created by 2022M2 on 30/03/22.
//

import Foundation
import UIKit

class GFuncation {
    
    static var shared = GFuncation()
    
    func getWindow() -> UIWindow? {
        return UIApplication.shared.windows.first ?? nil
    }
    
    func setRootController(){
        if kDefault.bool(forKey: KeyName.isLogin){
            self.setHomePage()
        }else{
            self.setLoginPage()
        }
    }
    
    func setHomePage(){
        
        guard let window = self.getWindow() else {
            return
        }
        
        let rootViewController = kHomeStoryBoard.instantiateViewController(withIdentifier: "navigationHome")as! UINavigationController
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func setLoginPage(){
        
        guard let window = self.getWindow() else {
            return
        }
        
        let rootViewController = kAuthenticationStoryBoard.instantiateViewController(withIdentifier: "navigationLogin")as! UINavigationController
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
