posts := asciidoc/posts/1/index.html
 
deploy: ${posts}
	git commit -a -m "New version"
	git push

asciidoc/posts/%/index.html: asciidoc/posts/%/index.asciidoc
	asciidoctor $? -o $@
	cp $@ $(subst asciidoc,site,$(@))
	$(eval css := $(subst index.html,plain.css,$(@)))
	cp $(css) $(subst asciidoc,site,$(css))
	rm $@


