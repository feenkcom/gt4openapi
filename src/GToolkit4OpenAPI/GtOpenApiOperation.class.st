Class {
	#name : #GtOpenApiOperation,
	#superclass : #Object,
	#instVars : [
		'tags',
		'summary',
		'description',
		'externalDocs',
		'operationId',
		'parameters',
		'requestBody',
		'responses',
		'callbacks',
		'security',
		'servers',
		'isDeprecated'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiOperation >> callbacks [

	^ callbacks
]

{ #category : #accessing }
GtOpenApiOperation >> callbacks: anObject [

	callbacks := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiOperation >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> externalDocs [

	^ externalDocs
]

{ #category : #accessing }
GtOpenApiOperation >> externalDocs: anObject [

	externalDocs := anObject
]

{ #category : #'gt - extensions' }
GtOpenApiOperation >> gtResponsesFor: aView [
	<gtView>
	self responses ifNil: [ ^ aView empty ].

	^ aView forward
		title: 'Responses';
		priority: 1;
		object: [ self responses ];
		view: #gtDictionaryFor:
]

{ #category : #accessing }
GtOpenApiOperation >> isDeprecated [
	^ isDeprecated ifNil: [ false ]
]

{ #category : #accessing }
GtOpenApiOperation >> isDeprecated: anObject [

	isDeprecated := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> operationId [

	^ operationId
]

{ #category : #accessing }
GtOpenApiOperation >> operationId: anObject [

	operationId := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> parameters [

	^ parameters
]

{ #category : #accessing }
GtOpenApiOperation >> parameters: anObject [

	parameters := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> requestBody [

	^ requestBody
]

{ #category : #accessing }
GtOpenApiOperation >> requestBody: anObject [

	requestBody := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> responses [

	^ responses
]

{ #category : #accessing }
GtOpenApiOperation >> responses: anObject [

	responses := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> security [

	^ security
]

{ #category : #accessing }
GtOpenApiOperation >> security: anObject [

	security := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> servers [
	^ servers ifNil: [ #() ]
]

{ #category : #accessing }
GtOpenApiOperation >> servers: anObject [

	servers := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> summary [

	^ summary
]

{ #category : #accessing }
GtOpenApiOperation >> summary: anObject [

	summary := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> tags [

	^ tags
]

{ #category : #accessing }
GtOpenApiOperation >> tags: anObject [

	tags := anObject
]
