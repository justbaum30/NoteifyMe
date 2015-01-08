//
//  Note.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner on 1/4/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import UIKit

@objc(NMNote)
public class Note: NSObject, NSCoding, NSCopying {
    
    // MARK: Types
    
    private struct SerializationKeys {
        static let title = "title"
        static let content = "content"
        static let date = "date"
        static let color = "color"
        static let uuid = "uuid"
    }
    
    public enum Color: Int, Printable {
        case Gray, Blue, Green, Orange, Yellow, Red
        
        public var colorRef: UIColor {
            switch self {
            case .Gray:     return UIColor.grayColor()
            case .Blue:     return UIColor.blueColor()
            case .Green:    return UIColor.greenColor()
            case .Orange:   return UIColor.orangeColor()
            case .Yellow:   return UIColor.yellowColor()
            case .Red:      return UIColor.redColor()
            }
        }
        
        public var description: String {
            switch self {
            case .Gray:     return "Gray"
            case .Blue:     return "Blue"
            case .Green:    return "Green"
            case .Orange:   return "Orange"
            case .Yellow:   return "Yellow"
            case .Red:      return "Red"
            }
        }
    }
    
    // MARK: Properties
    
    public var title: String
    public var content: String
    public var date: NSDate
    public var color: Color
    public var uuid: String
    
    // MARK: Initializers
    
    public init(title: String, content: String, date: NSDate, color: Color = .Gray, uuid: String = NSUUID().UUIDString) {
        self.title = title
        self.content = content
        self.date = date
        self.color = color
        self.uuid = uuid
    }
    
    // MARK: NSCoding
    
    public required init(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObjectForKey(SerializationKeys.title) as String
        content = aDecoder.decodeObjectForKey(SerializationKeys.content) as String
        date = aDecoder.decodeObjectForKey(SerializationKeys.date) as NSDate
        color = Color(rawValue: aDecoder.decodeIntegerForKey(SerializationKeys.color))!
        uuid = aDecoder.decodeObjectForKey(SerializationKeys.uuid) as String
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: SerializationKeys.title)
        aCoder.encodeObject(content, forKey: SerializationKeys.content)
        aCoder.encodeObject(date, forKey: SerializationKeys.date)
        aCoder.encodeInteger(color.rawValue, forKey: SerializationKeys.color)
        aCoder.encodeObject(uuid, forKey: SerializationKeys.uuid)
    }
    
    // MARK: NSCopying
    
    public func copyWithZone(zone: NSZone) -> AnyObject  {
        return Note(title: title, content: content, date: date, color: color, uuid: uuid)
    }
    
}
