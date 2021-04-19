//
//  MemoData.swift
//  MyMemory
//
//  Created by 윤병일 on 2021/03/27.
//

import UIKit

struct MemoData {
  var memoIdx : Int? // 데이터 식별값
  var title : String? // 메모 제목
  var contents : String? // 메모 내용
  var image : UIImage? // 이미지
  var regdate : Date? // 작성일
}
