ALL_OUTPUT=build/render.png build/strap_adapter.stl

all: $(ALL_OUTPUT)

build/render.png: strap_adapter.scad
	openscad -o$@-tmp.png --imgsize=1024,1024 \
             --colorscheme=Nature $< \
         && cat $@-tmp.png | pngtopnm | pnmcrop | pnmscale 0.25 | pnmtopng > $@
	rm -f $@-tmp.png

build/strap_adapter.stl: strap_adapter.scad
	openscad -o $@ $<

clean:
	rm -f $(ALL_OUTPUT)
