import Foundation
import SwiftUI


struct MainView:View{
    var gameSettings = GameSettings()
    @State private var selectedTab = 0
    init(){
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        appearance.backgroundColor = UIColor(named: "backgroundColor")
        appearance.inlineLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemTeal]
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    var body:some View{
        TabView(selection: $selectedTab){
            ContentView().tabItem{
                Image("DataStructure")
                    .resizable()
                    .scaledToFit()
                Text("Structures")
                    .layoutPriority(1)
            }.tag(0)
            QuizzPageView(gameOption: gameSettings).tabItem{
                Image("Quiz")
                    .resizable()
                    .scaledToFit()
                Text("Quiz")
                    .layoutPriority(1)
            }.tag(1)
            RankingView(settings: gameSettings).tabItem{
                Image("ranking")
                    .resizable()
                    .scaledToFit()
                Text("Ranking")
                    .layoutPriority(1)
            }.tag(2)
        }.id(selectedTab)
            .accentColor(Color.blue)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
