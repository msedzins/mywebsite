posts := asciidoc/posts/1/index.html
 
deploy: build
	git commit -a -m "New version"
	git push

build: ${posts}

asciidoc/posts/%/index.html: asciidoc/posts/%/index.asciidoc
	asciidoctor $? -o $@
	cp $@ $(subst asciidoc,docs,$(@))
	rm $@


