//
//  LessonsCell.swift
//  TechLearning
//
//  Created by 2022M2 on 12/04/22.
//

import UIKit

class LessonsCell: UITableViewCell {

    @IBOutlet weak var lblLessonName: UILabel!
    @IBOutlet weak var lblLessonDescrption: UILabel!
    @IBOutlet weak var imgLesson: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.lblLessonName.boldGeometria(size: 16.0, color: UIColor.black)
        self.lblLessonDescrption.regularGeometria(size: 12.0, color: UIColor.lightGray)
        self.lblLessonDescrption.setLineSpacing(lineSpacing: 6.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
