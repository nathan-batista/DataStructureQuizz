//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 11/04/22.
//


import SwiftUI


struct QuizzView:View{
    @State var question:Question
    @State var endGame = false
    @State var isActive = false
    @ObservedObject var settings:GameSettings
    var body: some View{
        ZStack{
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
                        QuestionButton(option: option, answer: question.answer, question: $question, isActive: $isActive, endGame: $endGame, settings: settings)
                    }
                
                    NavigationLink(destination:Congratulations(settings: settings),isActive:$endGame){
                    }
                    .navigationBarBackButtonHidden(true)
                }
                .padding(.bottom,30)
            }
        }.navigationTitle("Question \(settings.index+1)")
    }
}

struct QuizzPageView : View {
    @StateObject var gameOption:GameSettings
    var body: some View{
        NavigationView{
            QuizzView(question: QuestionList.questions.first!, settings: gameOption)
        }
    }
}

struct QuizzPageView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzPageView(gameOption: GameSettings())
    }
}

struct QuestionButton:View{
    var option:String
    var answer:String
    @Binding var question:Question
    @Binding var isActive:Bool
    @Binding var endGame:Bool
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
            question = QuestionList.questions[settings.index]
            if(settings.index == (QuestionList.questions.count - 1)){
                settings.ranking.append(Ranking(score: settings.score))
                endGame = true
            }
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


