//
//  Note.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner on 1/4/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import UIKit

public class Note: NSObject, NSCoding, NSCopying {
    
    // MARK: Types
    
    private struct SerializationKeys {
        static let title = "title"
        static let content = "content"
        static let color = "color"
    }
    
    public enum Color: Int, Printable {
        case Gray, Blue, Green, Yellow, Orange, Red
        
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
    public var color: Color
    
    
    // MARK: Initializers
    
    public init(title: String = "", content: String = "", color: Color = .Gray) {
        self.title = title
        self.content = content
        self.color = color
    }
    
    // MARK: NSCoding
    
    public required init(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObjectForKey(SerializationKeys.title) as String
        content = aDecoder.decodeObjectForKey(SerializationKeys.content) as String
        color = Color(rawValue: aDecoder.decodeIntegerForKey(SerializationKeys.color))!
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: SerializationKeys.title)
        aCoder.encodeObject(content, forKey: SerializationKeys.content)
        aCoder.encodeInteger(color.rawValue, forKey: SerializationKeys.color)
    }
    
    // MARK: NSCopying
    
    public func copyWithZone(zone: NSZone) -> AnyObject  {
        return Note(title: title, content: content, color: color)
    }
    
}
