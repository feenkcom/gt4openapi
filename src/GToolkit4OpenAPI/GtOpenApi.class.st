Class {
	#name : #GtOpenApi,
	#superclass : #Object,
	#instVars : [
		'openapi',
		'info',
		'servers',
		'paths',
		'components',
		'security',
		'tags',
		'externalDocs'
	],
	#category : #'GToolkit4OpenAPI-New-Core'
}

{ #category : #'api - parsing' }
GtOpenApi class >> fromJsonString: aString [
	^ GtOpenApiParser default readString: aString
]

{ #category : #accessing }
GtOpenApi >> components [

	^ components
]

{ #category : #accessing }
GtOpenApi >> components: anObject [

	components := anObject
]

{ #category : #accessing }
GtOpenApi >> externalDocs [

	^ externalDocs
]

{ #category : #accessing }
GtOpenApi >> externalDocs: anObject [

	externalDocs := anObject
]

{ #category : #'gt - extensions' }
GtOpenApi >> gtComponentSchemasFor: aView [
	<gtView>
	self components ifNil: [ ^ aView empty ].

	^ aView forward
		title: 'Schemas';
		priority: 10;
		object: [ self components ];
		view: #gtSchemasFor:
]

{ #category : #'gt - extensions' }
GtOpenApi >> gtPathsFor: aView [
	<gtView>
	self paths ifNil: [ ^ aView empty ].

	^ aView columnedList
		title: 'Paths';
		priority: 5;
		items: [ self paths associations sorted: [ :a :b | a key < b key ] ];
		column: 'End Point' text: #key;
		column: 'Operations'
			text: [ :anAssoc | anAssoc value gtPathsViewOperationsText ];
		column: 'Description'
			text: [ :anAssoc | anAssoc value gtPathsViewDescriptionText ];
		send: #value
]

{ #category : #accessing }
GtOpenApi >> info [

	^ info
]

{ #category : #accessing }
GtOpenApi >> info: anObject [

	info := anObject
]

{ #category : #accessing }
GtOpenApi >> openapi [

	^ openapi
]

{ #category : #accessing }
GtOpenApi >> openapi: anObject [

	openapi := anObject
]

{ #category : #accessing }
GtOpenApi >> paths [

	^ paths
]

{ #category : #accessing }
GtOpenApi >> paths: anObject [

	paths := anObject
]

{ #category : #accessing }
GtOpenApi >> security [

	^ security
]

{ #category : #accessing }
GtOpenApi >> security: anObject [

	security := anObject
]

{ #category : #accessing }
GtOpenApi >> servers [

	^ servers
]

{ #category : #accessing }
GtOpenApi >> servers: anObject [

	servers := anObject
]

{ #category : #accessing }
GtOpenApi >> tags [

	^ tags
]

{ #category : #accessing }
GtOpenApi >> tags: anObject [

	tags := anObject
]
