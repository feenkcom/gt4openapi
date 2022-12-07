Class {
	#name : #GtOpenApiSchemaModelExporterConfiguration,
	#superclass : #GtCodeGenExporterConfiguration,
	#category : #'GToolkit4OpenAPI-Exporter'
}

{ #category : #initialization }
GtOpenApiSchemaModelExporterConfiguration >> initialize [
	super initialize.

	packageName := self class package name.
	packageTagName := 'Model'.
	modelClassPrefix := 'Gt'.
	modelRootClassName := modelClassPrefix, 'EntityModel'.
]
