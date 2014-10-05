//
//  KIF+SwiftExtension.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 10/5/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

extension XCTestCase {
    
    var tester: KIFUITestActor { return tester() }
    
    func tester(_ file : String = __FILE__, _ line : Int = __LINE__) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(_ file : String = __FILE__, _ line : Int = __LINE__) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
