//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 19/04/22.
//

import Foundation
import SwiftUI

struct RankingCell:View{
    var score:Ranking
    var body: some View{
        HStack(spacing: 15){
            Text("You scored: \(score.score)/\(QuestionList.questions.count) points")
                .lineLimit(1)
                .layoutPriority(1)
            Image(getNameImageScore(score.score))
                .resizable()
                .scaledToFit()
        }
    }
    
    func getNameImageScore(_ score:Int) -> String{
        if score == 10 {
            return "5 star"
        }
        else if score >= 8 {
            return "4 star"
        } else if score >= 6 {
            return "3 star"
        } else if score >= 4 {
            return "2 star"
        } else if score >= 2 {
            return "1 star"
        } else {
            return "0 star"
        }
    }
    
}


struct RankingList : View{
    @StateObject var settings:GameSettings
    var body:some View{
        ZStack{
            if(!settings.ranking.isEmpty){
                List(settings.ranking.reversed(),id:\.id){ ranking in
                    RankingCell(score: ranking)
                }.background(Color.init(UIColor.systemGray6))
            } else {
                Text("You haven't played yet.")
                    .font(.body)
                    .foregroundColor(Color.secondary)
                    .padding([.leading,.trailing],30)
            }
        }.navigationTitle("Scores")
        
    }
    
}

struct RankingView:View{
    @StateObject var settings:GameSettings
    var body : some View {
        NavigationView{
            RankingList(settings: settings)
        }
    }
}
