import SwiftUI
import UIKit

struct QuizzView:View{
    @State var question:Question
    @State var endGame = false
    @StateObject var settings:GameSettings
    var body: some View{
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
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
                            .padding(.trailing,30)
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
                .foregroundColor(Color.white)
                .background(Color.init(red: Double(60)/Double(255), green: Double(124)/Double(255), blue: Double(109)/Double(255)))
                .cornerRadius(10)
            }
        )
    }
}



struct QuizzPageView : View {
    @StateObject var gameOption:GameSettings
    var body: some View{
        QuizzView(question: QuestionList.questions.first!,endGame: gameOption.index >= QuestionList.questions.count - 1 ? true : false,  settings: gameOption)
    }
}

struct QuizzPageView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzPageView(gameOption: GameSettings())
    }
}




