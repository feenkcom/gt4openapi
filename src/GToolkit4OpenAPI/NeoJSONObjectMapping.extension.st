Extension { #name : #NeoJSONObjectMapping }

{ #category : #'*GToolkit4OpenAPI' }
NeoJSONObjectMapping >> mapOpenApiField: fieldName [
	^ self mapOpenApiField: fieldName to: fieldName
]

{ #category : #'*GToolkit4OpenAPI' }
NeoJSONObjectMapping >> mapOpenApiField: fieldName to: propertyName [
	^ self
		mapProperty: propertyName
		getter: [ :object | object fields fieldAt: fieldName ]
		setter: [ :object :value | object fieldAt: fieldName put: value ]
]
