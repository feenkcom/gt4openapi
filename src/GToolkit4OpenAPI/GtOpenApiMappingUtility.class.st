Class {
	#name : #GtOpenApiMappingUtility,
	#superclass : #Object,
	#category : #'GToolkit4OpenAPI-New-Parser'
}

{ #category : #'mapping - utilities' }
GtOpenApiMappingUtility class >> nameOfCollection: aSchemaName [
	^ #CollectionOf , aSchemaName asString
]

{ #category : #'mapping - utilities' }
GtOpenApiMappingUtility class >> nameOfCollectionOfReferenceOr: aSchemaName [
	^ self nameOfCollection: (self nameOfReferenceOr: aSchemaName)
]

{ #category : #'mapping - utilities' }
GtOpenApiMappingUtility class >> nameOfDictionary: aSchemaName [
	^ #DictionaryOf , aSchemaName asString
]

{ #category : #'mapping - utilities' }
GtOpenApiMappingUtility class >> nameOfDictionaryOfReferenceOr: aSchemaName [
	^ self nameOfDictionary: (self nameOfReferenceOr: aSchemaName)
]

{ #category : #'mapping - utilities' }
GtOpenApiMappingUtility class >> nameOfReferenceOr: aSchemaName [
	^ GtOpenApiReference name , 'Or' , aSchemaName asString
]
