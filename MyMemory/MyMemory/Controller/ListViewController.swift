//
//  ListViewController.swift
//  MyMemory
//
//  Created by 윤병일 on 2021/03/23.
//

import UIKit

class ListViewController : UIViewController {
  
  //MARK: - Properties
  private let tableView = UITableView()
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavi()
    configureUI()
  }
  
  //MARK: - Functions
  private func setNavi() {
    navigationItem.title = "목록"
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
    navigationItem.rightBarButtonItem?.tintColor = .label
  }
  
  private func configureUI() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.tableFooterView = UIView()
    tableView.rowHeight = 80
    tableView.isUserInteractionEnabled = false
    tableView.register(MemoCell.self, forCellReuseIdentifier: MemoCell.identifier)
    tableView.register(MemoCellWithImage.self, forCellReuseIdentifier: MemoCellWithImage.identifier)
    view.addSubview(tableView)
    
    tableView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  //MARK: - objc func
  @objc func plusButtonClicked() {
    print("123")
  }
}

  //MARK: - UITableViewDataSource
extension ListViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MemoCell.identifier, for: indexPath) as! MemoCell
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: MemoCellWithImage.identifier, for: indexPath) as! MemoCellWithImage
      return cell
    }
  }
}
  //MARK: - UITableViewDelegate
extension ListViewController : UITableViewDelegate {
  
}
