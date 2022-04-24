/*Icons
 Binary Search Tree :https://iconscout.com/icon/flowchart-4185679
 Array : https://www.flaticon.com/free-icon/matrix_3815250
 Queue : https://www.flaticon.com/free-icon/queue_5928186
 Stack : https://www.flaticon.com/premium-icon/layers_3171678
 DataStructure icon: https://iconscout.com/icon/hierarchy-3004675
 Quiz : https://www.flaticon.com/free-icon/quiz_5705144?term=quiz&page=1&position=79&page=1&position=79&related_id=5705144&origin=tag
 Data Structure Icon: https://www.flaticon.com/premium-icon/hierarchical-structure_1324351?term=data%20structure&page=1&position=13&page=1&position=13&related_id=1324351&origin=tag#
 
 confetti icon : https://www.flaticon.com/free-icon/party_2824564?term=confetti&page=1&position=20&page=1&position=20&related_id=2824564&origin=tag
 
 Ranking icon https://www.flaticon.com/free-icon/ranking_3629632?term=ranking&page=1&position=1&page=1&position=1&related_id=3629632&origin=tag
 Star : https://www.flaticon.com/premium-icon/star_2893811?term=star&page=1&position=3&page=1&position=3&related_id=2893811&origin=tag
 Shopping Basket : https://br.freepik.com/vetores-gratis/cesta-de-compras-com-ilustracao-vetorial-de-comida-carrinho-com-compra-do-produto-no-supermercado-ilustracao-vetorial_11059441.htm#query=cesta%20supermercado&position=0&from_view=keyword

 About data structures: https://www.geeksforgeeks.org
 */



import Foundation
import SwiftUI

struct DataStructure{
    var name:String
    var image:String
    var description:String
    var id=UUID()
}



struct DataStructureList{
    static let list = [
        DataStructure(name: "Array", image: "Array", description: "Array is a kind of data structure that group elements of the same data type. The array stores them contiguously and adjacent in memory. If we have an array, we can use an index to have access to the element in the given index. Our index goes from 0 to n-1 where n is the number of elements that we have in the array. The time complexity of insertion will be O(n) because given and index, if we want to insert an element in this index, we will have to skip all elements from that index to the right by one. The deletion follows the same logic taking O(n) but we will have to skip the elements to the left instead of the right. To access the i-th element or override this element, we will take O(1)."),
        DataStructure(name: "Queue", image: "Queue", description: "Queue is a kind of data structure that follows an order of how the operations are made(insertion, deletion). The order that the Queue follows is the FIFO(First in First Out), which means that if you try to remove an item, the item removed will be the first item that you inserted in the queue.Now that we know how the queue works, what else we know?\n Well, we can talk about how much time we spend when inserting or removing an element from the Queue. We can implement a queue using an array. With this kind of implementation we have a time complexity of O(1) when inserting an element and O(n) when removing an element because we will have to shift all the elements in the array.\nQueues are a great option if you need to manage a queue of impression or a keyboard buffer."),
        DataStructure(name: "Stack", image: "Stack", description: "Stack is a kind of data structure that follows an order of how the operations are made(insertion, deletion). The order that the Queue follows is the LIFO(Last in First Out), which means that if you try to remove an item, the item removed will be the last item that you inserted in the Stack.\nNow that we know how the Stack works, what else we know ? Well, we can talk about how much time we spend when inserting or removing an element from the Stack. We can implement a Stack using an array. With this kind of implementation we have a time complexity of O(1) when inserting an element and O(1) when removing an element. We can use to do the parentheses balancing, calculation and conversion of notations and recursion."),
        DataStructure(name: "Binary Search Tree", image: "Binary Search Tree", description: "Binary Search Tree is a tree that has a maximum of 2 children per leaf. In the binary search tree the left leaf(node) has its value lower than its father and the right has its value higher than its father.\nThe biggest advantage of the Binary search tree is that if the tree is height-balanced, to search for an element it will take O(log n) but in the worst case it can take O(n) because the tree can turn into a linked list.")
    ]
}

struct Ranking{
    var id = UUID()
    var score:Int
}


struct Question{
    var question:String
    var option : [String]
    var answer:String
}


struct QuestionList{
    static var questions = [
        Question(question: "Which structure follows the order FIFO(First In First Out)?",
                 option:["Queue","Stack","Binary Search Tree"],
                 answer: "Queue"),
        Question(question:"Which structure follows the order LIFO(Last in First Out)?",
                 option:["Queue","Stack","Array"],
                answer: "Stack"),
        Question(question:"Which structure has time complexity O(1) to remove the Last element?",
                 option:["Binary Search Tree","Stack","Array"],
                 answer:"Stack"),
        Question(question: "Which data structure can access the i-th element in time O(1)?", option: ["Array","Stack","Queue"], answer: "Array"),
        Question(question: "Which data structure can insert and remove an element in time O(1)", option: ["Array","Stack","Queue"], answer: "Stack"),
        Question(question: "Which data structure can be used to do process scheduling?", option: ["Array","Stack","Queue"], answer: "Queue"),
        Question(question: "Which Data Structure can be used to do parentheses balancing?", option: ["Array","Stack","Queue"], answer: "Stack"),
        Question(question: "Which Data Structures take O(n) to removing an element?", option: ["Array-Stack","Stack-Queue","Queue-Array"], answer: "Queue-Array"),
        Question(question: "Which Data Structure takes O(log n) to search for an element if balanced?", option: ["Binary Search Tree","Stack","Queue"], answer: "Binary Search Tree"),
        Question(question: "Given an array [John, Mary, Richard], which index we must use to access John?", option: ["1","0","2"], answer: "0")
    ].shuffled()
    
    func verifyAnswerIsCorrect(_ text: String, _ answer: String) -> Bool {
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
    var ranking:[Ranking] = []

}
