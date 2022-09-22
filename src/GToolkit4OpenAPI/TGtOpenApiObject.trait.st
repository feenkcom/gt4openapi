Trait {
	#name : #TGtOpenApiObject,
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
TGtOpenApiObject >> accept: aVisitor [
	self explicitRequirement
]

{ #category : #testing }
TGtOpenApiObject >> isOpenApi [
	^ false
]

{ #category : #testing }
TGtOpenApiObject >> isReference [
	^ false
]

{ #category : #enumerating }
TGtOpenApiObject >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self explicitRequirement
]

{ #category : #enumerating }
TGtOpenApiObject >> referencesDo: aBlock [
	self
		objectsDo: [ :eachObject | eachObject isReference ifTrue: [ aBlock cull: eachObject ] ]
]

{ #category : #enumerating }
TGtOpenApiObject >> withObjectsDo: aBlock [
	aBlock cull: self.
	self objectsDo: aBlock
]
