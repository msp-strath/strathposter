# -- [ Makefile ]

# -- [ Options ]

LATEXMK      := latexmk
LATEXMK_OPTS := -pdf -bibtex -outdir="__build"

SOURCES := ${shell ls *.tex}

EXTENSIONS := -auto_identifiers

# --  [ Building ]

%.pdf: %.tex
	mkdir -p output/
	${LATEXMK} ${LATEXMK_OPTS} -gg $<
	cp __build/$@ output/$@

.PHONY: preview

preview:
	${LATEXMK} ${LATEXMK_OPTS} -gg -pvc poster.tex


# -- [ Cleaning ]

.PHONY: clobber clean

clean:
	${LATEXMK} -c

clobber:
	rm -rf __build/ auto/ output/
	find . -name "*~" -delete
	${LATEXMK} -C
# -- [ EOF ]
