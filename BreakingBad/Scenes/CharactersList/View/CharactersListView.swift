//
//  CharactersListView.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 27/08/2022.
//

import SwiftUI

struct CharactersListView: View {
    @ObservedObject var viewModel: CharactersListViewModel
    
    init(viewModel: CharactersListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            progressView
        default:
            listView
        }
    }
}

private extension CharactersListView {
    
    var listView: some View {
        NavigationView {
            if viewModel.dataSource.isEmpty {
                emptyResultView
            } else {
                VStack {
                    SearchBar(viewModel: viewModel).padding(.horizontal, 32)
                    List(!viewModel.searchKey.isEmpty
                         ? viewModel.searchResultDataSource
                         : viewModel.dataSource, id: \.self) { character in
                        NavigationLink(destination: CharacterDetailsView(viewModel: character)) {
                            CharacterRowCardView(item: character)
                        }
                    }
                         .listStyle(.insetGrouped)
                }
                .navigationBarTitle("Breaking Bad")
            }
        }
    }
    
    var emptyResultView: some View {
        NavigationView {
            AnyView(Text("No results")
                .font(.largeTitle)
                .foregroundColor(.gray))
        }
        .navigationBarTitle("Breaking Bad")
    }
    
    var progressView: some View {
        ProgressView()
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView(viewModel: CharactersListViewModel(charactersService: CharactersService(networkRequest: NativeRequestable(), environment: .production)))
    }
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
