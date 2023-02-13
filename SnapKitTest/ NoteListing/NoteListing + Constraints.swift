//
//  NoteListing + Constraints.swift
//  SnapKitTest
//
//  Created by Lugalu on 05/02/23.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

extension NoteListingView {
    public func makeUI(){
        makeNavBar()
        addViews()
        makeNotesConstraints()
    }
    
    private func makeNavBar(){
        
        let button = UIBarButtonItem(systemItem: .add)
        
        button.rx.tap.subscribe(onNext: { [weak self] event in
            guard let self else { return }
            let router: NoteListingRouterProtocol? = NoteListingRouter()
            router?.openNoteEditing(withNote: nil, View: self)
            
            
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
