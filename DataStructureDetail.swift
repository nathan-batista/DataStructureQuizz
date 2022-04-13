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
                Image(systemName: structure.image)
                    .scaledToFit()
                    .frame(minWidth: 50, idealWidth: 150, maxWidth: 200)
                    .foregroundColor(.accentColor)
                Text(structure.description)
                    .font(.body)
                    .padding()
            }.navigationTitle(structure.name)
    }
}

struct DataStructureDetail_Previews: PreviewProvider {
    static var previews: some View {
        DataStructureDetail(structure: DataStructureList.list.first!)
    }
}
