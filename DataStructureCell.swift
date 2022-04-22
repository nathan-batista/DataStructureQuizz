
import SwiftUI

struct DataStructureCell:View{
    var structure:DataStructure
    var body: some View {
        HStack(spacing:15){
            Image(structure.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth:50)
                .foregroundColor(.accentColor)
            Text(structure.name)
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

struct DataStructureCell_Previews: PreviewProvider {
    static var previews: some View {
        DataStructureCell(structure: DataStructureList.list.first!)
    }
}

