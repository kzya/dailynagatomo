require 'opencv'
include OpenCV
load './lib/edge_detection.rb'


detection = Image.new("./utils/images/many_pieces.bmp")

detection.edge
detection.line_detection
detection.output_show
