Extension { #name : #String }

{ #category : #'*Football' }
String >> removeLowercaseAccents [

	| newString |
	newString := self copy.
	newString := newString copyReplaceAll: 'á' with: 'a'.
	newString := newString copyReplaceAll: 'à' with: 'a'.
	newString := newString copyReplaceAll: 'â' with: 'a'.
	newString := newString copyReplaceAll: 'ä' with: 'a'.
	newString := newString copyReplaceAll: 'å' with: 'a'.
	
	newString := newString copyReplaceAll: 'è' with: 'e'.
	newString := newString copyReplaceAll: 'é' with: 'e'.
	newString := newString copyReplaceAll: 'ê' with: 'e'.
	
	newString := newString copyReplaceAll: 'î' with: 'i'.
	newString := newString copyReplaceAll: 'í' with: 'i'.
	
	newString := newString replaceAll: 'ô' with: 'o'.
	newString := newString copyReplaceAll: 'ö' with: 'o'.	
	newString := newString copyReplaceAll: 'ó' with: 'o'.
	newString := newString copyReplaceAll: 'ò' with: 'o'.
	
	newString := newString copyReplaceAll: 'û' with: 'u'.
	newString := newString copyReplaceAll: 'ü' with: 'u'.
	newString := newString copyReplaceAll: 'ú' with: 'u'.
	newString := newString copyReplaceAll: 'ù' with: 'u'.
	
	newString := newString copyReplaceAll: 'ç' with: 'c'.
	
	^ newString
]
