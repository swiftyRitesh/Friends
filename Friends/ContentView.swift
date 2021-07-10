import SwiftUI

struct ContentView: View {
    
    @State var friends = [
        Friend(name: "Ritesh",
               icon: "paperplane.fill",
               school: "PHSS",
               slothImage: "sloth3",
               link: URL(string: "https://shorturl.at/stuA7")!,
               attack: 15,
               defence: 15,
               type: [.fire, .electric]),
        
        Friend(name: "Jia Chen",
               icon: "zzz",
               school: "Ngee Ann Poly",
               slothImage: "sloth2",
               link: URL(string: "https://shorturl.at/stuA7")!,
               attack: 10,
               defence: 15,
               type: [.grass, .electric]),
        
        Friend(name: "Mr 🔜",
               icon: "swift",
               school: "Tinkercademy",
               slothImage: "sloth1",
               link: URL(string: "https://shorturl.at/stuA7")!,
               attack: 5,
               defence: 5,
               type: [.water, .electric]),
        
        Friend(name: "Attendence Form",
               icon: "pencil",
               school: "Attendence Form Secondary School",
               slothImage: "attendenceForm",
               link: URL(string: "http://tk.sg/swift2021attendance")!,
               attack: 30,
               defence: 30,
               type: [.electric, .fire, .grass, .ice, .water])
    ]
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(friends) { friend in
                    let friendIndex = friends.firstIndex(of: friend)!
                    
                    NavigationLink(destination: FriendDetailView(friend: $friends[friendIndex])) {
                        Image(systemName: friend.icon)
                        
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .bold()
                            HStack {
                                Text(friend.school)
                                
                                Spacer()
                                
                                ForEach(friend.type, id: \.rawValue) { type in
                                    Image(systemName: type.getSymbolName())
                                }
                            }
                        }
                    }
                }
                .onDelete { offsets in
                    friends.remove(atOffsets: offsets)
                }
                .onMove { source, destination in
                    friends.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("Friends")
            .navigationBarItems(leading: EditButton()
                                    .font(.system(size: 25))
            )
            
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

