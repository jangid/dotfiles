all: init.elc lisp/*.elc

init.elc: init.el
	emacs -batch -f batch-byte-compile $^

lisp/*.elc: lisp/*.el
	emacs -batch -f batch-byte-compile $^

clean:
	rm init.elc lisp/*.elc
