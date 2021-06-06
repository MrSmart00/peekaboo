//
//  ContentView.swift
//  peekaboo
//
//  Created by 日野森寛也 on 2021/06/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, world!")
                .font(.title)
                .fontWeight(.bold)
            Text(Secret.id)
            Text(Secret.key)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
