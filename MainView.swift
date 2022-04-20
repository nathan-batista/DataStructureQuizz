//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 11/04/22.
//

import Foundation
import SwiftUI


struct MainView:View{
    var gameSettings = GameSettings()
    var body:some View{
        TabView{
            ContentView().tabItem{
                Image("DataStructure")
                Text("Structures")
                }
            
            QuizzPageView(gameOption: gameSettings).tabItem{
                Image("Quiz")
                Text("Quiz")
            }
            RankingView(settings: gameSettings).tabItem{
                Image("ranking")
                Text("Ranking")
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
