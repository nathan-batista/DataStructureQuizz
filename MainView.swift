//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 11/04/22.
//

import Foundation
import SwiftUI


struct MainView:View{
    var body:some View{
        TabView{
            ContentView().tabItem{
                Label("Structures",systemImage: "globe")
                
            }
            QuizzPageView().tabItem{
                Label("Quizz",systemImage: "globe")
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
