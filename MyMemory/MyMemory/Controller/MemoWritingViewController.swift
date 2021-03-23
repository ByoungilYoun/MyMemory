//
//  MemoWritingViewController.swift
//  MyMemory
//
//  Created by 윤병일 on 2021/03/24.
//

import UIKit

class MemoWritingViewController : UIViewController {
  
  //MARK: - Properties
  private let textView : UITextView = {
    let view = UITextView()
    view.backgroundColor = .lightGray
    view.autocapitalizationType = .sentences
    view.autocorrectionType = .no
    view.smartDashesType = .default
    view.smartInsertDeleteType = .default
    view.spellCheckingType = .no
    view.keyboardType = .default
    view.keyboardAppearance = .dark
    view.returnKeyType = .default
    return view
  }()
  
  private let myImageView : UIImageView = {
    let view = UIImageView()
    view.backgroundColor = .red
    return view
  }()
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavi()
    configureUI()
  }
  
  //MARK: - setNavi()
  private func setNavi() {
    view.backgroundColor = .white
    navigationItem.title = "메모 작성"
    navigationController?.navigationBar.tintColor = .label

    let saveButton = UIBarButtonItem()
    saveButton.title = "저장"
    saveButton.tintColor = .label
    
    let cameraButton = UIBarButtonItem(systemItem: .camera)
    cameraButton.tintColor = .label
    
    navigationItem.rightBarButtonItems = [cameraButton, saveButton]
    
      }
  
  //MARK: - configureUI()
  private func configureUI() {
    [textView, myImageView].forEach {
      view.addSubview($0)
    }
    
    textView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
      $0.leading.equalToSuperview().offset(10)
      $0.trailing.equalToSuperview().offset(-10)
      $0.height.equalTo(300)
    }
    
    myImageView.snp.makeConstraints {
      $0.top.equalTo(textView.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(10)
      $0.width.height.equalTo(250)
    }
  }
}
