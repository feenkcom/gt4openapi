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
	#category : #'GToolkit4OpenAPI-Model'
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
GtOpenApiComponents >> gtPaintSchemaReferencesFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Schema References';
		priority: 5;
		painting: [ :view | self paintSchemaReferences: self schemas values on: view ]
]

{ #category : #'gt - extensions' }
GtOpenApiComponents >> gtRootSchemasFor: aView [
	<gtView>
	self schemas ifNil: [ ^ aView empty ].

	^ aView columnedTree
		title: 'Root Schemas';
		priority: 2;
		items: [ self rootSchemas sorted: [ :a :b | a name < b name ] ];
		children: [ :aSchema | aSchema directlyReferencedSchemas reject: [ :each | each = aSchema ] ];
		column: 'Name' text: #name;
		column: 'Referenced Schemas'
			text: [ :aSchema | 
				String
					streamContents: [ :aStream | 
						aSchema directlyReferencedSchemas
							do: [ :eachSchema | aStream nextPutAll: eachSchema name ]
							separatedBy: [ aStream nextPutAll: ', ' ] ] ]
]

{ #category : #'gt - extensions' }
GtOpenApiComponents >> gtSchemasFor: aView [
	<gtView>
	self schemas ifNil: [ ^ aView empty ].

	^ aView columnedTree
		title: 'Schemas';
		priority: 1;
		items: [ self schemas associations sorted: [ :a :b | a key < b key ] ];
		children: [ :anAssoc | 
			(self schemasThatUseSchema: anAssoc value)
				reject: [ :eachSchema | eachSchema = anAssoc value ]
				thenCollect: [ :eachSchema | eachSchema name -> eachSchema ] ];
		column: 'Name' text: #key;
		column: 'Used By'
			text: [ :anAssoc | 
				String
					streamContents: [ :aStream | 
						(self schemasThatUseSchema: anAssoc value)
							do: [ :eachSchema | aStream nextPutAll: eachSchema name ]
							separatedBy: [ aStream nextPutAll: ', ' ] ] ];
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

{ #category : #'gt - extensions' }
GtOpenApiComponents >> paintSchemaReferences: aCollectionOfSchemas on: aView [
	aView nodes
		stencil: [ :aSchema | 
			BrLabel new
				fitContent;
				aptitude: BrGlamorousLabelAptitude;
				text: aSchema name ];
		with: aCollectionOfSchemas.

	aView edges
		stencil: [ :each | 
			| aColor |
			aColor := Color gray.
			BlLineElement new
				border: (BlBorder paint: aColor width: 1);
				toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: aColor width: 1)) ];
		connectToAll: [ :aSchema | 
			aSchema properties values
				select: [ :eachProperty | eachProperty isReference ]
				thenCollect: #object ].

	aView layout horizontalTree
		levelDistance: 30;
		nodeDistance: 30;
		treesDistance: 30.

	aView
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
GtOpenApiComponents >> rootSchemas [
	^ self schemas values
		select: [ :eachSchema | 
			self schemas
				allSatisfy: [ :otherSchema | 
					| isNotReferenced |
					isNotReferenced := true.
					otherSchema = eachSchema
						ifFalse: [ otherSchema properties values
								do: [ :eachProperty | 
									eachProperty
										withObjectsDo: [ :eachObject | 
											(eachObject isReference
												and: [ eachObject object isNotNil and: [ eachObject object = eachSchema ] ])
												ifTrue: [ isNotReferenced := false ] ] ] ].
					isNotReferenced ] ]
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

{ #category : #'gt - extensions' }
GtOpenApiComponents >> schemasThatUseSchema: aSchema [
	^ self schemas values
		select: [ :eachSchema | 
			| isUser |
			isUser := false.
			eachSchema properties values
				do: [ :eachProperty | 
					(eachProperty isReference and: [ eachProperty object = aSchema ])
						ifTrue: [ isUser := true ].

					(eachProperty isSchema
						and: [ eachProperty isArrayType
								and: [ eachProperty items isReference and: [ eachProperty items object = aSchema ] ] ])
						ifTrue: [ isUser := true ] ].

			isUser ]
]

{ #category : #accessing }
GtOpenApiComponents >> securitySchemes [

	^ securitySchemes
]

{ #category : #accessing }
GtOpenApiComponents >> securitySchemes: anObject [

	securitySchemes := anObject
]
