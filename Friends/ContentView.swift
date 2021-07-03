import SwiftUI

struct ContentView: View {
    
    @State var friends = [
        Friend(name: "Ritesh",
               icon: "paperplane.fill",
               school: "PHSS",
               slothImage: "sloth3",
               link: URL(string: "https://shorturl.at/stuA7")!),
        
        Friend(name: "Jia Chen",
               icon: "zzz",
               school: "Ngee Ann Poly",
               slothImage: "sloth2",
               link: URL(string: "https://shorturl.at/stuA7")!),
        
        Friend(name: "Mr 🔜",
               icon: "swift",
               school: "Tinkercademy",
               slothImage: "sloth1",
               link: URL(string: "https://shorturl.at/stuA7")!),
        
        Friend(name: "Attendence Form",
               icon: "pencil",
               school: "Attendence Form Secondary Schools",
               slothImage: "attendenceForm",
               link: URL(string: "http://tk.sg/swift2021attendance")!)
    ]
    
    var body: some View {
        NavigationView {
            List(0..<friends.count) { index in
                NavigationLink(destination: FriendDetailView(friend: $friends[index])) {
                    Image(systemName: friends[index].icon)
                    
                    VStack(alignment: .leading) {
                        Text(friends[index].name)
                            .bold()
                        Text(friends[index].school)
                    }
                }
            }
            .navigationTitle("Friends")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
