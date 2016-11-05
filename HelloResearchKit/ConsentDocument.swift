//
//  ConsentDocument.swift
//  HelloResearchKit
//
//  Created by tamurine on 2016/11/04.
//  Copyright © 2016年 toyama satoshi. All rights reserved.
//

import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "Example Content"
    
    let consentSectionTypes: [ORKConsentSectionType] = [
        .overview,
        .dataGathering,
        .privacy,
        .dataUse,
        .timeCommitment,
        .studySurvey,
        .studyTasks,
        .withdrawing
    ]
    
    let consentSections : [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.summary = "If you wish to complete this study"
        consentSection.content = "In this study you will be asked five ( wait, no, three!) questions. You will also have your voice recorded for ten seconds."
        return consentSection
    }
    consentDocument.sections = consentSections
    
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentPartcipantSignature"))
    
    return consentDocument
}
