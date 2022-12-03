Class {
	#name : #GtOpenApiRequestBody,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject + TGtOpenApiWithFields',
	#classTraits : 'TGtOpenApiObject classTrait + TGtOpenApiWithFields classTrait',
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiRequestBody >> accept: aVisitor [
	^ aVisitor visitGtOpenApiRequestBody: self
]

{ #category : #'gt - extensions' }
GtOpenApiRequestBody >> gtContentFor: aView context: aContext [
	<gtView>
	self content ifNil: [ ^ aView empty ].

	aContext at: #gtTreeExpansionLevel ifAbsentPut: [ true ].

	aContext
		at: #gtTreeValueStyler
		ifAbsentPut: [ [ :aNode | aNode value gtOpenApiContentViewResponseItemText ] ].

	^ aView forward
		title: 'Content';
		priority: 2;
		object: [ self content ];
		view: #gtTreeFor:context:
]

{ #category : #'gt - extensions' }
GtOpenApiRequestBody >> gtDescriptionFor: aView [
	<gtView>
	self description ifNil: [ ^ aView empty ].

	^ aView textEditor
		title: 'Description';
		priority: 1;
		aptitude: BrGlamorousRegularEditorAptitude;
		text: [ self description ]
]

{ #category : #'gt - extensions' }
GtOpenApiRequestBody >> gtPaintSchemaReferencesFor: aView context: aContext [
	<gtView>
	self content ifNil: [ ^ aView empty ].
	self content ifEmpty: [ ^ aView empty ].

	^ aView forward
		title: 'Schema References';
		priority: 5;
		object: [ self content values first ];
		view: #gtPaintSchemaReferencesFor:context:
]

{ #category : #enumerating }
GtOpenApiRequestBody >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."


	self content
		ifNotNil: [ :aDict | 
			aDict
				keysAndValuesDo: [ :aName :aMediaType | 
					aBlock cull: aMediaType cull: aName.
					aMediaType objectsDo: aBlock ] ].
]
