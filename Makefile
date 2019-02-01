manuscript.pdf: manuscript.dvi
	dvipdfmx manuscript.dvi

manuscript.dvi: manuscript.tex description.tex
	export Tex_IgnoredWarnings="Underfull.\n.Overfull.\n. specifier changed to.\n. You have requested.\n. Missing number, treated as zero..\n. There were undefined references.\n. Citation %.%# undefined.\n. Font shape 'JT1/gt/m/it' undefined.\n. Font shape 'JY1/gt/m/it' undefined.\n. Font shape 'TS1/txsy/m/n' undefined.\n. Font shape 'T1/txsy/m/n' undefined.\n. Font shape 'JT1/mc/m/it' undefined.\n. Font shape 'JY1/mc/m/it' undefined.\n. LaTeX Font Warning: Some font shapes were not available, defaults substituted."
	export Tex_IgnoreLevel=14
	uplatex manuscript
	uplatex manuscript

description.tex: description.md
	@cat $^ \
	| pandoc -t latex \
	| sed 's/includegraphics/includegraphics[width=1.0\\columnwidth]/g' \
	| sed 's/\[htbp\]/\[t\]/g' \
	> description.tex 

clean:
	@rm -rf manuscript.{pdf,aux,dvi,log,out,blg} *.xbb
	