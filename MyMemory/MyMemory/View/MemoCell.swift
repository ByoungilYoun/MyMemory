//
//  MemoCell.swift
//  MyMemory
//
//  Created by 윤병일 on 2021/03/23.
//

import UIKit

class MemoCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "MemoCell"
  
  let titleLabel : UILabel = {
    let lb = UILabel()
    lb.font = UIFont.boldSystemFont(ofSize: 14)
    lb.textColor = .label
    lb.text = "글의 제목"
    return lb
  }()
  
  let subTitleLabel : UILabel = {
    let lb = UILabel()
    lb.font = UIFont.systemFont(ofSize: 12)
    lb.numberOfLines = 2
    lb.text = "서브 라벨 입니다."
    lb.textColor = .label
    lb.lineBreakMode = .byTruncatingTail // line break 속성 (마지막 라인의 뒷부분을 잘라내어 말줄임표로 처리)
    return lb
  }()
  
  let timeLabel : UILabel = {
    let lb = UILabel()
    lb.font = UIFont.systemFont(ofSize: 11)
    lb.textAlignment = .right
    lb.numberOfLines = 2
    lb.textColor = .label
    lb.text = "2020-12-15\n 20:01:01"
    lb.lineBreakMode = .byWordWrapping
    return lb
  }()
  
  //MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - configureUI()
  private func configureUI() {
    [titleLabel, subTitleLabel, timeLabel].forEach {
      contentView.addSubview($0)
    }
      
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(self.snp.top).offset(10)
      $0.leading.equalTo(self.snp.leading).offset(15)
    }
    
    subTitleLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.leading.equalTo(self.snp.leading).offset(15)
    }
    
    timeLabel.snp.makeConstraints {
      $0.top.equalTo(self.snp.top).offset(20)
      $0.trailing.equalTo(self.snp.trailing).offset(-20)
    }
  }
}
