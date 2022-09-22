Class {
	#name : #GtOpenApiParser,
	#superclass : #Object,
	#category : #'GToolkit4OpenAPI-New-Parser'
}

{ #category : #'api - parsing' }
GtOpenApiParser class >> read: aSchemaName string: aString [
	^ self new read: aSchemaName string: aString
]

{ #category : #'api - parsing' }
GtOpenApiParser class >> readString: aString [
	^ self new readString: aString
]

{ #category : #initialization }
GtOpenApiParser >> initializeMappingsFor: aMapper [
	self mappingOfOpenApiFor: aMapper.
	self mappingOfOpenApiInfoFor: aMapper.
	self mappingOfOpenApiContactFor: aMapper.
	self mappingOfOpenApiLicenseFor: aMapper.
	self mappingOfCollectionOf: GtOpenApiServer for: aMapper.
	self mappingOfOpenApiServerFor: aMapper.
	self mappingOfDictionaryOf: GtOpenApiServerVariable for: aMapper.
	self mappingOfOpenApiServerVariableFor: aMapper.
	self mappingOfOpenApiPathsFor: aMapper.
	self mappingOfOpenApiPathItemFor: aMapper.
	self mappingOfOpenApiOperationFor: aMapper.
	self mappingOfOpenApiExternalDocumentationFor: aMapper.
	self mappingOfOpenApiParameterFor: aMapper.
	self mappingOfOpenApiReferenceFor: aMapper.
	self mappingOfCollectionOfReferenceOr: GtOpenApiParameter for: aMapper.
	self mappingOfReferenceOr: GtOpenApiParameter for: aMapper.
	self mappingOfDictionaryOfReferenceOr: GtOpenApiResponse for: aMapper.
	self mappingOfOpenApiResponsesFor: aMapper.
	self mappingOfReferenceOr: GtOpenApiResponse for: aMapper.
	self mappingOfOpenApiResponseFor: aMapper.
	self mappingOfOpenApiTagFor: aMapper.
	self mappingOfCollectionOf: GtOpenApiTag for: aMapper.
	self mappingOfOpenApiComponentsFor: aMapper.
	self mappingOfDictionaryOfReferenceOr: GtOpenApiSchema for: aMapper.
	self mappingOfReferenceOr: GtOpenApiSchema for: aMapper.
	self mappingOfOpenApiSchemaFor: aMapper
]

{ #category : #'mapping - utilities' }
GtOpenApiParser >> mappingOfCollectionOf: aSchemaName for: aMapper [
	aMapper
		for: (self nameOfCollection: aSchemaName)
		customDo: [ :mapping | mapping listOfElementSchema: aSchemaName ]
]

{ #category : #'mapping - utilities' }
GtOpenApiParser >> mappingOfCollectionOfReferenceOr: aSchemaName for: aMapper [
	self mappingOfCollectionOf: (self nameOfReferenceOr: aSchemaName) for: aMapper
]

{ #category : #'mapping - utilities' }
GtOpenApiParser >> mappingOfDictionaryOf: aSchemaName for: aMapper [
	aMapper
		for: (self nameOfDictionary: aSchemaName)
		customDo: [ :mapping | mapping mapWithValueSchema: aSchemaName ]
]

{ #category : #'mapping - utilities' }
GtOpenApiParser >> mappingOfDictionaryOfReferenceOr: aSchemaName for: aMapper [
	self mappingOfDictionaryOf: (self nameOfReferenceOr: aSchemaName) for: aMapper
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiComponentsFor: aMapper [
	aMapper
		for: GtOpenApiComponents
		do: [ :mapping | 
			(mapping mapAccessor: #schemas)
				valueSchema: (self nameOfDictionaryOfReferenceOr: GtOpenApiSchema).
			mapping mapAccessor: #responses.
			mapping mapAccessor: #parameters.
			mapping mapAccessor: #examples.
			mapping mapAccessor: #requestBodies.
			mapping mapAccessor: #headers.
			mapping mapAccessor: #securitySchemes.
			mapping mapAccessor: #links.
			mapping mapAccessor: #callbacks ]
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
			(mapping mapAccessor: #servers)
				valueSchema: (self nameOfCollection: GtOpenApiServer).
			(mapping mapAccessor: #paths) valueSchema: GtOpenApiPaths.
			(mapping mapAccessor: #components) valueSchema: GtOpenApiComponents.
			mapping mapAccessor: #security.
			(mapping mapAccessor: #tags)
				valueSchema: (self nameOfCollection: GtOpenApiTag).
			mapping mapAccessor: #externalDocs ]
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
			mapping mapAccessor: #parameters.	"valueSchema: #CollectionOfOpenApiParameters"
			mapping mapAccessor: #requestBody.	"valueSchema: #OpenApiRequestBodyOrReference"
			(mapping mapAccessor: #responses) valueSchema: GtOpenApiResponses.
			mapping mapAccessor: #callbacks.	"valueSchema: #CollectionOfGtOpenApiCallaback"
			mapping mapAccessor: #isDeprecated to: #deprecated.
			mapping mapAccessor: #security.	"valueSchema: GtOpenApiSecurity"
			(mapping mapAccessor: #servers)
				valueSchema: (self nameOfCollection: GtOpenApiServer) ]
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
			(mapping mapAccessor: #traceOp to: #trace) valueSchema: GtOpenApiOperation.
			(mapping mapAccessor: #servers)
				valueSchema: (self nameOfCollection: GtOpenApiServer).
			(mapping mapAccessor: #parameters)
				valueSchema: (self nameOfCollectionOfReferenceOr: GtOpenApiParameter) ]
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
GtOpenApiParser >> mappingOfOpenApiResponsesFor: aMapper [
	aMapper
		for: GtOpenApiResponses
		customDo: [ :mapping | 
			mapping
				reader: [ :jsonReader | 
					| aDictionary |
					aDictionary := jsonReader
							nextAs: (self nameOfDictionaryOfReferenceOr: GtOpenApiResponse).
					GtOpenApiResponses new dictionary: aDictionary ].

			mapping writer: [ :jsonWriter :object | self error: 'to be implemented' ] ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiSchemaFor: aMapper [
	aMapper
		for: GtOpenApiSchema
		do: [ :mapping | 
			mapping mapAccessor: #title.
			mapping mapAccessor: #multipleOf.
			mapping mapAccessor: #maximum.
			mapping mapAccessor: #exclusiveMaximum.
			mapping mapAccessor: #minimum.
			mapping mapAccessor: #exclusiveMinimum.
			mapping mapAccessor: #maxLength.
			mapping mapAccessor: #minLength.
			mapping mapAccessor: #pattern.
			mapping mapAccessor: #maxItems.
			mapping mapAccessor: #minItems.
			mapping mapAccessor: #uniqueItems.
			mapping mapAccessor: #maxProperties.
			mapping mapAccessor: #minProperties.
			mapping mapAccessor: #required.
			mapping mapAccessor: #enum.

			mapping mapAccessor: #type.
			mapping mapAccessor: #allOf.
			mapping mapAccessor: #oneOf.
			mapping mapAccessor: #anyOf.
			mapping mapAccessor: #not.
			mapping mapAccessor: #items.
			(mapping mapAccessor: #properties)
				valueSchema: (self nameOfDictionaryOfReferenceOr: GtOpenApiSchema).
			mapping mapAccessor: #additionalProperties.
			mapping mapAccessor: #description.
			mapping mapAccessor: #format.
			mapping mapAccessor: #default.

			mapping mapAccessor: #nullable.
			mapping mapAccessor: #discrimintaro.
			mapping mapAccessor: #readOnly.
			mapping mapAccessor: #writeOnly.
			mapping mapAccessor: #xml.
			(mapping mapAccessor: #externalDocs)
				valueSchema: GtOpenApiExternalDocumentation.
			mapping mapAccessor: #example.
			mapping mapAccessor: #isDeprecated to: #deprecated ]
]

{ #category : #initialization }
GtOpenApiParser >> mappingOfOpenApiServerFor: aMapper [
	aMapper
		for: GtOpenApiServer
		do: [ :mapping | 
			mapping mapAccessor: #url.
			mapping mapAccessor: #description.
			(mapping mapAccessor: #variables)
				valueSchema: (self nameOfDictionary: GtOpenApiServerVariable) ]
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
GtOpenApiParser >> mappingOfOpenApiTagFor: aMapper [
	aMapper
		for: GtOpenApiTag
		do: [ :mapping | 
			mapping mapAccessor: #name.
			mapping mapAccessor: #description.
			(mapping mapAccessor: #externalDocs)
				valueSchema: GtOpenApiExternalDocumentation ]
]

{ #category : #'mapping - utilities' }
GtOpenApiParser >> mappingOfReferenceOr: aSchemeName for: aMapper [
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

{ #category : #'mapping - utilities' }
GtOpenApiParser >> nameOfCollection: aSchemaName [
	^ #CollectionOf , aSchemaName asString
]

{ #category : #'mapping - utilities' }
GtOpenApiParser >> nameOfCollectionOfReferenceOr: aSchemaName [
	^ self nameOfCollection: (self nameOfReferenceOr: aSchemaName)
]

{ #category : #'mapping - utilities' }
GtOpenApiParser >> nameOfDictionary: aSchemaName [
	^ #DictionaryOf , aSchemaName asString
]

{ #category : #'mapping - utilities' }
GtOpenApiParser >> nameOfDictionaryOfReferenceOr: aSchemaName [
	^ self nameOfDictionary: (self nameOfReferenceOr: aSchemaName)
]

{ #category : #'mapping - utilities' }
GtOpenApiParser >> nameOfReferenceOr: aSchemaName [
	^ GtOpenApiReference name , 'Or' , aSchemaName asString
]

{ #category : #'api - reading' }
GtOpenApiParser >> read: aJsonSchema stream: aReadStream [
	| aReader anOpenApiObject |
	aReader := NeoJSONReader on: aReadStream.
	aReader mapClass: OrderedDictionary.
	self initializeMappingsFor: aReader.
	anOpenApiObject := aReader nextAs: aJsonSchema.
	GtOpenApiReferenceResolver new
		rootObject: anOpenApiObject;
		resolve.
	^ anOpenApiObject
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
	^ self read: GtOpenApi stream: aString readStream
]
