require 'opencv'
include OpenCV
load './lib/edge_detection.rb'

detection = EdgeDetection.new()

detection.edge
