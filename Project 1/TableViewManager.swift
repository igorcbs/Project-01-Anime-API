//
//  TableViewManager.swift
//  Project 1
//
//  Created by Igor de Castro on 03/06/25.
//

import UIKit

final class TableViewManager: NSObject {
    private var items: [SearchedModel] = []
    
    func configureDelegates(with tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewComponentCell.self, forCellReuseIdentifier: "TableViewComponentCell")
    }
    
    func getItems(_ cells: [SearchedModel]) {
        items = cells
    }
}

extension TableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.isEmpty {
            return 1
        }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewComponentCell", for: indexPath) as! TableViewComponentCell
        if !items.isEmpty {
            cell.setTitleLabel(items[0].title)
        }

        return cell
    }
}

extension TableViewManager: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}
