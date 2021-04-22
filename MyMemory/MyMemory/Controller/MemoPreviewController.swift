//
//  MemoPreviewController.swift
//  MyMemory
//
//  Created by 윤병일 on 2021/03/24.
//

import UIKit

class MemoPreviewController : UIViewController {
  
  //MARK: - Properties
  let myTitle : UILabel = {
    let lb = UILabel()
    lb.text = "제목"
    lb.textColor = .black
    return lb
  }()
  
  let myContent : UILabel = {
    let lb = UILabel()
    lb.text = "내용"
    lb.textColor = .black
    return lb
  }()
  
  let myImageView : UIImageView = {
    let view = UIImageView()
    view.backgroundColor = .blue
    return view
  }()
  
  var data : MemoData?
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    setData()
  }
  
  //MARK: - configureUI()
  private func configureUI() {
    view.backgroundColor = .white
    [myTitle, myContent, myImageView].forEach {
      view.addSubview($0)
    }
    
    myTitle.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
      $0.leading.equalToSuperview().offset(20)
    }
    
    myContent.snp.makeConstraints {
      $0.top.equalTo(myTitle.snp.bottom).offset(10)
      $0.leading.equalToSuperview().offset(20)
    }
    
    myImageView.snp.makeConstraints {
      $0.top.equalTo(myContent.snp.bottom).offset(10)
      $0.leading.equalToSuperview().offset(20)
      $0.width.height.equalTo(200)
      
    }
  }
  
  func setData() {
    self.myTitle.text = data?.title
    self.myContent.text = data?.contents
    self.myImageView.image = data?.image
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd일 HH:mm분에 작성됨"
    let dateString = formatter.string(from: (data?.regdate)!)
    
    self.navigationItem.title = dateString
  }
}
