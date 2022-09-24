Class {
	#name : #GtOpenApiSchemaReferenceCollector,
	#superclass : #Object,
	#instVars : [
		'schema',
		'toProcess',
		'result',
		'wantsNestedReferences',
		'wantsGivenSchema',
		'wantsNamedObjectSchemas'
	],
	#category : #'GToolkit4OpenAPI-New-Support'
}

{ #category : #'api - initialization' }
GtOpenApiSchemaReferenceCollector >> beAnyObjectSchemas [
	wantsNamedObjectSchemas := false
]

{ #category : #'api - initialization' }
GtOpenApiSchemaReferenceCollector >> beNamedObjectSchemas [
	wantsNamedObjectSchemas := true
]

{ #category : #'api - initialization' }
GtOpenApiSchemaReferenceCollector >> beWithDirectReferences [
	wantsNestedReferences := false
]

{ #category : #'api - initialization' }
GtOpenApiSchemaReferenceCollector >> beWithGivenSchema [
	wantsGivenSchema := true
]

{ #category : #'api - initialization' }
GtOpenApiSchemaReferenceCollector >> beWithNestedReferences [
	wantsNestedReferences := true
]

{ #category : #'api - initialization' }
GtOpenApiSchemaReferenceCollector >> beWithoutGivenSchema [
	wantsGivenSchema := false
]

{ #category : #'api - building' }
GtOpenApiSchemaReferenceCollector >> collect [
	| aRealSchema |
	toProcess := Stack new.

	aRealSchema := self extractObjectSchema: self schema.
	aRealSchema ifNil: [ ^ #() ].

	toProcess push: aRealSchema.

	result := OrderedCollection new.
	self wantsGivenSchema ifTrue: [ result add: aRealSchema ].

	[ toProcess isEmpty ] whileFalse: [ self collectForSchema: toProcess pop ].

	^ result asArray
]

{ #category : #'private - building' }
GtOpenApiSchemaReferenceCollector >> collectForProperty: aProperty ofSchema: aSchema [
	| anotherSchema |
	anotherSchema := self extractObjectSchema: aProperty.
	anotherSchema ifNil: [ ^ self ].

	self registerSchema: anotherSchema
]

{ #category : #'private - building' }
GtOpenApiSchemaReferenceCollector >> collectForSchema: aSchema [
	aSchema properties values
		do: [ :eachProperty | self collectForProperty: eachProperty ofSchema: aSchema ]
]

{ #category : #'api - building' }
GtOpenApiSchemaReferenceCollector >> extractObjectSchema: aSchema [
	^ GtOpenApiObjectSchemaFinder new
		schema: aSchema;
		wantsNamedObjectSchemas: self wantsNamedObjectSchemas;
		find
]

{ #category : #initialization }
GtOpenApiSchemaReferenceCollector >> initialize [
	super initialize.
	wantsNestedReferences := false.
	wantsGivenSchema := false.
	wantsNamedObjectSchemas := true.
]

{ #category : #'private - building' }
GtOpenApiSchemaReferenceCollector >> registerSchema: aSchema [
	(result includes: aSchema) ifTrue: [ ^ self ].

	result add: aSchema.
	self wantsNestedReferences ifTrue: [ toProcess push: aSchema ]
]

{ #category : #accessing }
GtOpenApiSchemaReferenceCollector >> schema [

	^ schema
]

{ #category : #accessing }
GtOpenApiSchemaReferenceCollector >> schema: anObject [

	schema := anObject
]

{ #category : #testing }
GtOpenApiSchemaReferenceCollector >> wantsGivenSchema [
	^ wantsGivenSchema
]

{ #category : #testing }
GtOpenApiSchemaReferenceCollector >> wantsNamedObjectSchemas [
	^ wantsNamedObjectSchemas
]

{ #category : #testing }
GtOpenApiSchemaReferenceCollector >> wantsNestedReferences [
	^ wantsNestedReferences
]
