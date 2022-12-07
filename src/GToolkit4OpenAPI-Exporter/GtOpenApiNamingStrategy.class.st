Class {
	#name : #GtOpenApiNamingStrategy,
	#superclass : #GtCodeGenNamingStrategy,
	#category : #'GToolkit4OpenAPI-Exporter'
}

{ #category : #accessing }
GtOpenApiNamingStrategy >> classNameForDefinition: anApiSchema [ 
	^ String streamContents: [ :aStream  | 
		aStream nextPutAll: self modelExporter modelClassPrefix.
		aStream nextPutAll: anApiSchema name ]
]
