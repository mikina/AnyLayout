import SwiftUI

struct ContentView: View {
    @State private var changeLayout = false
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
//        let layout = dynamicTypeSize <= .medium ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        let layout = changeLayout ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())

        layout {
            TextView()
            TextView()
        }

        VStack {
            Button("Toggle") {
                withAnimation {
                    changeLayout.toggle()
                }
            }
        }
        .padding()
    }
}

struct TextView: View {
    @State var counter = 0

    var body: some View {
        Text("Hello! Times: \(counter)")

        Button("+") {
            counter += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
