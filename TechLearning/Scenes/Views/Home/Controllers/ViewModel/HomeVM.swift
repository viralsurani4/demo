//
//  HomeVM.swift
//  TechLearning
//
//  Created by 2022M2 on 12/04/22.
//

import UIKit

class HomeVM {
    
    //MARK: - Varible -
    var arrCource = [CourceModel]()
    
    //MARK: - Method -
    func featchData(){
        self.arrCource = [CourceModel(startDate: "25 ", startMonth: "Aug ", endDate: "30 ", endMonth: "Aug, ", year: "2022 ", titel: "Maths Class 12", studentCount: "10 ", dayCount: "5 ", coursePrice: "$ 120", courseImage: UIImage(named: "demoTable")!),
            CourceModel(startDate: "30 ", startMonth: "Aug ", endDate: "25 ", endMonth: "Aug, ", year: "2021 ", titel: "Physics Class 12", studentCount: "5 ", dayCount: "10 ", coursePrice: "$ 200", courseImage: UIImage(named: "demoTable2")!),
            CourceModel(startDate: "25 ", startMonth: "Aug ", endDate: "30 ", endMonth: "Aug, ", year: "2022 ", titel: "Maths Class 12", studentCount: "10 ", dayCount: "5 ", coursePrice: "$ 120", courseImage: UIImage(named: "demoTable")!),
            CourceModel(startDate: "30 ", startMonth: "Aug ", endDate: "25 ", endMonth: "Aug, ", year: "2021 ", titel: "Physics Class 12", studentCount: "5 ", dayCount: "10 ", coursePrice: "$ 200", courseImage: UIImage(named: "demoTable2")!)
        ]
    }
    
    func homeListRow() -> Int{
        return self.arrCource.count
    }
    
    func valueForCell(_ row: Int) -> CourceModel{
        return self.arrCource[row]
    }
}

extension HomeVM {
    
    func api(){
        
    }
}
