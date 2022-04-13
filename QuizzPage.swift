//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 11/04/22.
//


import SwiftUI


struct QuizzView:View{
    var question:Question
    @State var isActive = false
    @ObservedObject var settings:GameSettings
    var body: some View{
        ZStack{
            Color.gray.opacity(0.09)
                .ignoresSafeArea()
            VStack{
                VStack(spacing:10){
                    Text("Score: \(settings.score)")
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
                                if settings.previousIndex != settings.index {
                                    settings.score += 1
                                }
                            }
                            settings.previousIndex = settings.index
                            settings.index = settings.index < (QuestionList.questions.count - 1) ? settings.index+1 : settings.index
                            isActive = settings.index < (QuestionList.questions.count - 1) ? true : false
                        },label: {
                            QuestionButton(option: question.option1)
                            }
                        )
                        Button(action: {
                            if QuestionList().verifyAnswerIsCorrect(question.option2,question.answer){
                                if settings.previousIndex != settings.index {
                                    settings.score += 1
                                }
                            }
                            settings.previousIndex = settings.index
                            settings.index = settings.index < (QuestionList.questions.count - 1) ? settings.index+1 : settings.index
                            isActive = settings.index < (QuestionList.questions.count - 1) ? true : false
                        },label: {
                            QuestionButton(option: question.option2)
                            }
                        )
                    
                    NavigationLink(destination: QuizzView(question: QuestionList.questions[settings.index], settings: settings), isActive: $isActive){}.navigationBarBackButtonHidden(true)
                }
                .padding(.bottom,30)
            }
        }.navigationTitle("Question \(settings.index+1)")
    }
}

struct QuizzPageView : View {
    var gameOption = GameSettings()
    var body: some View{
        NavigationView{
            QuizzView(question: QuestionList.questions.first!, settings: gameOption)
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


