std_msgs/Header header

# Hand position in robot base frame (meters)
geometry_msgs/Point position

# Palm normal vector in robot base frame (unit vector)
# Points outward from the palm surface
float64[3] palm_normal

# Finger direction in robot base frame (unit vector)
# Direction from wrist to middle fingertip
float64[3] finger_direction

# Hand openness: distance between thumb tip and index tip (meters, in normalized landmark space)
float64 openness

# MediaPipe handedness classification confidence
float64 detection_confidence
