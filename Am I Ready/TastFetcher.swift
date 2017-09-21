//
//  TastFetcher.swift
//  Am I Ready
//
//  Created by Jamie Le Souef on 20/9/17.
//  Copyright © 2017 Jamie Le Souef. All rights reserved.
//

import Foundation

protocol TaskFetcher {
  func getTasks() -> [Task]
}

class Fetcher: TaskFetcher {
  func getTasks() -> [Task] {
    return [
      Task(title: "Brush teah", complete: false),
      Task(title: "Pack scool bag", complete: false),
      Task(title: "Check Rats", complete: false)
    ]
  }
}

