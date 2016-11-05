//
//  ConsentTask.swift
//  HelloResearchKit
//
//  Created by tamurine on 2016/11/05.
//  Copyright © 2016年 toyama satoshi. All rights reserved.
//

import ResearchKit

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier : "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    let signature = consentDocument.signatures!.first as ORKConsentSignature!
    
    
    let reviewConsentStep = ORKConsentReviewStep(identifier : "ConsentReviewStep", signature: signature, in: consentDocument)
    reviewConsentStep.text = "Review consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]
    
    
    return ORKOrderedTask(identifier : "ConsentTask", steps: steps)
}
