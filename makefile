all: line.rb
	ruby line.rb

cat: all
	cat image.ppm

convert: all
	convert image.ppm image.png

display: convert
	display image.png

clean:
	rm *~ *.ppm *.png
