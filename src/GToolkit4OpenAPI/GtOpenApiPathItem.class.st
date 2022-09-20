Class {
	#name : #GtOpenApiPathItem,
	#superclass : #Object,
	#instVars : [
		'ref',
		'summary',
		'description',
		'get',
		'put',
		'post',
		'delete',
		'options',
		'head',
		'patch',
		'trace',
		'servers',
		'parameters'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiPathItem >> delete [

	^ delete
]

{ #category : #accessing }
GtOpenApiPathItem >> delete: anObject [

	delete := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiPathItem >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> get [

	^ get
]

{ #category : #accessing }
GtOpenApiPathItem >> get: anObject [

	get := anObject
]

{ #category : #'gt - extensions' }
GtOpenApiPathItem >> gtParametersFor: aView [
	<gtView>
	self parameters ifNil: [ ^ aView empty ].

	^ aView columnedList
		title: 'Parameters';
		priority: 10;
		items: [ self parameters ];
		column: ''
			text: [ :_ :anIndex | anIndex asRopedText foreground: BrGlamorousColors disabledButtonTextColor ]
			width: 40;
		column: 'Name' text: [ :aParameter | aParameter name ];
		column: 'In' text: [ :aParameter | aParameter inLocation ];
		column: 'Description'
			text: [ :aParameter | aParameter description ]
			weight: 2;
		column: 'Status'
			text: [ :aParameter | aParameter gtParametersViewStatusText ]
]

{ #category : #accessing }
GtOpenApiPathItem >> head [

	^ head
]

{ #category : #accessing }
GtOpenApiPathItem >> head: anObject [

	head := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> options [

	^ options
]

{ #category : #accessing }
GtOpenApiPathItem >> options: anObject [

	options := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> parameters [

	^ parameters
]

{ #category : #accessing }
GtOpenApiPathItem >> parameters: anObject [

	parameters := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> patch [

	^ patch
]

{ #category : #accessing }
GtOpenApiPathItem >> patch: anObject [

	patch := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> post [

	^ post
]

{ #category : #accessing }
GtOpenApiPathItem >> post: anObject [

	post := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> put [

	^ put
]

{ #category : #accessing }
GtOpenApiPathItem >> put: anObject [

	put := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> ref [

	^ ref
]

{ #category : #accessing }
GtOpenApiPathItem >> ref: anObject [

	ref := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> servers [

	^ servers
]

{ #category : #accessing }
GtOpenApiPathItem >> servers: anObject [

	servers := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> summary [

	^ summary
]

{ #category : #accessing }
GtOpenApiPathItem >> summary: anObject [

	summary := anObject
]
