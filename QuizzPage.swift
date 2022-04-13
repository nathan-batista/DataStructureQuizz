//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 11/04/22.
//


import SwiftUI


struct QuizzView:View{
    var question:Question
    @State var score:Int? = 0
    @State var isActive = false
    var index:Int
    var buttonColor = Color.blue
    @State var nextQuestion = 0
    var body: some View{
        ZStack{
            Color.gray.opacity(0.09)
                .ignoresSafeArea()
            VStack{
                VStack(spacing:10){
                    Text("Score: \(score!)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Text(question.question)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top,20)
                }
                Spacer()
                VStack(spacing:15){
                        Button(action: {
                            if QuestionList().verifyAnswerIsCorrect(question.option1,question.answer){
                                if(nextQuestion != index || (index == 0 && nextQuestion == 0)) {
                                    self.score? += 1
                                }
                            }
                            self.nextQuestion = index < (QuestionList.questions.count - 1) ? index+1 : index
                            isActive = true
                        },label: {
                            QuestionButton(option: question.option1)
                            }
                        )
                        Button(action: {
                            if QuestionList().verifyAnswerIsCorrect(question.option2,question.answer){
                                if(nextQuestion != index || (index == 0 && nextQuestion == 0)) {
                                    self.score? += 1
                                }
                            }
                            self.nextQuestion = index < (QuestionList.questions.count - 1) ? index+1 : index
                            isActive = true
                        },label: {
                            QuestionButton(option: question.option2)
                            }
                        )
                    
                    NavigationLink(destination: QuizzView(question: QuestionList.questions[nextQuestion],score: score, index: nextQuestion), isActive: $isActive){}.navigationBarBackButtonHidden(true)
                }
                .padding(.bottom,30)
            }
        }.navigationTitle("Question \(self.index+1)")
    }
}

struct QuizzPageView : View {
    var body: some View{
        NavigationView{
            QuizzView(question: QuestionList.questions.first!, index: 0)
        }
    }
}

struct QuizzPageView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzPageView()
    }
}


struct QuestionButton:View{
    var option:String
    var body : some View {
        Text(option)
            .padding(10)
            .foregroundColor(Color.black)
            .background(Color.blue)
            .cornerRadius(10)
    }
}


