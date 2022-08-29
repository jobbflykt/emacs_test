.PHONY: all test

all: lisp

ELS = emacs_test.el
ELCS = $(ELS:.el=.elc)

lisp: $(ELCS)

%.elc: %.el
	$(BATCH) --eval "(when (file-exists-p \"$@\") (delete-file \"$@\"))" \
	-f batch-byte-compile $<

test:
	$(BATCH) --eval "(progn \
	(load-file \"$(TOP)/emacs_test.el\")\
	(ert-run-tests-batch-and-exit))"
