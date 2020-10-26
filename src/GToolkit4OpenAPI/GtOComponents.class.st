Class {
	#name : #GtOComponents,
	#superclass : #GtOBase,
	#instVars : [
		'schemas',
		'responses',
		'parameters',
		'examples',
		'requestBodies',
		'headers'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #accessing }
GtOComponents >> examples: anArray [
	examples  := anArray collect: [:s | GtOExample new rawData: s]. 
]

{ #category : #accessing }
GtOComponents >> gtSchemasFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Schemas' translated;
		priority: 50;
		items: [ schemas associations sorted ];
		column: 'Key' text: [ :eachItem | eachItem key gtDisplayText ];
		column: 'Value' text: [ :eachItem | eachItem value gtDisplayText ];
		actionUpdateButtonTooltip: 'Update item list'
]

{ #category : #accessing }
GtOComponents >> headers: anArray [
	headers := anArray collect: [:s | GtOHeader new rawData: s]. 

]

{ #category : #accessing }
GtOComponents >> parameters: anObject [ 
]

{ #category : #accessing }
GtOComponents >> rawData: aDictionary [
	super rawData: aDictionary.
	self schemas: (rawData at:'schemas' ifAbsent: [Dictionary new]).
	self responses: (rawData at:'responses' ifAbsent: [Dictionary new]).
	self parameters: (rawData at:'parameters' ifAbsent: [Dictionary new]).
	self examples: (rawData at:'examples' ifAbsent: [Dictionary new]).
	self requestBodies: (rawData at:'requestBodies' ifAbsent: [Dictionary new]).
	self headers: (rawData at:'headers' ifAbsent: [Dictionary new]).
]

{ #category : #accessing }
GtOComponents >> requestBodies: anArray [
	requestBodies := anArray collect: [:s | GtORequestBody   new rawData: s]. 
]

{ #category : #accessing }
GtOComponents >> responses: anArray [
	responses := anArray collect: [:s | GtOResponse new rawData: s].
]

{ #category : #accessing }
GtOComponents >> schemas: aDictionary [
	| newDictionary |
	newDictionary := Dictionary new.
	aDictionary associationsDo:[:each |
		newDictionary at: each key put: 
			(GtOSchema new name: each key; rawData: (each value))].
	schemas := newDictionary.
]
