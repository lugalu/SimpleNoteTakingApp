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
    var view: NoteListingViewProtocol?
    
    init(view: NoteListingViewProtocol? = nil){
        self.view = view
    }
    
    func fetchAllNotes(){
        _ = Single<[Note]>.create { [weak self] single in
            
            let task = Task{
                do{
                    let realm = try Realm()
                    lazy var notes: Results<Note> = {
                        realm.objects(Note.self)
                    }()
                    let arr: [Note] = notes.map({$0 as Note})
                    
                    single(.success(arr))
                    
                }catch{
                    single(.failure(error))
                }
            }
            
            return Disposables.create{
                task.cancel()
            }
            
        }.subscribe(onSuccess:{ [weak self] result in
            self?.view?.insertNewContent(result)
        })
        .disposed(by: disposeBag)
    }
}
