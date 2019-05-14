NAME = demo

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    LIBNAME = lib$(NAME).so
endif
ifeq ($(UNAME_S),Darwin)
    LIBNAME = lib$(NAME).dylib
endif

STACKLIBFILE = $(shell stack path --local-install-root)/lib/$(LIBNAME)
GODOTPROJECT = $(shell stack path --project-root)/game
all: stack
nix:
	nix-build shell.nix
	cp result/lib/ghc-*/$(LIBNAME) $(GODOTPROJECT)/lib
stack:
	stack build --fast
	cp $(STACKLIBFILE) $(GODOTPROJECT)/lib
stack-nix:
	stack --nix clean $(NAME)
	stack --nix build
	cp $(shell stack --nix path --local-install-root)/lib/$(LIBNAME) $(GODOTPROJECT)/lib
stack-run:
	nix-build shell.nix
	cp $(STACKLIBFILE) $(GODOTPROJECT)/lib
	godot --path ./game
stack-watch:
	stack build --file-watch --exec "cp $(STACKLIBFILE) $(GODOTPROJECT)/lib"
