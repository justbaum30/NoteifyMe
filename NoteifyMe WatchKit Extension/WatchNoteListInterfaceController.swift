//
//  InterfaceController.swift
//  NoteifyMe WatchKit Extension
//
//  Created by Justin Baumgartner  on 12/8/14.
//  Copyright (c) 2014 Justin Baumgartner. All rights reserved.
//

import WatchKit
import Foundation
import NoteifyMeCommons

class WatchNoteListInterfaceController: WKInterfaceController {
    
    // MARK: Types
    
    struct WatchStoryboard {
        static let noteListControllerName = "WatchNoteListInterfaceController"
        
        struct RowTypes {
            static let note = "NoteListRowControllerId"
            static let noNotes = "NoNoteListRowControllerId"
        }
    }
    
    // MARK: Properties
    
    @IBOutlet weak var interfaceTable: WKInterfaceTable!

    override func willActivate() {
        super.willActivate()
        configureTable()
    }
    
    // MARK: Private helper methods
    
    private func configureTable() {
        let notes = NoteBusinessService.getNotes()
        if notes.count == 0 {
            interfaceTable.setNumberOfRows(1, withRowType: WatchStoryboard.RowTypes.noNotes)
            
        } else {
            interfaceTable.setNumberOfRows(notes.count, withRowType: WatchStoryboard.RowTypes.note)
            for var index = 0; index < notes.count; ++index {
                var noteRow = interfaceTable.rowControllerAtIndex(index) as NoteListRowController
                noteRow.styleRowWithNote(notes[index])
            }
        }
    }

}
