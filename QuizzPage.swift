//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 11/04/22.
//


import SwiftUI
import UIKit

struct QuizzView:View{
    @State var question:Question
    @State var endGame = false
    @StateObject var settings:GameSettings
    var body: some View{
        ZStack{
            Color.init(UIColor.systemGray6)
            if !endGame {
                VStack{
                    Text("Question \(settings.index + 1)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top,20)
                    VStack(spacing:10){
                        Text("Score: \(settings.score)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing,20)
                        Text(question.question)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                    VStack(spacing:15){
                        ForEach(question.option.shuffled(), id: \.self ){ option in
                            QuestionButton(option: option, answer: question.answer, question: $question, endGame: $endGame, settings: settings)
                        }
                    }
                    .padding(.bottom,30)
                }
            } else {
                Congratulations($endGame,settings)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            }
        }
    }
}

struct QuizzPageView : View {
    @StateObject var gameOption:GameSettings
    var body: some View{
            QuizzView(question: QuestionList.questions.first!, settings: gameOption)
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
            settings.index += 1
            if(settings.index == (QuestionList.questions.count)){
                settings.ranking.append(Ranking(score: settings.score))
                endGame = true
            } else {
                question = QuestionList.questions[settings.index]
                
            }
        },label: {
            Text(option)
                .frame(width : UIScreen.main.bounds.width)
                .padding(10)
                .foregroundColor(Color.black)
                .background(Color.blue)
                .cornerRadius(10)
            }
        )
    }
}


