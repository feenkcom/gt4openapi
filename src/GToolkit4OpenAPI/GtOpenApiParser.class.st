Class {
	#name : #GtOpenApiParser,
	#superclass : #Object,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit4OpenAPI-New-Parser'
}

{ #category : #initialization }
GtOpenApiParser >> initializeMappingsFor: aMapper [
	self mappingOfOpenApiFor: aMapper.
	self mappingOfOpenApiInfoFor: aMapper.
	self mappingOfOpenApiContactFor: aMapper.
	self mappingOfOpenApiLicenseFor: aMapper.
	self mappingOfCollectionOfOpenApiServerFor: aMapper.
	self mappingOfOpenApiServerFor: aMapper.
	self mappingOfDictionaryOfOpenApiServerVariableFor: aMapper.
	self mappingOfOpenApiServerVariableFor: aMapper.
	self mappingOfOpenApiPathsFor: aMapper.
	self mappingOfOpenApiPathItemFor: aMapper.
	self mappingOfOpenApiOperationFor: aMapper.
	self mappingOfOpenApiExternalDocumentationFor: aMapper.
	self mappingOfOpenApiParameterFor: aMapper.
	self mappingOfOpenApiReferenceFor: aMapper.
	self mappingOfCollectionOfOpenApiParameterAndReferenceFor: aMapper.
	self mappingOfOpenApiReferenceOfParameterFor: aMapper.
	self mappingOfDictionaryOfOpenApiResponseOrReferenceFor: aMapper.
	self mappingOfOpenApiResponsesFor: aMapper.
	self mappingOfOpenApiResponseOrReferenceFor: aMapper.
	self mappingOfOpenApiResponseFor: aMapper.
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfCollectionOfOpenApiParameterAndReferenceFor: aMapper [
	aMapper
		for: #CollectionOfOpenApiParameterAndReference
		customDo: [ :mapping | mapping listOfElementSchema: (self nameOfReferenceOr: GtOpenApiParameter) ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfCollectionOfOpenApiServerFor: aMapper [
	aMapper
		for: #CollectionOfOpenApiServer
		customDo: [ :mapping | mapping listOfElementSchema: GtOpenApiServer ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfDictionaryOfOpenApiResponseOrReferenceFor: aMapper [
	aMapper
		for: #DictionaryOfOpenApiResponseOrReference
		customDo: [ :mapping | mapping mapWithValueSchema: (self nameOfReferenceOr: GtOpenApiResponse) ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfDictionaryOfOpenApiServerVariableFor: aMapper [
	aMapper
		for: #DictionaryOfOpenApiServerVariable
		customDo: [ :mapping | mapping mapWithValueSchema: GtOpenApiServerVariable ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiContactFor: aMapper [
	aMapper
		for: GtOpenApiContact
		do: [ :mapping | 
			mapping mapAccessor: #name.
			mapping mapAccessor: #url.
			mapping mapAccessor: #email ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiExternalDocumentationFor: aMapper [
	aMapper
		for: GtOpenApiExternalDocumentation
		do: [ :mapping | 
			mapping mapAccessor: #description.
			mapping mapAccessor: #url ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiFor: aMapper [
	aMapper
		for: GtOpenApi
		do: [ :mapping | 
			mapping mapAccessor: #openapi.
			(mapping mapAccessor: #info) valueSchema: GtOpenApiInfo.
			(mapping mapAccessor: #servers) valueSchema: #CollectionOfOpenApiServer.
			(mapping mapAccessor: #paths) valueSchema: GtOpenApiPaths ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiInfoFor: aMapper [
	aMapper
		for: GtOpenApiInfo
		do: [ :mapping | 
			mapping mapAccessor: #title.
			mapping mapAccessor: #description.
			mapping mapAccessor: #termsOfService.
			(mapping mapAccessor: #contact) valueSchema: GtOpenApiContact.
			(mapping mapAccessor: #license) valueSchema: GtOpenApiLicense.
			mapping mapAccessor: #version ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiLicenseFor: aMapper [
	aMapper
		for: GtOpenApiLicense
		do: [ :mapping | 
			mapping mapAccessor: #name.
			mapping mapAccessor: #url ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiOperationFor: aMapper [
	aMapper
		for: GtOpenApiOperation
		do: [ :mapping | 
			mapping mapAccessor: #tags.
			mapping mapAccessor: #summary.
			mapping mapAccessor: #description.
			(mapping mapAccessor: #externalDocs)
				valueSchema: GtOpenApiExternalDocumentation.
			mapping mapAccessor: #operationId.
			"(mapping mapAccessor: #parameters)
				valueSchema: #CollectionOfOpenApiParameters.
			(mapping mapAccessor: #requestBody)
				valueSchema: #OpenApiRequestBodyOrReference."
			(mapping mapAccessor: #responses) valueSchema: GtOpenApiResponses.
			"(mapping mapAccessor: #callbacks)
				valueSchema: #CollectionOfGtOpenApiCallaback.
			mapping mapAccessor: #isDeprecated to: #deprecated.
			(mapping mapAccessor: #security) valueSchema: GtOpenApiSecurity.
			(mapping mapAccessor: #servers) valueSchema: #CollectionOfOpenApiServer" ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiParameterFor: aMapper [
	aMapper
		for: GtOpenApiParameter
		do: [ :mapping | 
			mapping mapAccessor: #name.
			(mapping mapAccessor: #inLocation to: #in).
			mapping mapAccessor: #description.
			mapping mapAccessor: #isRequired to: #required.
			mapping mapAccessor: #isDeprecated to: #deprecated.
			mapping mapAccessor: #allowEmptyValue ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiPathItemFor: aMapper [
	aMapper
		for: GtOpenApiPathItem
		do: [ :mapping | 
			mapping mapAccessor: #ref to: #'$ref'.
			mapping mapAccessor: #summary.
			mapping mapAccessor: #description.
			(mapping mapAccessor: #get) valueSchema: GtOpenApiOperation.
			(mapping mapAccessor: #put) valueSchema: GtOpenApiOperation.
			(mapping mapAccessor: #post) valueSchema: GtOpenApiOperation.
			(mapping mapAccessor: #delete) valueSchema: GtOpenApiOperation.
			(mapping mapAccessor: #options) valueSchema: GtOpenApiOperation.
			(mapping mapAccessor: #head) valueSchema: GtOpenApiOperation.
			(mapping mapAccessor: #patch) valueSchema: GtOpenApiOperation.
			(mapping mapAccessor: #trace) valueSchema: GtOpenApiOperation.
			(mapping mapAccessor: #servers) valueSchema: #CollectionOfOpenApiServer.
			(mapping mapAccessor: #parameters) valueSchema: #CollectionOfOpenApiParameterAndReference. ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiPathsFor: aMapper [
	aMapper
		for: GtOpenApiPaths
		customDo: [ :mapping | mapping mapWithValueSchema: GtOpenApiPathItem ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiReferenceFor: aMapper [
	aMapper
		for: GtOpenApiReference
		do: [ :mapping | mapping mapAccessor: #ref to: #'$ref' ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiReferenceOfParameterFor: aMapper [
	self mappingOfOpenApiReferenceOr: GtOpenApiParameter for: aMapper
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiReferenceOr: aSchemeName for: aMapper [
	aMapper
		for: (self nameOfReferenceOr: aSchemeName)
		customDo: [ :mapping | 
			mapping
				reader: [ :jsonReader | 
					| aResult aKey |
					aKey := jsonReader peekPropertyName asString.
					aKey = '$ref'
						ifTrue: [ aResult := jsonReader nextAs: GtOpenApiReference ]
						ifFalse: [ aResult := jsonReader nextAs: aSchemeName ].
					aResult ].
			mapping
				writer: [ :jsonWriter :object | self error: 'Writer should not be used!' ] ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiResponseFor: aMapper [
	aMapper
		for: GtOpenApiResponse
		do: [ :mapping | 
			mapping mapAccessor: #description.
			mapping mapAccessor: #headers.
			mapping mapAccessor: #content.
			mapping mapAccessor: #links ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiResponseOrReferenceFor: aMapper [
	self mappingOfOpenApiReferenceOr: GtOpenApiResponse for: aMapper
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiResponsesFor: aMapper [
	aMapper
		for: GtOpenApiResponses
		customDo: [ :mapping | 
			mapping
				reader: [ :jsonReader | 
					| aDictionary |
					aDictionary := jsonReader nextAs: #DictionaryOfOpenApiResponseOrReference.
					GtOpenApiResponses new dictionary: aDictionary ].

			mapping writer: [ :jsonWriter :object | self error: 'to be implemented' ] ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiServerFor: aMapper [
	aMapper
		for: GtOpenApiServer
		do: [ :mapping | 
			mapping mapAccessor: #url.
			mapping mapAccessor: #description.
			(mapping mapAccessor: #variables) valueSchema: #DictionaryOfOpenApiServerVariable ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiServerVariableFor: aMapper [
	aMapper
		for: GtOpenApiServerVariable
		do: [ :mapping | 
			mapping mapAccessor: #enum.
			mapping mapAccessor: #default.
			mapping mapAccessor: #description ]
]

{ #category : #initialization }
GtOpenApiParser >> nameOfReferenceOr: aSchemaName [
	^ GtOpenApiReference name , 'Or' , aSchemaName asString
]

{ #category : #'api - reading' }
GtOpenApiParser >> read: aJsonSchema stream: aReadStream [
	| aReader |
	aReader := NeoJSONReader on: aReadStream.
	self initializeMappingsFor: aReader.
	^ aReader nextAs: aJsonSchema
]

{ #category : #'api - reading' }
GtOpenApiParser >> read: aJsonSchema string: aString [
	^ self read: aJsonSchema stream: aString readStream
]

{ #category : #'api - reading' }
GtOpenApiParser >> readStream: aReadStream [
	^ self read: GtOpenApi stream: aReadStream
]

{ #category : #'api - reading' }
GtOpenApiParser >> readString: aString [
	^ self read: GtOpenApi on: aString readStream
]
