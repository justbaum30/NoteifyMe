//
//  WatchNoteDetailsInterfaceController.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 1/7/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import WatchKit
import Foundation
import NoteifyMeCommons

class WatchNoteDetailsInterfaceController: WKInterfaceController {
    
    // MARK: Properties
    
    var note: Note?
    
    @IBOutlet weak var colorIndicator: WKInterfaceGroup!
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var timeRemaining: WKInterfaceTimer!
    @IBOutlet weak var contentLabel: WKInterfaceLabel!
    
    // MARK: Life cycle
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        precondition(context is Note, "Expected class of `context` to be Note.")
        
        note = context as? Note
        colorIndicator.setBackgroundColor(note!.color.colorRef)
        titleLabel.setText(note!.title)
        timeRemaining.setDate(note!.date)
        contentLabel.setText(note!.content)
    }

    // MARK: Actions
    
    @IBAction func removeNote() {
        NoteBusinessService.deleteNote(note!.uuid)
        popController()
    }

}
