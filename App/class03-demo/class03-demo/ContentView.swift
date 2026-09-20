//
//  ContentView.swift
//  class03-demo
//
//  Created by Silvia Zhou on 9/18/26.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    var body: some View {
        VStack {
            Text("clicked! \(count)")
                .font(Font.largeTitle.bold())
            Spacer()
            Image(systemName: count <= 0 ? "person.fill":"apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            HStack {
                Button("+") {
                    count += 1
                    print("Up count\(count)")
                }
                .buttonStyle(.bordered)
                .font(.system(size: 60))
                Button("-") {
                    count -= 1
                    print("Down count\(count)")
                }
                .buttonStyle(.bordered)
                .font(.system(size: 60))
            }
        }
    }
}

#Preview {
    ContentView()
}
