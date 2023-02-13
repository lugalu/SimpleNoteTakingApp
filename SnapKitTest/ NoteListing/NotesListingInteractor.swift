//
//  NotesListingInteractor.swift
//  SnapKitTest
//
//  Created by Lugalu on 05/02/23.
//

import Foundation
import RxSwift
import RealmSwift

class NoteListingInteractor: NoteListingInteractorProtocol {
    let disposeBag = DisposeBag()
    var presenter: NoteListingPresenterProtocol? = nil
    
    func fetchAllNotes(){
        Note.retrieveAllNotes()
            .subscribe(onSuccess:{ [weak self] result in
                self?.presenter?.presentNewNotes(newNotes: result)
            })
            .disposed(by: disposeBag)
    }
}
