//
//  NoteTableViewCell.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 1/4/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import UIKit
import NoteifyMeCommons

class NoteTableViewCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var colorIndicator: UIView!
    
    // MARK: Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func styleCellWithNote(note: Note) {
        titleLabel.text = note.title
        colorIndicator.backgroundColor = note.color.colorRef
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateLabel.text = dateFormatter.stringFromDate(note.date)
    }
    
    // MARK: Class functions
    
    class func nibForClass() -> UINib {
        return UINib(nibName: "NoteTableViewCell", bundle: nil)
    }
    
}
