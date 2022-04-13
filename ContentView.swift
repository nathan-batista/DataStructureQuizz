import SwiftUI

struct ContentView: View {
    var structures:[DataStructure] = DataStructureList.list
    var body: some View {
        NavigationView{
            List(structures, id: \.id){ structure in
                NavigationLink(destination: DataStructureDetail(structure: structure), label: {
                    DataStructureCell(structure: structure)
                })
            }.navigationTitle("Data Structures")
        }.background(Color.gray.opacity(0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(structures: DataStructureList.list)
    }
}
