NAME = myproject
STACKLIBFILE = $(shell stack path --local-install-root)/lib/lib$(NAME).so
GODOTPROJECT = $(shell stack path --project-root)/game
all: stack
nix:
	nix-build shell.nix
	cp result/lib/ghc-*/lib$(NAME).so $(GODOTPROJECT)/lib
stack:
	stack build --fast --force-dirty
	cp $(STACKLIBFILE) $(GODOTPROJECT)/lib
stack-nix:
	stack --nix clean $(NAME)
	stack --nix build
	cp $(shell stack --nix path --local-install-root)/lib/lib$(NAME).so $(GODOTPROJECT)/lib
stack-run:
	stack build
	cp $(STACKLIBFILE) $(GODOTPROJECT)/lib
	godot -e --path ./game
stack-watch:
	stack build --file-watch --fast --exec "cp $(STACKLIBFILE) $(GODOTPROJECT)/lib"
updatelib:
	cp $(STACKLIBFILE) $(GODOTPROJECT)/lib
