Class {
	#name : #GtOpenApiMediaType,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject + TGtOpenApiWithFields',
	#classTraits : 'TGtOpenApiObject classTrait + TGtOpenApiWithFields classTrait',
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #accessing }
GtOpenApiMediaType >> accept: aVisitor [
	^ aVisitor visitGtOpenApiMediaType: self
]

{ #category : #accessing }
GtOpenApiMediaType >> gtOpenApiContentViewResponseItemText [
	^ self schema
		ifNotNil: [ :aSchema | aSchema gtOpenApiContentViewResponseItemText ]
		ifNil: [ self asString ]
]

{ #category : #accessing }
GtOpenApiMediaType >> gtPaintSchemaReferencesFor: aView context: aContext [
	<gtView>
	self schema ifNil: [ ^ aView empty ].

	^ aView forward
		title: 'Schema References';
		priority: 5;
		object: [ self schema ];
		view: #gtPaintSchemaReferencesFor:context:
]

{ #category : #accessing }
GtOpenApiMediaType >> gtSchemaPropertiesFor: aView context: aContext [
	<gtView>
	self schema ifNil: [ ^ aView empty ].

	^ aView forward
		title: 'Schema Properties';
		priority: 1;
		object: [ self schema ];
		view: #gtSchemaPropertiesFor:context:
]

{ #category : #enumerating }
GtOpenApiMediaType >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self schema ifNotNil: [ :aSchema | aSchema withObjectsDo: aBlock ]
]

{ #category : #accessing }
GtOpenApiMediaType >> realSchema [
	^ GtOpenApiObjectSchemaFinder new
		schema: self schema;
		includeArrays: true;
		find
]

{ #category : #accessing }
GtOpenApiMediaType >> schema [
	^ self fieldAt: #schema
]
