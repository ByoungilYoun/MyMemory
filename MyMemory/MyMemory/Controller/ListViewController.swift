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
  
  // 앱 델리게이트 객체의 참조 정보를 가져온다.
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavi()
    configureUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }
  //MARK: - Functions
  private func setNavi() {
    navigationItem.title = "목록"
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
    navigationItem.rightBarButtonItem?.tintColor = .label
  }
  
  private func configureUI() {
    tableView.backgroundColor = .white
    tableView.dataSource = self
    tableView.delegate = self
    tableView.tableFooterView = UIView()
    tableView.rowHeight = 80
    tableView.register(MemoCell.self, forCellReuseIdentifier: MemoCell.identifier)
    tableView.register(MemoCellWithImage.self, forCellReuseIdentifier: MemoCellWithImage.identifier)
    view.addSubview(tableView)
    
    tableView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  //MARK: - objc func
  @objc func plusButtonClicked() {
    let controller = MemoWritingViewController()
    navigationController?.pushViewController(controller, animated: true)
  }
}

  //MARK: - UITableViewDataSource
extension ListViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let count = self.appDelegate.memoList.count
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // memolist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼낸다.
    let row = self.appDelegate.memoList[indexPath.row]
    
    if row.image == nil {
      let cell = tableView.dequeueReusableCell(withIdentifier: MemoCell.identifier) as! MemoCell
      cell.titleLabel.text = row.title
      cell.subTitleLabel.text = row.contents
    
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      cell.timeLabel.text = formatter.string(from: row.regdate!)
      
      return cell

    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: MemoCellWithImage.identifier) as! MemoCellWithImage
      cell.titleLabel.text = row.title
      cell.subTitleLabel.text = row.contents
      cell.myImageView.image = row.image
      
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      cell.timeLabel.text = formatter.string(from: row.regdate!)
      
      return cell
    }
  }
}
  //MARK: - UITableViewDelegate
extension ListViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // memolist 배열에서 선택된 행에 맞는 데이터를 꺼낸다.
    let row = self.appDelegate.memoList[indexPath.row]
    
    let controller = MemoPreviewController()
    controller.data = row
    navigationController?.pushViewController(controller, animated: true)
  }
}
