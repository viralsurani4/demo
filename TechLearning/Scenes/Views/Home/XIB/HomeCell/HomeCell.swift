//
//  HomeCell.swift
//  TechLearning
//
//  Created by 2022M2 on 12/04/22.
//

import UIKit

class HomeCell: UITableViewCell {
     
    //MARK: - All Outlets -
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitel: UILabel!
    @IBOutlet weak var lblStudent: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var imgCourse: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Custom Funcations -
    
    func setData(model: CourceModel){
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont(name: FontFamily.Roboto.regular.name, size: 20.0) as Any,
        ]
        
        let attributes2: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: FontFamily.Roboto.black.name, size: 20.0) as Any,
        ]
        
        let attributes3: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: FontFamily.Roboto.regular.name, size: 15.0) as Any,
        ]
        
        let attributes4: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.appColorRed,
            .font: UIFont(name: FontFamily.Roboto.black.name, size: 22.0) as Any,
        ]
        
        let attributes6: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont(name: FontFamily.Roboto.medium.name, size: 15.0) as Any,
        ]
        
        let startDate = NSMutableAttributedString(string: model.startDate,attributes: attributes2)
        let startMonth = NSMutableAttributedString(string: model.startMonth, attributes: attributes)
        let space = NSMutableAttributedString(string: "- ", attributes: attributes)
        let endDate = NSMutableAttributedString(string: model.endDate,attributes: attributes2)
        let endMonth = NSMutableAttributedString(string: model.endMonth + model.year, attributes: attributes)
        
        startDate.append(startMonth)
        startDate.append(space)
        startDate.append(endDate)
        startDate.append(endMonth)
        self.lblDate.attributedText = startDate
        
        self.lblTitel.boldRoboto(size: 18.0, color: UIColor.black)
        self.lblTitel.text = model.titel
        
        let studentCount = NSMutableAttributedString(string: model.studentCount,attributes: attributes3)
        let student = NSMutableAttributedString(string: "Student",attributes: attributes6)
        
        studentCount.append(student)
        self.lblStudent.attributedText = studentCount
        self.lblStudent.superview?.vwCornerRedius(5.0)
        
        let dayCount = NSMutableAttributedString(string: model.dayCount,attributes: attributes3)
        let day = NSMutableAttributedString(string: "Days",attributes: attributes6)
        
        dayCount.append(day)
        self.lblDay.attributedText = dayCount
        self.lblDay.superview?.vwCornerRedius(5.0)
        
        let price = NSMutableAttributedString(string: model.coursePrice,attributes: attributes4)
        let cource = NSMutableAttributedString(string: "/Course")
        
        price.append(cource)
        self.lblPrice.attributedText = price
        
        self.imgCourse.image = model.courseImage
    }
    
    
}
