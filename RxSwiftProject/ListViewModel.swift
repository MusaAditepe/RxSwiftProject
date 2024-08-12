//
//  ListViewModel.swift
//  RxSwiftProject
//
//  Created by Musa Adıtepe on 12.08.2024.
//

import Foundation
import RxSwift
import RxCocoa

class ListViewModel {
    var listItems = PublishSubject<[ListModel]>()
    
    func fetchItems(){
        let items = [ListModel(model:"ModelS", brand: "Tesla"),
                     ListModel(model:"M6", brand: "BMW"),
                     ListModel(model:"i20", brand: "Hyundai"),
                     ListModel(model:"Kuga", brand: "Ford"),
            ]
        listItems.onNext(items)
    }
}
