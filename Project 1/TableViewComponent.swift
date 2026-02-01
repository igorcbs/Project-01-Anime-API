//
//  TableViewComponent.swift
//  Project 1
//
//  Created by Igor de Castro on 14/05/25.
//
import UIKit

final class TableViewComponent: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableViewManager.configureDelegates(with: tableView)
        return tableView
    }()
    var tableViewManager = TableViewManager()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getContentSearched(_ content: [SearchedModel]) {
        DispatchQueue.main.async {
            self.tableViewManager.getItems(content)
            self.isHidden = false
            self.tableView.reloadData()
        }
    }
}

extension TableViewComponent: ViewCode {
    func addViews() {
        addSubview(tableView)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func render() { // not implemented
    }
}
