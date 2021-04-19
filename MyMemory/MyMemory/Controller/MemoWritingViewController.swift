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
  
  var subject : String! // 메모 제목
  
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

    let saveButton = UIBarButtonItem(title: "저장", style:.plain, target: self, action: #selector(save))
    let cameraButton = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(pick))
    navigationItem.rightBarButtonItems = [cameraButton, saveButton]
   
      }
  
  //MARK: - configureUI()
  private func configureUI() {
    
    textView.delegate = self
    
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

  //MARK: - @objc func
  @objc func save() {
    print("안녕")
  }
  
  @objc func pick() {
    let picker = UIImagePickerController()
    picker.delegate = self
    picker.allowsEditing = true // 이미지 피커 컨트롤러의 편집창 속성, true 일때만 나타난다.
    self.present(picker, animated: true, completion: nil)
  }
}

  //MARK: - extension UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension MemoWritingViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    // 이미지가 선택되었을때 호출되는 델리게이트 메서드
    self.myImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
    picker.dismiss(animated: true, completion: nil)
  }
}

  //MARK: -  extension UITextViewDelegate
extension MemoWritingViewController : UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    // 내용의 최대 15자리까지 읽어 subject 변수에 저장한다.
    let contents = textView.text as NSString // 텍스트 뷰의 내용을 읽어 NSString 타입의 변수에 저장한다.
    let length = ((contents.length > 15)) ? 15 : contents.length // 읽어온 내용이 15자리보다 길 경우 15 자리 까지만, 그보다 짧을 경우 글 전체 내용을 가져온다.
    self.subject = contents.substring(with: NSRange(location: 0, length: length)) // 최대 15자리까지의 내용을 subject 변수에 저장한다.
    self.navigationItem.title = subject // 이렇게 뽑아낸 제목을 내비게이션 타이틀에 표시한다. 
  }
}
