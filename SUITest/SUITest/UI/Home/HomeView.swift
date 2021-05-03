//
//  HomeView.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/14/21.
//

import SwiftUI

struct HomeView: View {
    let viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.items) { item in
                NavigationLink(
                    destination: ItemListView(viewModel: ItemListViewModel(service: ItemListViewModelFactory.getItemListViewModelService(for: item),
                                                                           homeItem: item)),
                    label: {
                        NavigationButton(item: item)
                    })
            }
        }
        .navigationTitle("Select a section")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}

struct NavigationButton: View {
    let item: HomeItem
    
    var body: some View {
        Text(item.rawValue.capitalized)
            .frame(minWidth: 0, maxWidth: .infinity)
            .accentColor(.white)
            .frame(height: 40)
            .background(item.backgroundColor)
            .cornerRadius(20)
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 4)
    }
}
