Class {
	#name : #GtOpenApiPropertiesAccessorsExporterExtension,
	#superclass : #GtCodeGenExporterExtension,
	#category : #'GToolkit4OpenAPI-Exporter'
}

{ #category : #accessing }
GtOpenApiPropertiesAccessorsExporterExtension >> build [
	self modelDefinitionAndClassesDo: 
		[ :aModelClassDefinition :aRGBehavior |
			self 
				buildPropertiesAccessorsForDefinition: aModelClassDefinition
				inClass: aRGBehavior ]
]

{ #category : #accessing }
GtOpenApiPropertiesAccessorsExporterExtension >> buildGetterForPropertyNamed: aPropertyName inClass: aRGBehavior [ 
	| accessorName sourceCode protocolName |
	accessorName := self namingStrategy accessorNameForProperty: aPropertyName.
	protocolName  := self namingStrategy accessorProtocolName.

	sourceCode := String streamContents: [ :aStream |
		aStream 
			<< accessorName; cr;
			tab; << '^ self propertyAt: '; print: accessorName asString  ].
		
	self modelBuilder 
		ensureLocalMethodNamed: accessorName 
		withSourceCode: sourceCode 
		andProtocol: protocolName 
		inBehavior: aRGBehavior.
]

{ #category : #accessing }
GtOpenApiPropertiesAccessorsExporterExtension >> buildPropertiesAccessorsForDefinition: aModelClassDefinition inClass: aRGBehavior [
	aModelClassDefinition properties keys do: [ :aPropertyName |
		self buildGetterForPropertyNamed: aPropertyName inClass: aRGBehavior.
		self buildSetterForPropertyNamed: aPropertyName inClass: aRGBehavior ] 
]

{ #category : #accessing }
GtOpenApiPropertiesAccessorsExporterExtension >> buildSetterForPropertyNamed: aPropertyName inClass: aRGBehavior [ 
	| accessorName sourceCode protocolName parameterName |
	accessorName := (self namingStrategy accessorNameForProperty: aPropertyName), ':'.
	protocolName  := self namingStrategy accessorProtocolName.
	parameterName := 'aValue'.
	
	sourceCode := '{1} {2}
	^ self propertyAt: {3} put: {2} ' format: {
		accessorName.
		parameterName.
		aPropertyName asString printString}.
		
	self modelBuilder 
		ensureLocalMethodNamed: accessorName 
		withSourceCode: sourceCode 
		andProtocol: protocolName 
		inBehavior: aRGBehavior.
]
