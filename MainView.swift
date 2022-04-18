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
                Label{Text("Structures")}
            icon: {Image("DataStructure")
                .resizable()
                .scaledToFit()
            }
            }
            QuizzPageView().tabItem{
                Label{Text("Quiz")}
                    icon: {Image("Quiz")
                            .resizable()
                            .scaledToFit()
                    }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
