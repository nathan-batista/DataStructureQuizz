//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 11/04/22.
//

import Foundation


struct DataStructure{
    var name:String
    var image:String
    var description:String
    var id=UUID()
}



struct DataStructureList{
    static let list = [
        DataStructure(name: "Array", image: "globe", description: "lorem ipsum bla bla bla bla"),
        DataStructure(name: "Queue", image: "globe", description: "lorem ipsum bla bla bla bla"),
        DataStructure(name: "Stack", image: "globe", description: "lorem ipsum bla bla bla bla")
    ]
}


struct Question{
    var question:String
    var option : [String]
    var answer:String
}


struct QuestionList{
    static let questions = [
        Question(question: "Which structure follows the order FIFO(First In First Out)?",
                 option:["Queue","Stack"],
                 answer: "Queue"),
        Question(question:"Which structure follows the order LIFO(Last in First Out)?",
                 option:["Queue","Stack"],
                answer: "Stack"),
        Question(question:"Which structure has time complexity O(1) to remove the Last element?",
                 option:["Queue","Stack","Array"],
                 answer:"Stack")
    ]
    
    func verifyAnswerIsCorrect(_ text:String, _ answer:String)->Bool{
        if text == answer {
            return true
        }
        return false
    }
}

class GameSettings:ObservableObject{
    @Published var score:Int = 0
    @Published var index:Int = 0
    @Published var previousIndex:Int = -1

}
