//
//  NoteBusinessService.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 1/5/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import UIKit

public class NoteBusinessService: NSObject {
   
    private struct Constants {
        static let appGroupName = "group.justbaumdev.NoteifyMe"
        static let notesKey = "notes"
    }
    
    // MARK: Public methods
    
    public class func getNotes() -> [Note] {
        let store = sharedDefaults()
        if let notesData = store.objectForKey(Constants.notesKey) as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(notesData) as [Note]
        }
        return []
    }
    
    public class func getNote(uuid: String) -> Note? {
        let notes = getNotes()
        for note in notes {
            if note.uuid == uuid {
                return note
            }
        }
        return nil
    }
    
    public class func saveNotes(notes: [Note]) {
        let store = sharedDefaults()
        store.setObject(NSKeyedArchiver.archivedDataWithRootObject(notes), forKey: Constants.notesKey)
        store.synchronize()
    }
    
    public class func addNote(note: Note) {
        var notes = getNotes()
        notes.append(note)
        saveNotes(notes)
    }
    
    public class func deleteNote(uuid: String) {
        var notes = getNotes()
        let noteToDeleteOpt = getNote(uuid)
        
        if let noteToDelete = noteToDeleteOpt {
            let index = find(notes, noteToDelete)
            notes.removeAtIndex(index!)
            saveNotes(notes)
        }
    }
    
    public class func deleteNotes() {
        let store = sharedDefaults()
        store.removeObjectForKey(Constants.notesKey)
        store.synchronize()
    }
    
    // MARK: Private helper methods
    
    private class func sharedDefaults() -> NSUserDefaults {
        return NSUserDefaults(suiteName: Constants.appGroupName)!
    }
    
}
