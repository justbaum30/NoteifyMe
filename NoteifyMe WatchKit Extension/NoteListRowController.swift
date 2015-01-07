//
//  NoteListRowController.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 1/6/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import WatchKit
import NoteifyMeCommons

class NoNoteListRowController: NSObject {}

class NoteListRowController: NSObject {
   
    // MARK: Properties
    
    @IBOutlet weak var colorIndicator: WKInterfaceGroup!
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    
    // MARK: Methods
    
    func styleRowWithNote(note: Note) {
        colorIndicator.setBackgroundColor(note.color.colorRef)
        titleLabel.setText(note.title)
    }
    
}
