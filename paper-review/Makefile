all: review.pdf

%.pdf: %.md
	docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` pandoc/latex \
		$< \
	    --output $@ \
		--metadata=date:"`date "+%B %e, %Y"`" # Sets today's date. See https://github.com/jgm/pandoc/issues/2865

.PHONY: clean

clean: rm -rf *.pdf