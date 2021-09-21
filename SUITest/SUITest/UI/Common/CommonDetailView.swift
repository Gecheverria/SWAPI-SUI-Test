//
//  CommonDetail.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 20/9/21.
//

import SwiftUI

// For People detail, create a sheet-like view
// For Planets detail, create an horizontal carousel

struct CommonDetailView: View {
    let homeItemType: HomeItem
    let item: ListItemDisplayable
    
    @ViewBuilder
    var body: some View {
        switch homeItemType {
        case .people:
            DualDetail(item: DualDetailDisplayable(title: item.displayItem.mainTitle, description: item.displayItem.subTitle ?? ""))
        default:
            Text("WIP")
        }
    }
}

struct CommonDetail_Previews: PreviewProvider {
    static var previews: some View {
        let item = People(name: "Test", height: "", mass: "", hairColor: "", skinColor: "", eyeColor: "", birthYear: "", gender: "", url: "")
        return CommonDetailView(homeItemType: .people, item: ListItemDisplayable(displayItem: item))
    }
}
