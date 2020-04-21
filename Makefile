ALL_OUTPUT=build/render.png build/strap_adapter.stl

all: $(ALL_OUTPUT)

build/render.png: strap_adapter.scad
	openscad -o$@ --imgsize=1024,1024 --colorscheme=Nature $<

build/strap_adapter.stl: strap_adapter.scad
	openscad -o $@ $<

clean:
	rm -f $(ALL_OUTPUT)
