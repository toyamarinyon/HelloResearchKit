//
//  WalkTask.swift
//  HelloResearchKit
//
//  Created by tamurine on 2016/11/05.
//  Copyright © 2016年 toyama satoshi. All rights reserved.
//

import ResearchKit

public var WalkTask : ORKOrderedTask {
    return ORKOrderedTask.fitnessCheck(withIdentifier: "WalkTask", intendedUseDescription: nil, walkDuration: 15, restDuration: 15, options: [])
}
