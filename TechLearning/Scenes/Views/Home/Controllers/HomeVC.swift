//
//  HomeVC.swift
//  TechLearning
//
//  Created by 2022M2 on 12/04/22.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    
    //---------------------------------------------------------------------------------
    //MARK: - All Outlets -
    
    @IBOutlet weak var lblUserName: UILabel!
    
    @IBOutlet weak var txtSerch: UITextField!
    
    @IBOutlet weak var tblCourselist: UITableView!
    
    //MARK: - All Varibles -
    private var viewModel = HomeVM()
    
    //---------------------------------------------------------------------------------
    //MARK: - Custom Funcations -
    
    func setup(){
        self.tblCourselist.delegate = self
        self.tblCourselist.dataSource = self
        
        let nibHomeCell = UINib(nibName: "HomeCell", bundle: nil)
        self.tblCourselist.register(nibHomeCell, forCellReuseIdentifier: "HomeCell")
        
        self.viewModel.featchData()
    }
    
    func applyStyle(){
        
        self.txtSerch.textFiledSerch(placeHolder: "What you want to learn?")
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: FontFamily.Roboto.bold.name, size: 30.0) as Any,
        ]
        
        let attributes2: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: FontFamily.Roboto.light.name, size: 30.0) as Any,
        ]
        
        let hello = NSMutableAttributedString(string: "Hello ",attributes: attributes2)
        let userName = NSMutableAttributedString(string: "Sezan!", attributes: attributes)
        
        hello.append(userName)
        
        self.lblUserName.attributedText = hello
        self.lblUserName.setLineSpacing(lineSpacing: 8.0)
        
        let label = UILabel(frame: CGRect(x: 16, y: 0, width: 8, height: 8))
        label.badge(value: "")
        
        // button
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        rightButton.setBackgroundImage(UIImage(named: "notification"), for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonTouched), for: .touchUpInside)
        rightButton.addSubview(label)
        
        // Bar button item
        let rightBarButtomItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightBarButtomItem
        
    }
    
    @objc func rightButtonTouched() {
      print("right button touched")
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
    
}

//=================================================================================
//MARK: - UItable Delegate & Detasource -

extension HomeVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.homeListRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        
        let model = self.viewModel.valueForCell(indexPath.row)
        cell.setData(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StoryboardScene.Home.courseDetailVC.instantiate()
        vc.model = self.viewModel.valueForCell(indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
