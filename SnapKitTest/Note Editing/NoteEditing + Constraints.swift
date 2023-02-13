//
//  NoteEditing + Constraints.swift
//  SnapKitTest
//
//  Created by Lugalu on 09/02/23.
//

import UIKit
import RxSwift
import RxCocoa


extension NoteEditingView {
    
    public func makeUI() {
        addViews()
        makeConstraints()
        makeNavBar()
        
        self.noteTitleView.layer.cornerRadius = 10
        self.noteContentView.layer.borderColor = UIColor.systemGray.cgColor
        self.noteTitleView.borderStyle = .roundedRect
        self.noteTitleView.placeholder = "Title"
        
        self.noteContentView.layer.cornerRadius = 10
        self.noteContentView.layer.borderColor = UIColor.systemGray.cgColor.copy(alpha: 0.5)
        self.noteContentView.layer.borderWidth = 1
    }
    
    private func makeNavBar(){
        let saveBtn = UIBarButtonItem(title: "Save")
        
        saveBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self else { return }
            self.interactor?.save(withTitle: self.noteTitleView.text ?? "", withContent: self.noteContentView.text ?? "")
        })
        .disposed(by: disposeBag)
        
        self.navigationItem.rightBarButtonItem = saveBtn
    }
    
    private func addViews() {
        view.addSubview(noteTitleView)
        view.addSubview(noteContentView)
    }
    
    private func makeConstraints() {
        noteTitleView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(30)
        }
        
        noteContentView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(noteTitleView.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
        
        
    }
    
    
}

