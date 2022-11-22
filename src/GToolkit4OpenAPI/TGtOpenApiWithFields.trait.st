Trait {
	#name : #TGtOpenApiWithFields,
	#instVars : [
		'fields'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #'reflective operations' }
TGtOpenApiWithFields >> doesNotUnderstand: aMessage [
	| aSelector |
	aMessage numArgs > 1 ifTrue: [ ^ super doesNotUnderstand: aMessage ].

	aMessage numArgs isZero
		ifTrue: [ aSelector := aMessage selector.
			^ self fieldAt: aSelector ].

	aSelector := aMessage selector first: aMessage selector - 1.
	self fieldAt: aSelector put: aMessage arguments first
]

{ #category : #'accessing - fields' }
TGtOpenApiWithFields >> fieldAt: aName [
	^ self fieldAt: aName ifAbsent: [ nil ]
]

{ #category : #'accessing - fields' }
TGtOpenApiWithFields >> fieldAt: aName ifAbsent: anAbsentBlock [
	^ self fields at: aName ifAbsent: anAbsentBlock
]

{ #category : #'accessing - fields' }
TGtOpenApiWithFields >> fieldAt: aName ifAbsentPut: anAbsentBlock [
	^ self fields at: aName ifAbsentPut: anAbsentBlock
]

{ #category : #'accessing - fields' }
TGtOpenApiWithFields >> fieldAt: aName ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ self fields
		at: aName
		ifPresent: aPresentBlock
		ifAbsent: anAbsentBlock
]

{ #category : #'accessing - fields' }
TGtOpenApiWithFields >> fieldAt: aName ifPresent: aPresentBlock ifAbsentPut: anAbsentBlock [
	^ self fields
		at: aName
		ifPresent: aPresentBlock
		ifAbsentPut: anAbsentBlock
]

{ #category : #'accessing - fields' }
TGtOpenApiWithFields >> fieldAt: aName put: aValue [
	aValue
		ifNil: [ self fields removeKey: aName ifAbsent: [  "ignore" ].
			^ self ].
	self fields at: aName put: aValue
]

{ #category : #'accessing - fields' }
TGtOpenApiWithFields >> fields [
	^ fields ifNil: [ fields := OrderedDictionary new ]
]

{ #category : #'gt - extensions' }
TGtOpenApiWithFields >> gtFieldsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Fields';
		priority: 40;
		items: [ self fields associations ];
		column: 'Name' text: #key;
		column: 'Value' text: [ :anAssoc | anAssoc value gtOpenApiParameterViewText ];
		send: [ :anAssoc | anAssoc value ]
]

{ #category : #'accessing - fields' }
TGtOpenApiWithFields >> includesField: aName [
	^ self fields includesKey: aName
]
