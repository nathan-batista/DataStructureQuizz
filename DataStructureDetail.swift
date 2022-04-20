//
//  File.swift
//  WWDC22Project
//
//  Created by Nathan Batista de Oliveira on 11/04/22.
//

import SwiftUI

struct DataStructureDetail:View{
    var structure:DataStructure
    var body: some View {
            VStack(spacing:10){
                Image(structure.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/3, alignment: .center)
                    .padding(.top,UIScreen.main.bounds.height*0.1)
                    .foregroundColor(.accentColor)
                Text(structure.description)
                    .font(.body)
                    .padding([.leading,.trailing],10)
                Spacer()
            }.navigationTitle(structure.name)
    }
}

struct DataStructureDetail_Previews: PreviewProvider {
    static var previews: some View {
        DataStructureDetail(structure: DataStructureList.list.first!)
    }
}

