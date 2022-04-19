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
            HStack{
                Text("You scored: \(score.score)/\(QuestionList.questions.count) points")
            }
    }
}


struct RankingList : View{
    @StateObject var settings:GameSettings
    var body:some View{
        List(settings.ranking,id:\.id){ ranking in
            RankingCell(score: ranking)
        }
    }
}
