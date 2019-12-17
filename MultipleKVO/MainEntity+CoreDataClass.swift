//
//  MainEntity+CoreDataClass.swift
//  MultipleKVO
//
//  Created by Giles on 17/12/2019.
//  Copyright © 2019 Explore and Create Limited. All rights reserved.
//
//

import Foundation
import CoreData

@objc(MainEntity)
public class MainEntity: NSManagedObject
{
    override public func observeValue(forKeyPath keyPath: String?,
                                      of object: Any?,
                                      change: [NSKeyValueChangeKey : Any]?,
                                      context: UnsafeMutableRawPointer?)
    {
        let rawChangeKind = change?[.kindKey] as! UInt
        let changeKind = NSKeyValueChange(rawValue: rawChangeKind)
        
        let changedIndexes = change?[.indexesKey] as! IndexSet
    
        print("\(changeKind == .insertion ? "insertion" : "error") : \(changedIndexes.first!)")
    }
    
    lazy var mirroredChildren: [ChildEntity] = {
        let mirroredChildren = (children?.array as! [ChildEntity]).map { $0 }
        addObserver(self, forKeyPath: #keyPath(children), options: [], context: nil)
        
        return mirroredChildren
    }()
}
