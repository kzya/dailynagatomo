require 'opencv'
include OpenCV
load './lib/edge_detection.rb'


detection = Image.new()

detection.edge
detection.line_detection
detection.line_draw
detection.output_show
