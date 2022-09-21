Class {
	#name : #GtOpenApiComponents,
	#superclass : #Object,
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
GtOpenApiComponents >> schemas: anObject [

	schemas := anObject
]

{ #category : #accessing }
GtOpenApiComponents >> securitySchemes [

	^ securitySchemes
]

{ #category : #accessing }
GtOpenApiComponents >> securitySchemes: anObject [

	securitySchemes := anObject
]
