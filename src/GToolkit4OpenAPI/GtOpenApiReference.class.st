Class {
	#name : #GtOpenApiReference,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'ref',
		'object'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiReference >> accept: aVisitor [
	^ aVisitor visitGtOpenApiReference: self
]

{ #category : #accessing }
GtOpenApiReference >> fragments [
	^ ($/ split: self ref) allButFirst
]

{ #category : #printing }
GtOpenApiReference >> gtDisplayOn: aStream [
	| aName |
	self ref
		ifNil: [ super gtDisplayOn: aStream.
			^ self ].

	(self object isNotNil and: [ self object name isNotNil ])
		ifTrue: [ aName := self object name asString ]
		ifFalse: [ aName := self ref asString ].

	aStream
		nextPutAll: 'Reference to ';
		nextPutAll: aName
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtPropertiesViewChildren [
	^ self object ifNil: [ #() ] ifNotNil: [ self object gtPropertiesViewChildren ]
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtPropertiesViewTypeText [
	^ (self object isNotNil and: [ self object name isNotNil ])
		ifTrue: [ self object name ]
		ifFalse: [ self ref ifNil: [ 'reference' ] ]
]

{ #category : #testing }
GtOpenApiReference >> isDocumentReference [
	^ self ref beginsWith: '#/'
]

{ #category : #testing }
GtOpenApiReference >> isReference [
	^ true
]

{ #category : #accessing }
GtOpenApiReference >> object [

	^ object
]

{ #category : #accessing }
GtOpenApiReference >> object: anObject [

	object := anObject
]

{ #category : #enumerating }
GtOpenApiReference >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	"do nothing"
]

{ #category : #printing }
GtOpenApiReference >> printOn: aStream [
	super printOn: aStream.
	self ref ifNil: [ ^ self ].

	aStream
		nextPut: $(;
		nextPutAll: self ref asString;
		nextPut: $)
]

{ #category : #accessing }
GtOpenApiReference >> ref [

	^ ref
]

{ #category : #accessing }
GtOpenApiReference >> ref: anObject [

	ref := anObject
]
