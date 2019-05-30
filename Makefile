# Markdown files
SRC_MD = $(wildcard *.md)
DST_HTML = $(patsubst %.md,%.html,$(SRC_MD))

# All outputs.
DST_ALL = $(DST_HTML)

# Pandoc filters.
FILTERS = $(wildcard tools/filters/*.py)

# Inclusions.
INCLUDES = \
	-Vheader="$$(cat _includes/header.html)" \
	-Vfooter="$$(cat _includes/footer.html)" \
	-Vjavascript="$$(cat _includes/javascript.html)"

# Default action is to show what commands are available.
all : commands

## commands : Display available commands.
commands : Makefile
	@sed -n 's/^##//p' $<

## clean    : Clean up temporary and intermediate files.
clean :
	@rm -rf $$(find . -name '*~' -print)

## preview  : Build website locally for checking.
preview : $(DST_ALL)

## rsync    : rsync built site and assets to web server
rsync :
	rsync -av \
	README.rst \
	css \
	fig \
	*.html \
	intro-slides.pdf \
	douglatornell.ca:webapps/djl_static/training/meopeers-2015-06-15/

## settings : Show variables and settings.
settings :
	@echo 'SRC_MD:' $(SRC_MD)
	@echo 'DST_HTML:' $(DST_HTML)

# Pattern to build a generic page.
%.html : %.md _layouts/page.html $(FILTERS)
	pandoc -s -t html \
	--template=_layouts/page \
	--filter=tools/filters/blockquote2div.py \
	$(INCLUDES) \
	-o $@ $<
