Class {
	#name : #GtOpenApiSchemaReferenceCollector,
	#superclass : #Object,
	#instVars : [
		'schema',
		'toProcess',
		'result',
		'wantsNestedReferences',
		'wantsGivenSchema'
	],
	#category : #'GToolkit4OpenAPI-New-Support'
}

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
	toProcess := Stack new.
	toProcess push: self schema.

	result := OrderedCollection new.
	self wantsGivenSchema ifTrue: [ result add: self schema ].

	[ toProcess isEmpty ] whileFalse: [ self collectForSchema: toProcess pop ].

	^ result asArray
]

{ #category : #'private - building' }
GtOpenApiSchemaReferenceCollector >> collectForProperty: aProperty ofSchema: aSchema [
	| anotherSchema |
	(aProperty isReference
		and: [ anotherSchema := aProperty object.
			anotherSchema isNotNil and: [ anotherSchema isSchema ] ])
		ifTrue: [ self registerSchema: anotherSchema ].

	(aProperty isSchema
		and: [ aProperty isArrayType and: [ aProperty items isNotNil ] ])
		ifTrue: [ anotherSchema := aProperty items.
			(anotherSchema isReference and: [ anotherSchema object isNotNil ])
				ifTrue: [ anotherSchema := anotherSchema object ].
			self registerSchema: anotherSchema ]
]

{ #category : #'private - building' }
GtOpenApiSchemaReferenceCollector >> collectForSchema: aSchema [
	aSchema properties values
		do: [ :eachProperty | self collectForProperty: eachProperty ofSchema: aSchema ]
]

{ #category : #initialization }
GtOpenApiSchemaReferenceCollector >> initialize [
	super initialize.
	wantsNestedReferences := false.
	wantsGivenSchema := false.
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
GtOpenApiSchemaReferenceCollector >> wantsNestedReferences [
	^ wantsNestedReferences
]
