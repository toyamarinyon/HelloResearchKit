//
//  SurveyTask.swift
//  HelloResearchKit
//
//  Created by tamurine on 2016/11/05.
//  Copyright © 2016年 toyama satoshi. All rights reserved.
//

import ResearchKit

public var SurveyTask : ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "The Questions Three"
    instructionStep.text = "Who would cross the Bridge of Death must answer me these questions three, ere the other side they see."
    steps += [instructionStep]
    
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 30)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "What is you name ?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    
    let questQuestionStepTitle = "What is your quest?"
    let textChoices = [
        ORKTextChoice(text: "Create a ResearchKit App", value: "0" as NSString),
        ORKTextChoice(text: "Seek the Holy Grail", value: "1" as NSString),
        ORKTextChoice(text: "Find a shrubbery", value: "2" as NSString)
    ]
    let questionAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questionAnswerFormat)
    steps += [questQuestionStep]
    
    let summaryStep = ORKCompletionStep(identifier: "SumaryStep")
    summaryStep.title = "Right. Off you go!"
    summaryStep.text = "That was easy!"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
