Class {
	#name : #GtOpenApiComponents,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'schemas',
		'responses',
		'parameters',
		'examples',
		'equestBodies',
		'headers',
		'securitySchemes',
		'links',
		'callbacks'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiComponents >> accept: aVisitor [
	^ aVisitor visitGtOpenApiComponents: self
]

{ #category : #accessing }
GtOpenApiComponents >> callbacks [

	^ callbacks
]

{ #category : #accessing }
GtOpenApiComponents >> callbacks: anObject [

	callbacks := anObject
]

{ #category : #accessing }
GtOpenApiComponents >> equestBodies [

	^ equestBodies
]

{ #category : #accessing }
GtOpenApiComponents >> equestBodies: anObject [

	equestBodies := anObject
]

{ #category : #accessing }
GtOpenApiComponents >> examples [

	^ examples
]

{ #category : #accessing }
GtOpenApiComponents >> examples: anObject [

	examples := anObject
]

{ #category : #'gt - extensions' }
GtOpenApiComponents >> gtSchemasFor: aView [
	<gtView>
	self schemas ifNil: [ ^ aView empty ].

	^ aView columnedList
		title: 'Schemas';
		priority: 1;
		items: [ self schemas associations sorted: [ :a :b | a key < b key ] ];
		column: 'Name' text: #key;
		column: 'Type' text: [ :anAssoc | anAssoc value type ];
		send: #value
]

{ #category : #accessing }
GtOpenApiComponents >> headers [

	^ headers
]

{ #category : #accessing }
GtOpenApiComponents >> headers: anObject [

	headers := anObject
]

{ #category : #accessing }
GtOpenApiComponents >> links [

	^ links
]

{ #category : #accessing }
GtOpenApiComponents >> links: anObject [

	links := anObject
]

{ #category : #enumerating }
GtOpenApiComponents >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self schemas
		ifNotNil: [ :aDict | 
			aDict
				keysAndValuesDo: [ :aName :anObject | 
					aBlock cull: anObject cull: aName.
					anObject objectsDo: aBlock ] ]
]

{ #category : #accessing }
GtOpenApiComponents >> parameters [

	^ parameters
]

{ #category : #accessing }
GtOpenApiComponents >> parameters: anObject [

	parameters := anObject
]

{ #category : #accessing }
GtOpenApiComponents >> responses [

	^ responses
]

{ #category : #accessing }
GtOpenApiComponents >> responses: anObject [

	responses := anObject
]

{ #category : #accessing }
GtOpenApiComponents >> schemas [

	^ schemas
]

{ #category : #accessing }
GtOpenApiComponents >> schemas: aDictionary [
	schemas := aDictionary.
	aDictionary keysAndValuesDo: [ :aName :anObject | anObject name: aName ]
]

{ #category : #accessing }
GtOpenApiComponents >> securitySchemes [

	^ securitySchemes
]

{ #category : #accessing }
GtOpenApiComponents >> securitySchemes: anObject [

	securitySchemes := anObject
]
