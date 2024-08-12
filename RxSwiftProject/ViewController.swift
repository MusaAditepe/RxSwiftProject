//
//  ViewController.swift
//  RxSwiftProject
//
//  Created by Musa Adıtepe on 12.08.2024.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
   private let viewModel = ListViewModel()
   private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureTable()
    }

   fileprivate func configureTable(){
        //TODO: bind table
       viewModel.listItems.bind(to: table.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)){row,item, cell in
           cell.textLabel?.text = item.model
           cell.detailTextLabel?.text = item.brand
           
       }.disposed(by: disposeBag)
       
       // TODO: fetch items
       
       viewModel.fetchItems()
       
       // TODO: handle selection
       table.rx.modelSelected(ListModel.self).bind{
           selectedItems in
           print("Selected car is \(selectedItems.brand) \(selectedItems.model)")
       }.disposed(by: disposeBag)
       
    }
}

