//
//  PeopleDetail.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 6/6/21.
//

import SwiftUI

struct PeopleDetail: View {
    @ObservedObject var viewModel: PeopleDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.system(.largeTitle))
                HStack {
                    ForEach(viewModel.mainDetails) { detail in
                        DualDetail(item: detail)
                    }
                }
                ForEach(viewModel.extraDetails) { detail in
                    DualDetail(item: detail, axis: .horizontal)
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        .onAppear {
            viewModel.fetchContent.accept(())
        }
    }
}

#if DEBUG
import Combine

struct PeopleDetail_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetail(viewModel: PeopleDetailViewModel(service: PeopleServiceMock()))
    }
}

struct PeopleServiceMock: PeopleServiceType {
    func getPeopleDetail(id: String) -> AnyPublisher<People, Error> {
        let people = People(name: "Jade", height: "123", mass: "some", hairColor: "blonde", skinColor: "Complex", eyeColor: "blue", birthYear: "1299D", gender: "F", url: "")
        
        return Just(people).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
#endif
