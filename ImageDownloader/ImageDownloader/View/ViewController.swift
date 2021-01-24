//
//  ViewController.swift
//  ImageDownloader
//
//  Created by Alex Bro on 22.01.2021.
//

import UIKit

protocol View: AnyObject {
    func refreshView()
}

final class ViewController: UIViewController {

    let viewModel: ViewModel
    private let tableView = UITableView()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        setupTableView()
        setupConstraints()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.registerReusableCell(TableViewCell.self)
    }

    private func setupConstraints() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(TableViewCell.self, for: indexPath),
        let url = viewModel.createURL(whithIndex: indexPath.row) else { fatalError() }
        viewModel.downloadImage(withURL: url, cell: cell)
        return cell
    }
}

//MARK: - Refresh view
extension ViewController: View {
    func refreshView() {
        tableView.reloadData()
    }
}

