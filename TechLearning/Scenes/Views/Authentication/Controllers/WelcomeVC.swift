//
//  WelcomeVC.swift
//  TechLearning
//
//  Created by 2022M2 on 11/04/22.
//

import Foundation
import UIKit

class WelcomeVC: UIViewController {
    
    //---------------------------------------------------------------------------------
    //MARK: - All Outlet -
    
    @IBOutlet weak var lblTitleCaption: CustomLabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    @IBOutlet weak var btnLogin: ButtonRed!
    @IBOutlet weak var btnRegister: ButtonWhite!
    
    @IBOutlet weak var lblTemsCondition: UILabel!
    
    //---------------------------------------------------------------------------------
    //MARK: - Custom Fucation -
    
    func setup(){
        
    }
    
    func applyStyle(){
        self.lblTitleCaption.extraBoldAkrobat(size: 35.0, color: UIColor.white)
        self.lblTitleCaption.setLineSpacing(lineSpacing: 8.0)
        self.lblSubTitle.regularRoboto(size: 18.0, color: UIColor.white)
        
        self.view.backgroundColor = UIColor.appDarkBlue
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.appColorRed,
            .font: UIFont(name: FontFamily.Roboto.bold.name, size: 16.0) as Any,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributes2: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: FontFamily.Roboto.regular.name, size: 16.0) as Any
        ]
        
        let string = NSMutableAttributedString(string: "By continuing you agree to ",attributes: attributes2)
        let terms = NSMutableAttributedString(string: "Terms & Condition \n", attributes: attributes)
        let and  = NSMutableAttributedString(string: "& ",attributes: attributes2)
        let policy = NSMutableAttributedString(string: "Privacy Policy.", attributes: attributes)
        
        string.append(terms)
        string.append(and)
        string.append(policy)
        
        self.lblTemsCondition.attributedText = string
        self.lblTemsCondition.setLineSpacing(lineSpacing: 10.0)
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
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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
    //MARK: - Button Action -
    
    @IBAction func btnLoginTapped(_ sender: ButtonRed) {
        let vc = StoryboardScene.Authentication.loginVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnRegisterTapped(_ sender: ButtonWhite) {
        let vc = StoryboardScene.Authentication.signUpVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
