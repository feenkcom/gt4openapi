Class {
	#name : #GtOCodeGenExamples,
	#superclass : #Object,
	#category : #'GToolkit4OpenAPI-Examples'
}

{ #category : #accessing }
GtOCodeGenExamples >> apiClient [
	<gtExample>
	"TODO this example generates code in the image - fix to not leave behind garbage"
	^ self components
]

{ #category : #accessing }
GtOCodeGenExamples >> codeGenerator [
	<gtExample>
	^ self components codeGenerator
]

{ #category : #accessing }
GtOCodeGenExamples >> components [
	<gtExample>
	|components|
	components := STONJSON fromString: self componentsJson.
	^ GtOComponents new rawData: (components value).
]

{ #category : #accessing }
GtOCodeGenExamples >> componentsJson [
	^ '
"components": {
  "schemas": {
    "Category": {
      "type": "object",
      "properties": {
        "id": {
          "type": "integer",
          "format": "int64"
        },
        "Name": {
          "type": "string"
        }
      }
    },
    "Tag": {
      "type": "object",
      "properties": {
        "id": {
          "type": "integer",
          "format": "int64"
        },
        "Name": {
          "type": "string"
        }
      }
    }
  }
}'
]

{ #category : #accessing }
GtOCodeGenExamples >> firstSchema [
	<gtExample>
	^ self schemas at:'Tag'.
]

{ #category : #accessing }
GtOCodeGenExamples >> firstSchemaProperties [
	<gtExample>
	^ self firstSchema properties
]

{ #category : #accessing }
GtOCodeGenExamples >> generatedClasses [
	<gtExample>
	<noTest>
	|firstSchema|
	firstSchema := self firstSchema.
	^ self codeGenerator generateClassFor:firstSchema withProperties: self firstSchemaProperties
]

{ #category : #accessing }
GtOCodeGenExamples >> schemas [
	<gtExample>
	^ self components schemas 
]
