.PHONY: all
all: workflow.pdf workflow.html design_document.pdf

.PHONY: open
open: workflow.pdf
	open workflow.pdf

workflow.pdf: workflow.md graph1.pdf
	pandoc workflow.md -o workflow.pdf --latex-engine xelatex --listings

workflow.html: workflow.md graph1.pdf
	pandoc workflow.md -o workflow.html --highlight-style pygments

graph1.pdf: graph1.dot
	dot graph1.dot -Gdpi=50 -Tpdf -o graph1.pdf

design_document.pdf: design_document.md pictures/architecture.pdf pictures/example_graph.pdf
	pandoc design_document.md -o design_document.pdf --toc  -V geometry:margin=1in --latex-engine xelatex

clean:
	rm -f *.pdf *.html
