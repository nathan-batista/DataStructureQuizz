import Foundation
import SwiftUI

struct StartingView:View{
    @State var showApp = false
    var body: some View{
        if(showApp){
            MainView()
        } else {
            StoryTelling(showApp: $showApp)
        }
    }
}
