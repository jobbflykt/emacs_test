.PHONY: all test

all: lisp

TOP := .
LOAD_PATH = -L $(TOP)
EMACS ?= emacs
BATCH = $(EMACS) -Q --batch $(LOAD_PATH)

ELS = emacs_test.el
ELCS = $(ELS:.el=.elc)

lisp: $(ELCS)

%.elc: %.el
	$(BATCH) --eval "(when (file-exists-p \"$@\") (delete-file \"$@\"))" \
	-f batch-byte-compile $<

test:
	$(BATCH) --eval "\
	(progn \
	  (message \"%s\" (emacs-version)) \
	  (load-file \"$(TOP)/test_emacs_test.el\") \
	  (ert-run-tests-batch-and-exit))"
