//
//  Quote.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 9/9/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

class Quote {
   
    let content: String
    let scene: String
    
    class func allQuotes() -> [Quote] {
        let quotes = [
            Quote(content: "Sometimes the road less traveled is less traveled for a reason.", scene: "Jerry in The Baby Shower"),
            Quote(content: "I can't go to a bad movie by myself. What, am I gonna make sarcastic remarks to strangers?", scene: "Jerry in The Chinese Restaurant"),
            Quote(content: "You know the message you're sending out to the world with these sweatpants? You're telling the world, 'I give up. I can't compete in normal society. I'm miserable, so I might as well be comfortable.", scene: "Jerry in The Pilot"),
            Quote(content: "Man, it's the nineties... It's Hammer time!", scene: "Kramer in The Parking Space"),
            Quote(content: "Why is nice bad? What kind of a sick society are we living in when nice is bad?", scene: "George in The Cafe"),
            Quote(content: "When you look annoyed all the time, people think that you're busy.", scene: "George in The Hot Tub"),
            Quote(content: "I would drape myself in velvet if it were socially acceptable.", scene: "George in The Label Maker"),
            Quote(content: "You know what they say, 'You don't sell the steak, you sell the sizzle.'", scene: "Kramer in The Bizzaro Jerry"),
        ]
        return quotes
    }
    
    init(content: String, scene: String) {
        self.content = content
        self.scene = scene
    }
    
}
