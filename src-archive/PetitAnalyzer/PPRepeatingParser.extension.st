Extension { #name : #PPRepeatingParser }

{ #category : #'*petitanalyzer-private' }
PPRepeatingParser >> followSets: aFollowDictionary firstSets: aFirstDictionary into: aSet [
	| firstSet |
	super followSets: aFollowDictionary firstSets:  aFirstDictionary into: aSet.
	
	firstSet := aFirstDictionary at: self.
	self children do: [:p | (aFollowDictionary at: p) addAll: (firstSet reject: [:each | each isNullable]) ]
]

{ #category : #'*petitanalyzer-testing' }
PPRepeatingParser >> isNullable [
	^ min = 0
]

{ #category : #'*petitanalyzer-matching' }
PPRepeatingParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self min = aParser min and: [ self max = aParser max ] ]
]
