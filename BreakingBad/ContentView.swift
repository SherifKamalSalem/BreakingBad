//
//  ContentView.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CharactersListView(viewModel: .init(charactersService: CharactersService(networkRequest: NativeRequestable(), environment: .production)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
