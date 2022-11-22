Class {
	#name : #GtOpenApiObjectSchemaFinder,
	#superclass : #Object,
	#instVars : [
		'schema',
		'wantsNamedObjectSchemas',
		'includeArrays'
	],
	#category : #'GToolkit4OpenAPI-Support'
}

{ #category : #'private - finding' }
GtOpenApiObjectSchemaFinder >> anyOrNamedObjectSchema: aSchema [
	self wantsNamedObjectSchemas ifFalse: [ ^ aSchema ].

	aSchema name ifNil: [ ^ nil ].
	^ aSchema
]

{ #category : #'api - finding' }
GtOpenApiObjectSchemaFinder >> find [
	^ self findObjectSchema: self schema
]

{ #category : #'private - finding' }
GtOpenApiObjectSchemaFinder >> findArrayTypeSchema: anArrayTypeSchema [
	| anotherSchema |
	self includeArrays ifTrue: [ ^ anArrayTypeSchema ].

	anotherSchema := anArrayTypeSchema items.
	anotherSchema ifNil: [ ^ nil ].

	^ self findObjectSchema: anotherSchema
]

{ #category : #'private - finding' }
GtOpenApiObjectSchemaFinder >> findObjectSchema: aSchema [
	(aSchema isSchema and: [ aSchema isObjectType ])
		ifTrue: [ ^ self anyOrNamedObjectSchema: aSchema ].

	(aSchema isSchema and: [ aSchema isArrayType ])
		ifTrue: [ ^ self findArrayTypeSchema: aSchema ].

	(aSchema isReference
		and: [ aSchema object isNotNil and: [ aSchema object isSchema ] ])
		ifTrue: [ ^ self findObjectSchema: aSchema object ].

	^ nil
]

{ #category : #'private - finding' }
GtOpenApiObjectSchemaFinder >> findObjectSchemaInReference: aReference [
	^ aReference object ifNotNil: [ :aSchema | self findObjectSchema: aSchema ]
]

{ #category : #accessing }
GtOpenApiObjectSchemaFinder >> includeArrays [

	^ includeArrays
]

{ #category : #accessing }
GtOpenApiObjectSchemaFinder >> includeArrays: anObject [

	includeArrays := anObject
]

{ #category : #accessing }
GtOpenApiObjectSchemaFinder >> initialize [
	super initialize.
	wantsNamedObjectSchemas := true.
	includeArrays := false
]

{ #category : #accessing }
GtOpenApiObjectSchemaFinder >> schema [

	^ schema
]

{ #category : #accessing }
GtOpenApiObjectSchemaFinder >> schema: anObject [

	schema := anObject
]

{ #category : #testing }
GtOpenApiObjectSchemaFinder >> wantsNamedObjectSchemas [

	^ wantsNamedObjectSchemas
]

{ #category : #'api - initialization' }
GtOpenApiObjectSchemaFinder >> wantsNamedObjectSchemas: aBoolean [

	wantsNamedObjectSchemas := aBoolean
]
