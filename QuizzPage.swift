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
    @StateObject var settings:GameSettings
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
                        .padding()
                }
                Spacer()
                VStack(spacing:15){
                    ForEach(question.option, id: \.self ){ option in
                        QuestionButton(option: option, answer: question.answer, isActive: $isActive, settings: settings)
                    }
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
    var answer:String
    @Binding var isActive:Bool
    @StateObject var settings:GameSettings
    var body: some View{
        Button(action: {
            if QuestionList().verifyAnswerIsCorrect(option,answer){
                if settings.previousIndex != settings.index {
                    settings.score += 1
                }
            }
            settings.previousIndex = settings.index
            settings.index = settings.index < (QuestionList.questions.count - 1) ? settings.index+1 : settings.index
            isActive = settings.index < (QuestionList.questions.count - 1) ? true : false
        },label: {
            Text(option)
                .padding(10)
                .foregroundColor(Color.black)
                .background(Color.blue)
                .cornerRadius(10)
            }
        )
    }
}


