//
//  NoteEditingPresenter.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import Foundation

class NoteEditingPresenter: NoteEditingPresenterProtocol{
    var view: NoteEditingViewProtocol?
    //Warns the view if the title change can occur
    //Warns the view if the content Change can occur
    //insert the already Existing contents
    
    func couldSave(_ worked: Bool){
        worked ? view : view
    }
    
}
