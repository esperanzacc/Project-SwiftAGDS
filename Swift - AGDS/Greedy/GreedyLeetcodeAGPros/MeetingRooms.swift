//
//  MeetingRoom.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-20.
//

import Foundation

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
  let sortArr = intervals.sorted { $0[0] < $1[0] }
  print(sortArr)
  
  var firstEnd = sortArr[0][1]
  
  for i in 1..<sortArr.count {
    if sortArr[i][0] >= firstEnd {
      firstEnd = sortArr[i][1]
      print(firstEnd)
    } else {
      return false
    }
  }
  return true
}
