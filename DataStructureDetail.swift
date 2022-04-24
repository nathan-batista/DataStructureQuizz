
import SwiftUI

struct DataStructureDetail:View{
    var structure:DataStructure
    init(structure structure1:DataStructure){
        UINavigationBar.appearance().backgroundColor = UIColor(named: "backgroundColor")
        self.structure = structure1
    }
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
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
            }
        }.navigationBarTitle(structure.name)
    }
}

struct DataStructureDetail_Previews: PreviewProvider {
    static var previews: some View {
        DataStructureDetail(structure: DataStructureList.list.first!)
    }
}


