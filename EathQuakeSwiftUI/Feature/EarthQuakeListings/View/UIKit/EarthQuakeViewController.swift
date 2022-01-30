//
//  EarthQuakeViewController.swift
//  EarthQuakeSwiftUI
//
//  Created by Rupika Sompalli on 2022-01-29.
//

import UIKit
import Combine

class EarthQuakeViewController: UIViewController {
    
    lazy var earthQuakeListView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: EartQuakeCell.Identifier, bundle: .main), forCellReuseIdentifier: EartQuakeCell.Identifier)
        return tableView
    }()
    
    private let viewModel: EarthQuakeViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: EarthQuakeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        bindView()
        fetchData()
    }
    
    private func createView() {
        self.view = earthQuakeListView
        navigationItem.title = L10n.EarthQuakeList.title
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(settingsClicked))
    }
    
    private func fetchData() {
        viewModel.fetchData()
    }
    
    private func bindView() {
        viewModel
            .$earthQuakesData
            .sink { [weak self] _ in
                self?.refreshView()
            }
        .store(in: &cancellables)
        
        viewModel
            .$filterType
            .sink { [weak self] _ in
                self?.refreshView()
            }
        .store(in: &cancellables)
    }
    
    private func refreshView() {
        DispatchQueue.main.async {
            self.earthQuakeListView.reloadData()
        }
    }
    
    @objc func settingsClicked() {
        navigationController?.pushViewController(AppEnvironment.current.makeFilterListView(), animated: true)
    }
}

extension EarthQuakeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.earthQuakesData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let carCell = tableView.dequeueReusableCell(withIdentifier: EartQuakeCell.Identifier, for: indexPath) as? EartQuakeCell
        guard let carCell = carCell,
              let car = viewModel.earthQuakesData?[indexPath.row] else {
            return UITableViewCell()
        }
        carCell.showData(data: car)
        return carCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let filterType = viewModel.filterType {
            let headerView = UIView(frame: .init(x: 20, y: 0, width: tableView.frame.size.width, height: 20))
            let label = UILabel(frame: headerView.frame)
            label.text = filterType.rawValue
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            headerView.addSubview(label)
            headerView.backgroundColor = .darkGray
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let filterType = viewModel.filterType {
            return 20
        }
        return 0
    }
}
