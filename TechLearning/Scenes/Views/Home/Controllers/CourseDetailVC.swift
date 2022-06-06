//
//  CourseDetailVC.swift
//  TechLearning
//
//  Created by 2022M2 on 12/04/22.
//

import Foundation
import UIKit
import ExpandableLabel

class CourseDetailVC : UIViewController{
    
    //---------------------------------------------------------------------------------
    //MARK: - All Outlets -
    @IBOutlet weak var lblCourseName: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblStudent: UILabel!
    @IBOutlet weak var lblCourseDetail: ExpandableLabel!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblStartMonthYear: UILabel!
    @IBOutlet weak var lblEndDate: UILabel!
    @IBOutlet weak var lblEndMonthYear: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblLesson: UILabel!
    @IBOutlet weak var lblSlot: UILabel!
    @IBOutlet weak var lblJoinClass: UILabel!
    @IBOutlet weak var btnSendRequest: UIButton!
    
    @IBOutlet weak var tblLesson: UITableView!
        
    @IBOutlet weak var vwPopup: StyleView!
    
    @IBOutlet weak var constTableLesson: NSLayoutConstraint!
    
    //MARK: - All Varibles -
    
    var model : CourceModel?
    
    //---------------------------------------------------------------------------------
    //MARK: - Custom Funcations -
    
    func setup(){
        self.tblLesson.delegate = self
        self.tblLesson.dataSource = self
        self.lblCourseDetail.delegate = self
        
        let nibLessonsCell = UINib(nibName: "LessonsCell", bundle: .none)
        self.tblLesson.register(nibLessonsCell, forCellReuseIdentifier: "LessonsCell")
        
    }
    
    func applyStyle(){
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: FontFamily.Geometria.medium.name, size: 14.0) as Any,
        ]
        
        let attributes2: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont(name: FontFamily.Geometria.medium.name, size: 14.0) as Any,
        ]
        
        let attributes3: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.appColorRed,
            .font: UIFont(name: FontFamily.Geometria.medium.name, size: 14.0) as Any,
        ]
        
        self.lblCourseName.boldGeometria(size: 18.0, color: UIColor.black)
        self.lblCourseName.text = self.model?.titel
        
        let dayCount = NSMutableAttributedString(string: self.model!.dayCount,attributes: attributes)
        let day = NSMutableAttributedString(string: "Days", attributes: attributes2)
        
        dayCount.append(day)
        self.lblDay.attributedText = dayCount
        
        //---------------------------------------------------------------------------------
        
        let studentCount = NSMutableAttributedString(string: self.model!.studentCount,attributes: attributes3)
        let student = NSMutableAttributedString(string: "/" + self.model!.studentCount + " Students", attributes: attributes2)
        
        studentCount.append(student)
        self.lblStudent.attributedText = studentCount
        
        self.lblCourseDetail.regularGeometria(size: 14.0, color: UIColor.lightGray)
        
        
        self.lblStartDate.boldGeometria(size: 28.0, color: UIColor.black)
        self.lblStartDate.text = self.model?.startDate
        
        self.lblEndDate.boldGeometria(size: 28.0, color: UIColor.black)
        self.lblEndDate.text = self.model?.endDate
        
        self.lblPrice.boldGeometria(size: 22.0, color: UIColor.appColorRed)
        self.lblPrice.text = self.model?.coursePrice
        
        self.lblLesson.boldGeometria(size: 16.0, color: UIColor.black)
        
        self.lblSlot.boldGeometria(size: 16.0, color: UIColor.appColorPink)
    
        self.lblJoinClass.regularGeometria(size: 14.0, color: UIColor.black)
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
          // Fallback on earlier versions
        }
        
        //Expantable Label
        self.lblCourseDetail.setLessLinkWith(lessLink: "Read Less", attributes: [.foregroundColor:UIColor.black], position: .none)
        
        self.lblCourseDetail.collapsedAttributedLink = NSAttributedString(string: "Read More", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont(name: FontFamily.Geometria.medium.name, size: 14.0) as Any])
        
        self.lblCourseDetail.shouldCollapse = true
        self.lblCourseDetail.textReplacementType = .character
        self.lblCourseDetail.numberOfLines = 3
        self.lblCourseDetail.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    }
    
    //---------------------------------------------------------------------------------
    //MARK: - VIEW LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.applyStyle()
        self.tblLesson.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.tblLesson.layer.removeAllAnimations()
        self.constTableLesson.constant = self.tblLesson.contentSize.height
        UIView.animate(withDuration: 0.5) {
            self.updateViewConstraints()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //---------------------------------------------------------------------------------
    //MARK: - Button Actions -
    
    @IBAction func btnBackTapped(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSendRequestTapped(_ sender: ButtonPink) {
        
        self.vwPopup.isHidden = true
    }
    
}

//=================================================================================
//MARK: - UItable Delegate & Detasource -

extension CourseDetailVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonsCell") as! LessonsCell
        
        return cell
    }
}

//=================================================================================
//MARK: - Expantable Delegate-

extension CourseDetailVC : ExpandableLabelDelegate{
    func willExpandLabel(_ label: ExpandableLabel) {
        
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
        
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        
    }
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        
    }
}
