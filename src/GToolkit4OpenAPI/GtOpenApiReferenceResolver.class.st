Class {
	#name : #GtOpenApiReferenceResolver,
	#superclass : #Object,
	#traits : 'TGtOpenApiObjectVisitor',
	#classTraits : 'TGtOpenApiObjectVisitor classTrait',
	#instVars : [
		'rootObject',
		'stack'
	],
	#category : #'GToolkit4OpenAPI-New-Parser'
}

{ #category : #'private - resolving' }
GtOpenApiReferenceResolver >> nextFragmentObject: aJsonApiObject [
	| aFragment |
	stack ifEmpty: [ ^ self ].
	aFragment := stack pop asSymbol.

	(aJsonApiObject respondsTo: aFragment)
		ifTrue: [ ^ aJsonApiObject perform: aFragment ].
	^ nil
]

{ #category : #resolving }
GtOpenApiReferenceResolver >> resolve [
	self rootObject ifNil: [ ^ self ].
	self rootObject isOpenApi ifFalse: [ ^ self ].

	self rootObject objectsDo: [ :eachObject | self resolveObject: eachObject ]
]

{ #category : #resolving }
GtOpenApiReferenceResolver >> resolveObject: anOpenApiObject [
	| aFragmentObject |
	anOpenApiObject isReference ifFalse: [ ^ self ].

	anOpenApiObject isDocumentReference ifFalse: [ ^ self ].
	stack := Stack withAll: anOpenApiObject fragments.
	aFragmentObject := self rootObject.
	[ stack isEmpty ]
		whileFalse: [ aFragmentObject := aFragmentObject accept: self.
			aFragmentObject ifNil: [ ^ self ] ].

	anOpenApiObject object: aFragmentObject
]

{ #category : #accessing }
GtOpenApiReferenceResolver >> rootObject [

	^ rootObject
]

{ #category : #accessing }
GtOpenApiReferenceResolver >> rootObject: anObject [

	rootObject := anObject
]

{ #category : #visiting }
GtOpenApiReferenceResolver >> visitGtOpenApi: aJsonApiObject [
	^ self nextFragmentObject: aJsonApiObject
]

{ #category : #visiting }
GtOpenApiReferenceResolver >> visitGtOpenApiComponents: aJsonApiObject [
	| aFragment aDictionary |
	aDictionary := self nextFragmentObject: aJsonApiObject.
	aDictionary ifNil: [ ^ nil ].

	stack ifEmpty: [ ^ nil ].
	aFragment := stack pop asString.

	^ aDictionary at: aFragment ifAbsent: [ nil ]
]
