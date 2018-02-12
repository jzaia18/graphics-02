display: convert
	display image.png

all: line.rb
	ruby line.rb

cat: all
	cat image.ppm

convert: all
	convert image.ppm image.png
	rm image.ppm

clean:
	rm *~ *.ppm *.png
