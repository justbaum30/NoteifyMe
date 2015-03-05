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
        
        struct Segues {
            static let noteSelection = "WatchNoteDetailsControllerSegue"
        }
    }
    
    // MARK: Properties
    
    private let playgroundIds = ["WatchPlayground1", "WatchPlayground2", "WatchPlayground3", "WatchPlayground4"]
    
    @IBOutlet weak var interfaceTable: WKInterfaceTable!

    override func willActivate() {
        super.willActivate()
        configureTable()
    }
    
    override func didDeactivate() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        super.didDeactivate()
    }
    
    // MARK: Actions
    
    @IBAction func refreshTable() {
        configureTable()
    }
    
    @IBAction func goToPlayground() {
        presentControllerWithNames(playgroundIds, contexts: nil)
    }
    
    @IBAction func removeAllNotes() {
        NoteBusinessService.deleteNotes()
        configureTable()
    }
    
    // MARK: Notification method
    
    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        
        if identifier == "goToPlayground" {
            goToPlayground()
        } else if identifier == "showAlert" {
            WKInterfaceController.openParentApplication(["" : ""], nil)
        } else if identifier == "deleteAllNotes" {
            removeAllNotes()
        }
    }
    
    // MARK: Segues
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        let notes = NoteBusinessService.getNotes()
        return notes[rowIndex]
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
