Class {
	#name : #GtOpenApiSchemaModelExporter,
	#superclass : #GtCodeGenModelExporter,
	#category : #'GToolkit4OpenAPI-Exporter'
}

{ #category : #initialization }
GtOpenApiSchemaModelExporter >> initialize [
	super initialize.
	
	self namingStrategy:  GtOpenApiNamingStrategy new
]

{ #category : #initialization }
GtOpenApiSchemaModelExporter >> initializeDefaultConfiguration [
	configuration := GtOpenApiSchemaModelExporterConfiguration new.
]

{ #category : #accessing }
GtOpenApiSchemaModelExporter >> modelClassDefinitions [
	^ self openApiModel components schemas values
		select: [ :aSchemaValue |
			aSchemaValue isObjectType ] 
]

{ #category : #accessing }
GtOpenApiSchemaModelExporter >> openApiModel [
	^ metaModel
]

{ #category : #accessing }
GtOpenApiSchemaModelExporter >> openApiModel: anOpenApiModel [
	metaModel := anOpenApiModel
]

{ #category : #'initialization - extensions - pharo' }
GtOpenApiSchemaModelExporter >> useInstanceVariableAccessorsBuilder [
	self addExtension: GtOpenApiPropertiesAccessorsExporterExtension new.
]
