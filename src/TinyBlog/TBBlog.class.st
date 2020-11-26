Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #TinyBlog
}

{ #category : #'as yet unclassified' }
TBBlog class >> createDemoPosts [
	"TBBlog dreate demo posts"

	self current 
	writeBlogPost: ((TBPost title: 'Welcome in TinyBlog' text:'TinyBlog is a small blog engine made with Pharo.' category:'TinyBlog') visible: true);writeBlogPost: ((TBPost title: 'Report Pharo Sprint' text:'Friday, June 12 there was a Pharo sprint / Moose dojo. It was anice event with more than 15 motivated sprinters. With the helpof candies, cakes and chocolate, huge work has been done'category: 'Pharo') visible: true);writeBlogPost: ((TBPost title: 'Brick on top of Bloc -Preview' text: 'We are happy to announce the first previewversion of Brick, a new widget set created from scratch on topof Bloc. Brick is being developed primarily by Alex Syrel(together with Alain Plantec, Andrei Chis and myself), and thework is sponsored by ESUG.Brick is part of the Glamorous Toolkit effort and will providethe basis for the new versions of the development tools.'category: 'Pharo') visible: true);
	writeBlogPost: ((TBPost title: 'The sad story of unclassifiedblog posts' text: 'So sad that I can read this.') visible: true);writeBlogPost: ((TBPost title: 'Working with Pharo on theRaspberry Pi' text: 'Hardware is getting cheaper and many newsmall devices like the famous Raspberry Pi provide newcomputation power that was one once only available on regulardesktop computers.' category: 'Pharo') visible: true)
]

{ #category : #accessing }
TBBlog class >> current [ 
	"answer the instance of the TBRepository"

	^ uniqueInstance ifNil: [ uniqueInstance:=self new ]
]

{ #category : #accessing }
TBBlog class >> initialize [ self reset
]

{ #category : #initialization }
TBBlog class >> reset [ 
uniqueInstance := nil
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPosts [
	^ posts
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPostsFromCategory: aCategory [
	^ posts select:[:p|p category = aCategory ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allCategories [
	^ (self allBlogPosts collect: [ :p|p category ] )asSet
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPosts [
	^ posts select: [ :p|p isVisible ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :p|p category=aCategory and: [ p isVisible ] ]
]

{ #category : #comparing }
TBBlog >> initialize [ 
super initialize.
posts := OrderedCollection new
]

{ #category : #'as yet unclassified' }
TBBlog >> removeAllPosts [
	posts:=OrderedCollection new
]

{ #category : #'as yet unclassified' }
TBBlog >> size [ ^ posts size
]

{ #category : #'as yet unclassified' }
TBBlog >> writeBlogPost: aTBPost [ 
"Add the blog post to the list of posts"
	posts add: aTBPost
]
