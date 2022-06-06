//
//  Extension.swift
//  TechLearning
//
//  Created by 2022M2 on 17/03/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(_ message: String) {
        let alertviewController = UIAlertController(title: "TechLearning App", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertviewController.addAction(okAction)
        self.present(alertviewController, animated: true, completion: nil)
    }
}

//=================================================================================
//MARK: - UITextField -

extension UITextField{
    func textFieldTheme(placeHolder: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        self.textColor = UIColor.appDarkBlue
        self.font = FontFamily.Roboto.regular.font(size: 16.0)
    }
    
    func textFiledOTP() {
        self.textColor = UIColor.appDarkBlue
        self.font = FontFamily.Roboto.black.font(size: 26.0)
    }
    
    func textFiledSerch(placeHolder: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        self.textColor = UIColor.white
        self.font = FontFamily.Roboto.light.font(size: 18.0)
    }
}
//=================================================================================
//MARK: - UILabel -

extension UILabel{
    
    func extraBoldAkrobat(size: CGFloat,color: UIColor){
        self.textColor = color
        self.font = FontFamily.Akrobat.extraBold.font(size: size)
    }
    
    func regularRoboto(size: CGFloat,color: UIColor){
        self.textColor = color
        self.font = FontFamily.Roboto.regular.font(size: size)
    }
    
    func blackRoboto(size: CGFloat,color: UIColor){
        self.textColor = color
        self.font = FontFamily.Roboto.black.font(size: size)
    }
    
    func boldRoboto(size: CGFloat,color: UIColor){
        self.textColor = color
        self.font = FontFamily.Roboto.bold.font(size: size)
    }
    
    func boldGeometria(size: CGFloat,color: UIColor){
        self.textColor = color
        self.font = FontFamily.Geometria.bold.font(size: size)
    }
    
    func mediumGeometria(size: CGFloat,color: UIColor){
        self.textColor = color
        self.font = FontFamily.Geometria.medium.font(size: size)
    }
    
    func regularGeometria(size: CGFloat,color: UIColor){
        self.textColor = color
        self.font = FontFamily.Geometria.regular.font(size: size)
    }
    
    func badge(value: String){
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = self.layer.bounds.size.height / 2
        self.textAlignment = .center
        self.layer.masksToBounds = true
        self.font = FontFamily.Geometria.medium.font(size: 8.0)
        self.textColor = .white
        self.backgroundColor = .appColorRed
        self.text = value
    }
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}

//=================================================================================
//MARK: - UIView -

extension UIView{
    func vwCornerRedius(_ cornerRedius: CGFloat){
        self.layer.cornerRadius = cornerRedius
    }
}

//=================================================================================
//MARK: - UIButton -

extension UIButton{
    func btnCornerRedius(_ cornerRedius: CGFloat){
        self.layer.cornerRadius = cornerRedius
    }
    
    func regularRoboto(size: CGFloat,color: UIColor){
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = FontFamily.Roboto.regular.font(size: size)
    }
    
    func boldRoboto(size: CGFloat,color: UIColor){
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = FontFamily.Roboto.bold.font(size: size)
    }
    
}

//=================================================================================
//MARK: - UIImageView -

extension UIImageView{
    func imgCornerRedius(_ cornerRedius: CGFloat){
        self.layer.cornerRadius = cornerRedius
    }
    
}

//=================================================================================
//MARK: - String -

extension String {
    var isStringEmpty: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

