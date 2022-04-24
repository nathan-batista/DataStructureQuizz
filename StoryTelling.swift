import Foundation
import SwiftUI

var texts = [
    "When practicing programming, we usually use don’t pay much attention to how efficient our code is and only try to solve the problem, but, we usually want an application to be more optimized. One thing to do our application more efficient is to decide correctly what data structure we are going to use in our app. Knowing it, what are data structures?",
    "A data structure is a way that you can organize your data. Imagine you go to the market and want to buy food, depending on how you organize the food in your shopping basket you will be able to put more food on the basket. So to put it simple, the way you organize your data can affect how efficient your application is.",
    "Each data structure has your own complexity time for each operation, but, what is complexity time? Its how much time our algorithm takes to do what it was done to do.  We have two main operations when it comes to data structures: insertion and deletion of items. But what difference does it make? Lets imagine you want to remove the first item of an array, to do it, after removing you first item you will have to fix your array so that after removing it, the first position isn’t empty and to do this you will have to move all your other elements but if you use a queue, you don’t have to do this.",
    "But dont freak out, i know this is too much to understand at once and this app will help you with it. In this app you will be able to study about 4 differentes types of data structure and also can play a small quiz to practice your knowledge. This is not all, you can play how much you want but how would i know that i’m improving? just go to the ranking page and see how great you are doing compared to your previous attempts."
]

struct StoryTelling:View{
    @State var textIndex = 0
    @Binding var showApp : Bool
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
            HStack(spacing: 10) {
                VStack(alignment: .leading){
                    Spacer()
                    Image("Character")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width*0.5)
                }
                VStack{
                    StoryTellingButton(text: texts[textIndex])
                    if textIndex == 1{
                        Image("shoppingbasket")
                            .resizable()
                            .scaledToFit()
                            .frame(width:UIScreen.main.bounds.width*0.2)
                    }
                    Button(action: {
                        if(textIndex < (texts.count - 1)){
                            textIndex += 1
                        } else {
                            showApp = true
                        }
                    }){
                        ZStack{
                            Text("Next")
                                .fontWeight(.semibold)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.body)
                                .padding()
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white, lineWidth: 4)
                            )
                        }
                    }.background(Color.white)
                        .cornerRadius(25)
                        .padding(.trailing,15)
                }
            }
        }
    }
}

struct StoryTellingButton:View{
    var text:String
    var body: some View{
        Button(action: {}) {
                Text(text)
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.body)
                    .padding()
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 4)
                )
            }
            .background(Color.white)
            .cornerRadius(25)
            .padding(.trailing,16)
    }
}
