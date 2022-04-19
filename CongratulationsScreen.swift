//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 19/04/22.
//

import Foundation
import SwiftUI

struct Congratulations:View{
    @StateObject var settings:GameSettings
    var body : some View {
        VStack{
            Image("party")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: .center)
            Text("Congratulations!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Text("You scored: \(settings.score) points")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            Button(action: {
                
            }, label: {
                
            } )
        }.navigationBarBackButtonHidden(true)
    }
}


struct Congratulations_Previews: PreviewProvider {
    static var previews: some View {
        Congratulations(settings:  GameSettings() )
    }
}
