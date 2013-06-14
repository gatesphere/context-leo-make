#@+leo-ver=5-thin
#@+node:peckj.20130614104551.2205: * @file Makefile
#@@language makefile
#@@tabwidth 4

## tools
CTX = context
MTX = mtxrun

## ConTeXt project stuff
PROJNAME=test
ENV = env_$(PROJNAME).tex
PROJECT = project_$(PROJNAME).tex
PRODUCTS = $(sort $(dir $(wildcard prd_$(PROJNAME)_*/)))

## sources
SRCS = $(wildcard $(patsubst %,%prd*.tex,$(PRODUCTS)))

## targets
TARGETS = $(SRCS:.tex=.pdf)

.PHONY: clean default varcheck product help

# product shortcut (here there be dragons)
ifeq (product,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "product"
  PRODUCT_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(PRODUCT_ARGS):;@:)
endif

product: $(filter prd_$(PROJNAME)_$(PRODUCT_ARGS)/prd_$(PROJNAME)_$(PRODUCT_ARGS).pdf, $(TARGETS))

# display help by default
default: help

# all is pretty simple
all: $(TARGETS)

# make PDFs
%.pdf: %.tex
	$(CTX) $<

# remove ConTeXt temporary files
clean:
	$(MTX) --script cache --purge
	rm -f *.log *.tuc *.tuo

# print values of all variables in the Makefile
varcheck:
	@echo "CTX      = $(CTX)"
	@echo "MTX      = $(MTX)"
	@echo "PROJNAME = $(PROJNAME)"
	@echo "ENV      = $(ENV)"
	@echo "PROJECT  = $(PROJECT)"
	@echo "PRODUCTS = $(PRODUCTS)"
	@echo "SRCS     = $(SRCS)"
	@echo "TARGETS  = $(TARGETS)"

# print help (default)
help:
	@echo "Available targets are:"
	@echo "%.pdf               Compile a given PDF"
	@echo "all                 Compile all products"
	@echo "clean               Remove ConTeXt temporary files"
	@echo "varcheck            Print the value of all Makefile variables"
	@echo "product <name>      Compile the pdf for the product with the name <name>"

  
#@-leo
