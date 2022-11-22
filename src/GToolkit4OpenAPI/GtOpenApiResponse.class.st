Class {
	#name : #GtOpenApiResponse,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject + TGtOpenApiWithFields',
	#classTraits : 'TGtOpenApiObject classTrait + TGtOpenApiWithFields classTrait',
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiResponse >> accept: aVisitor [
	^ aVisitor visitGtOpenApiResponse: self
]

{ #category : #accessing }
GtOpenApiResponse >> gtContentFor: aView context: aContext [
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
GtOpenApiResponse >> gtDescriptionFor: aView [
	<gtView>
	self description ifNil: [ ^ aView empty ].

	^ aView textEditor
		title: 'Description';
		priority: 1;
		aptitude: BrGlamorousRegularEditorAptitude;
		text: [ self description ]
]

{ #category : #'gt - extensions' }
GtOpenApiResponse >> gtOpenApiPathsViewChildren [
	^ self content
		ifNil: [ #() ]
		ifNotNil: [ :aDictionary | 
			aDictionary associations
				collect: [ :anAssoc | 
					('content' asRopedText
						italic;
						foreground: BrGlamorousColors disabledButtonTextColor)
						-> (GtOpenApiViewObject new
								name: anAssoc key;
								description: anAssoc value gtOpenApiContentViewResponseItemText;
								object: anAssoc value) ] ]
]

{ #category : #'gt - extensions' }
GtOpenApiResponse >> gtPaintSchemaReferencesFor: aView context: aContext [
	<gtView>
	self content ifNil: [ ^ aView empty ].
	self content ifEmpty: [ ^ aView empty ].

	^ aView forward
		title: 'Schema References';
		priority: 5;
		object: [ self content values first ];
		view: #gtPaintSchemaReferencesFor:context:
]

{ #category : #'gt - extensions' }
GtOpenApiResponse >> gtPathsViewDescriptionText [
	^ self description ifNil: [ '' ]
]

{ #category : #'gt - extensions' }
GtOpenApiResponse >> gtPathsViewOperationsText [
	^ ''
]

{ #category : #enumerating }
GtOpenApiResponse >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self headers
		ifNotNil: [ :aDict | 
			aDict
				keysAndValuesDo: [ :aName :aHeader | 
					aBlock cull: aHeader cull: aName.
					aHeader objectsDo: aBlock ] ].

	self content
		ifNotNil: [ :aDict | 
			aDict
				keysAndValuesDo: [ :aName :aMediaType | 
					aBlock cull: aMediaType cull: aName.
					aMediaType objectsDo: aBlock ] ].

	self links
		ifNotNil: [ :aDict | 
			aDict
				keysAndValuesDo: [ :aName :aLink | 
					aBlock cull: aLink cull: aName.
					aLink objectsDo: aBlock ] ].

	self flag: #todo
]
