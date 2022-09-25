Trait {
	#name : #TGtOpenApiObject,
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
TGtOpenApiObject >> accept: aVisitor [
	self explicitRequirement
]

{ #category : #'gt - extensions' }
TGtOpenApiObject >> gtOpenApiViewSendObject [
	^ self
]

{ #category : #'gt - extensions' }
TGtOpenApiObject >> gtPathsViewSendObject [
	^ self
]

{ #category : #testing }
TGtOpenApiObject >> isOpenApi [
	^ false
]

{ #category : #testing }
TGtOpenApiObject >> isReference [
	^ false
]

{ #category : #testing }
TGtOpenApiObject >> isSchema [
	^ false
]

{ #category : #testing }
TGtOpenApiObject >> isTag [
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
