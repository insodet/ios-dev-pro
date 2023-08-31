//
//  FoodSсreen.swift
//  IOS Developer Pro
//
//  Created by Roman Sukhorukov on 31.08.2023.
//

import SwiftUI

struct Food: Identifiable {
    let name: String
    let id: UUID = .init()
}

final class FoodListViewModel: ObservableObject {
    @Published private(set) var foods = [
        Food(name: "🍗"),
        Food(name: "🍖"),
        Food(name: "🍪"),
        Food(name: "🍤"),
        Food(name: "🍕"),
        Food(name: "🍟")
    ]
}

struct FoodSсreen: View {
    
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var foodListVM: FoodListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(foodListVM.foods) { food in
                    NavigationLink(tag: food.id, selection: $router.listItem) {
                        VStack {
                            Text(food.name).font(.system(size: 200))
                        }
                    } label: {
                        HStack {
                            Text(food.name)
                        }
                    }
                }.listStyle(.plain)
            }
            .navigationTitle("Foods")
        }.navigationViewStyle(.stack)
        .onDisappear{
            router.revertToFoodSCreen()
        }
    }
}

struct FoodSсreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodSсreen()
            .environmentObject(Router())
            .environmentObject(FoodListViewModel())
    }
}
