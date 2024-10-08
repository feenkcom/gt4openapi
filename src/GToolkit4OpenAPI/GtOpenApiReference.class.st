Class {
	#name : #GtOpenApiReference,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'ref',
		'object',
		'name'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiReference >> accept: aVisitor [
	^ aVisitor visitGtOpenApiReference: self
]

{ #category : #accessing }
GtOpenApiReference >> directlyReferencedSchemas [
	"For compatibility with schema."

	^ self object ifNotNil: #directlyReferencedSchemas ifNil: [ #() ]
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

	self object isDictionary
		ifTrue: [ super gtDisplayOn: aStream.
			^ self ].

	(self object isNotNil and: [ self object name isNotNil ])
		ifTrue: [ aName := self object name asString ]
		ifFalse: [ aName := self ref asString ].

	aStream
		nextPutAll: 'Reference to ';
		nextPutAll: aName
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtObjectDictionary: aView context: aContext [
	<gtView>
	| anExpansionLevel |
	self object ifNil: [ ^ aView empty ].
	self object isDictionary ifFalse: [ ^ aView empty ].

	anExpansionLevel := aContext at: #gtTreeExpansionLevel ifAbsentPut: [ true ].

	^ aView forward
		title: 'Dictionary';
		priority: 5;
		object: [ self object ];
		view: #gtTreeFor:context:;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			label: 'Dictionary'
			tooltip: 'Inspect dictionary object'
			action: [ :aButton | aButton phlow spawnObject: self object ]
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtOpenApiContentViewResponseItemText [
	^ (self object isNotNil and: [ self object name isNotNil ])
		ifTrue: [ self object name ]
		ifFalse: [ self ref ifNil: [ 'reference' ] ]
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtOpenApiParameterViewText [
	^ (self object isNotNil and: [ self object name isNotNil ])
		ifTrue: [ self object name ]
		ifFalse: [ self ref ifNil: [ 'reference' ] ]
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtOpenApiPathsViewChildren [
	^ self object isNotNil
		ifTrue: [ self object gtOpenApiPathsViewChildren ]
		ifFalse: [ #() ]
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtOpenApiStructureViewText [
	^ (self object isNotNil and: [ self object name isNotNil ])
		ifTrue: [ self object name ]
		ifFalse: [ self ref ifNil: [ 'reference' ] ]
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtOpenApiViewSendObject [
	^ self object ifNotNil: #gtOpenApiViewSendObject ifNil: [ self ]
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtPaintSchemaReferencesFor: aView context: aContext [
	<gtView>
	self object ifNil: [ ^ aView empty ].
	self object isDictionary ifTrue: [ ^ aView empty ].
	self object isSchema ifFalse: [ ^ aView empty ].

	^ aView forward
		title: 'Schema references';
		priority: 5;
		object: [ self object ];
		view: #gtPaintSchemaReferencesFor:context:;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			label: 'Schema'
			tooltip: 'Inspect schema'
			action: [ :aButton | aButton phlow spawnObject: self object ]
]

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtPathsViewDescriptionText [
	^ self object isNotNil
		ifTrue: [ self object gtPathsViewDescriptionText ]
		ifFalse: [ self ref ifNil: [ 'reference' ] ]
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

{ #category : #'gt - extensions' }
GtOpenApiReference >> gtSchemaPropertiesFor: aView context: aContext [
	<gtView>
	self object ifNil: [ ^ aView empty ].
	self object isDictionary ifTrue: [ ^ aView empty ].
	self object isSchema ifFalse: [ ^ aView empty ].

	^ aView forward
		title: 'Schema properties';
		priority: 1;
		object: [ self object ];
		view: #gtPropertiesFor:context:;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			label: 'Schema'
			tooltip: 'Inspect schema'
			action: [ :aButton | aButton phlow spawnObject: self object ]
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
GtOpenApiReference >> name [
	^ name ifNil: [ self object ifNotNil: #name ]
]

{ #category : #accessing }
GtOpenApiReference >> name: anObject [
	name := anObject
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
GtOpenApiReference >> properties [
	"For compatibility with schema."

	^ self object ifNotNil: #properties ifNil: [ OrderedDictionary new ]
]

{ #category : #accessing }
GtOpenApiReference >> ref [

	^ ref
]

{ #category : #accessing }
GtOpenApiReference >> ref: anObject [

	ref := anObject
]
