posts := asciidoc/posts/1/index.html asciidoc/posts/2/index.html asciidoc/posts/3/index.html
 
deploy: build
	git commit -a -m "New version"
	git push

build: ${posts}
	asciidoctor asciidoc/index.asciidoc -o docs/index.html

asciidoc/posts/%/index.html: asciidoc/posts/%/index.asciidoc
	asciidoctor $? -o $@
	cp $@ $(subst asciidoc,docs,$(@))
	cp $(subst index.html,*.png,$(@)) $(subst asciidoc,docs,$(subst index.html,"",$(@))) 
	rm $@


