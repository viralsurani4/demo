//
//  CourceModel.swift
//  TechLearning
//
//  Created by 2022M2 on 12/04/22.
//

import Foundation
import UIKit

class CourceModel{
    
    var startDate = String()
    var startMonth = String()
    var endDate = String()
    var endMonth = String()
    var year = String()
    var titel = String()
    var studentCount = String()
    var dayCount = String()
    var coursePrice = String()
    var courseImage = UIImage()
    
    init(startDate: String, startMonth: String, endDate: String, endMonth: String, year: String, titel: String, studentCount: String, dayCount: String, coursePrice: String, courseImage: UIImage){
        self.startDate = startDate
        self.startMonth = startMonth
        self.endDate = endDate
        self.endMonth = endMonth
        self.year = year
        self.titel = titel
        self.studentCount = studentCount
        self.dayCount = dayCount
        self.coursePrice = coursePrice
        self.courseImage = courseImage
    }    
}
