
import SwiftUI

struct ContentView: View {
    
    @State var orientation = UIDevice.current.orientation
    @State var baza: System = System()

    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()

    var body: some View {
        Group {
            if orientation.isLandscape{
                KartaView(baza: baza)
//                    .onAppear{
//                        if baza.systemLoaded == false{
//                        start(baza: &baza)
//                        }
//                        else{
//                            print("baza juz wczytana")
//                        }
//                    }
            } else {
                MenuView(baza: baza)
            }
        }.onReceive(orientationChanged) { _ in
            self.orientation = UIDevice.current.orientation
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
