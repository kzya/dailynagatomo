require 'opencv'
include OpenCV
load './lib/edge_detection.rb'


detection = Image.new("./utils/images/many_pieces.jpg")

detection.edge
detection.line_detection
detection.output_show
