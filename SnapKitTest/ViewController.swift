//
//  ViewController.swift
//  SnapKit
//
//  Created by Lugalu on 30/01/23.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    let notesView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makeUI()
        self.configureElements()
        
    }

    func configureElements(){
        //TODO: Bind notesArr to TableView
    }

}

extension ViewController {
    func makeUI(){
        makeNavBar()
        addViews()
        makeNotesConstraints()
    }
    
    private func makeNavBar(){
        
        let button = UIBarButtonItem(systemItem: .add)
        
        button.rx.tap.subscribe(onNext: { [weak self] event in
            guard let self else { return }
            //TODO: go to ADD Page
            print(self)
            
        }).disposed(by: disposeBag)
        
        self.navigationItem.rightBarButtonItem = button
    }
    
    private func addViews(){
        view.addSubview(notesView)
    }
    
    private func makeNotesConstraints(){
        notesView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
    
}

