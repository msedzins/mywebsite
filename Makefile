posts := asciidoc/posts/1/index.html
 
deploy: build
	git commit -a -m "New version"
	git push

build: ${posts}
	asciidoctor asciidoc/index.asciidoc -o docs/index.html

asciidoc/posts/%/index.html: asciidoc/posts/%/index.asciidoc
	asciidoctor $? -o $@
	cp $@ $(subst asciidoc,docs,$(@))
	rm $@


