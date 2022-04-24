import Foundation
import SwiftUI


struct MainView:View{
    var gameSettings = GameSettings()
    @State private var selectedTab = 0
    var body:some View{
        TabView(selection: $selectedTab){
            ContentView().tabItem{
                Image("DataStructure")
                Text("Structures")
            }.tag(0)
            QuizzPageView(gameOption: gameSettings).tabItem{
                Image("Quiz")
                Text("Quiz")
            }.tag(1)
            RankingView(settings: gameSettings).tabItem{
                Image("ranking")
                Text("Ranking")
            }.tag(2)
        }.id(selectedTab)
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(named: "backgroundColor")
                UITabBar.appearance().standardAppearance = appearance
              UITabBar.appearance().scrollEdgeAppearance = appearance
            }.accentColor(Color(uiColor: UIColor.blue))
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
