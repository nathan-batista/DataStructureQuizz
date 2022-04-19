//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 19/04/22.
//

import Foundation
import SwiftUI

struct Congratulations:View{
    @Environment(\.presentationMode) var presentationMode
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
                settings.index = 0
                settings.score = 0
                settings.previousIndex = -1
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Play Again")
                    .padding(10)
                    .foregroundColor(Color.black)
                    .background(Color.blue)
                    .cornerRadius(10)
            } )
        }.navigationBarBackButtonHidden(true)
    }
}


struct Congratulations_Previews: PreviewProvider {
    static var previews: some View {
        Congratulations(settings:  GameSettings() )
    }
}
