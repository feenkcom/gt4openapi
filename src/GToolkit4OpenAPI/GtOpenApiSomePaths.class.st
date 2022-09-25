Class {
	#name : #GtOpenApiSomePaths,
	#superclass : #Object,
	#instVars : [
		'openApi',
		'paths'
	],
	#category : #'GToolkit4OpenAPI-New - Support'
}

{ #category : #'gt - extensions' }
GtOpenApiSomePaths >> gtPathsFor: aView [
	<gtView>
	self paths ifNil: [ ^ aView empty ].

	^ aView columnedTree
		title: 'Paths';
		priority: 5;
		items: [ (self paths collect: [ :each | each endPoint -> each ])
				sorted: [ :a :b | a key < b key ] ];
		children: [ :anAssoc | anAssoc value gtOpenApiPathsViewChildren ];
		column: 'End Point' text: #key;
		column: 'Operations'
			text: [ :anAssoc | anAssoc value gtPathsViewOperationsText ];
		column: 'Description'
			text: [ :anAssoc | anAssoc value gtPathsViewDescriptionText ];
		send: [ :anAssoc | anAssoc value gtPathsViewSendObject ]
]

{ #category : #accessing }
GtOpenApiSomePaths >> openApi [

	^ openApi
]

{ #category : #accessing }
GtOpenApiSomePaths >> openApi: anObject [

	openApi := anObject
]

{ #category : #accessing }
GtOpenApiSomePaths >> paths [

	^ paths
]

{ #category : #accessing }
GtOpenApiSomePaths >> paths: anObject [

	paths := anObject
]
