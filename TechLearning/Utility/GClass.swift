//
//  GClass.swift
//  TechLearning
//
//  Created by 2022M2 on 17/03/22.
//

import Foundation
import UIKit

//=================================================================================
//MARK: - Button Style -

class ButtonRed: UIButton {
    override func awakeFromNib() {
        self.btnCornerRedius(10.0)
        self.backgroundColor = UIColor.appColorRed
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = FontFamily.Roboto.bold.font(size: 16.0)
    }
}

class ButtonWhite: UIButton {
    override func awakeFromNib() {
        self.btnCornerRedius(10.0)
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.black, for: .normal)
        self.titleLabel?.font = FontFamily.Roboto.bold.font(size: 16.0)
    }
}

class ButtonPink: UIButton {
    override func awakeFromNib() {
        DispatchQueue.main.async {
            self.btnCornerRedius(self.frame.height / 2)
        }
        
        self.backgroundColor = UIColor.appColorPink
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = FontFamily.Geometria.medium.font(size: 14.0)
    }
}

//=================================================================================
//MARK: - UITextFiled -

class OtpTextFiled: UITextField{
    override func deleteBackward() {
        super.deleteBackward()
        if IQKeyboardManager.shared.canGoPrevious{
            IQKeyboardManager.shared.goPrevious()
        }
    }
    
    @objc func textfieldIsEditing(_ textField:UITextField){
        if !textField.text!.isEmpty{
            if IQKeyboardManager.shared.canGoNext{
                IQKeyboardManager.shared.goNext()
            } else {
                self.resignFirstResponder()
            }
        }
    }
}

//=================================================================================
//MARK: - label Style -

class MediumGeoMetric: UILabel{
    override func awakeFromNib() {
        self.mediumGeometria(size: 12.0, color: UIColor.lightGray)
    }
}

open class CustomLabel : UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }

    }
}

//=================================================================================
//MARK: - View Style -

class StyleView: UIView{
    override func awakeFromNib() {
        self.vwCornerRedius(10.0)
    }
}

class StyleViewLocation: UIView{
    override func awakeFromNib() {
        self.vwCornerRedius(5.0)
    }
}

class OtpView: UIView{
    override func awakeFromNib() {
        DispatchQueue.main.async {
            self.vwCornerRedius(10)
            self.layer.borderWidth = 1.0
            self.layer.backgroundColor = UIColor.clear.cgColor
            self.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}

class ShedwoView: UIView{
    override func awakeFromNib() {
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.white
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 8.0
        self.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1).cgColor
        self.layer.masksToBounds = false
    }
}


class DetailView: UIView{
    override func awakeFromNib() {
        DispatchQueue.main.async {
            self.vwCornerRedius(10)
            self.layer.borderWidth = 0.5
            self.layer.backgroundColor = UIColor.clear.cgColor
            self.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}

