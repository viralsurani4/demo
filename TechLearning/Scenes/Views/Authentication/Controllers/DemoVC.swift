//
//  DemoVC.swift
//  TechLearning
//
//  Created by viral on 23/05/22.
//

import UIKit

class DemoVC: UIViewController {
    
    //MARK: - Outlet -
    
    
    //MARK: - Class Variable -
    
    //private let viewModel = LoginViewModel()

    
    //MARK: - Life Cycle Method -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupViewModelObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //------------------------------------------------------
    
    //MARK: - Memory Management Method -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        debugPrint("‼️‼️‼️ deinit : \(self) ‼️‼️‼️")
    }
    
    //------------------------------------------------------
    
    //MARK: - Custom Method -
    
    /**
     Basic view setup of the screen.
     */
    
    private func setUpView() {
        
    }
    
    private func setupViewModelObserver() {
        // Result binding observer
    }
    
    //MARK: - Action Method -
 
}
