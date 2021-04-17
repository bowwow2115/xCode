import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onEnded { _ in
                print("Gesture Ended")
            }
        return Image(systemName: "hand.point.right.fill")
            .resizable()
            .font(.largeTitle)
            .gesture(magnificationGesture)
            .frame(width: 100, height: 90)
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
