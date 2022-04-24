import SwiftUI

struct ContentView: View {
    var structures:[DataStructure] = DataStructureList.list
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
            NavigationView{
                ZStack{
                    Color("backgroundColor")
                    List(structures, id: \.id){ structure in
                        NavigationLink(destination: DataStructureDetail(structure: structure), label: {
                            DataStructureCell(structure: structure)
                        })
                            .listRowBackground(Color("backgroundColor"))
                    }.onAppear{
                        UITableView.appearance().backgroundColor = .clear
                    }
                }.navigationTitle("Data Structures")
                DataStructureDetail(structure: structures.first!)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(structures: DataStructureList.list)
    }
}
