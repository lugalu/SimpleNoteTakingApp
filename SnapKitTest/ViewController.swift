//
//  ViewController.swift
//  SnapKit
//
//  Created by Lugalu on 30/01/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var square: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }


}

extension ViewController {
    func makeUI(){
        addViews()
    }
    
    private func addViews(){
        
    }
    
    
    
}

