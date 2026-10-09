# Per-frame hand observation from zed_hand_node.
#
# Published for EVERY processed ZED frame (when detection is enabled), also
# when no hand is found: then valid=false and the geometric fields are NaN.
# This is the stream recorded for imitation learning; the older
# /hand_pose_with_features and /right_hand_pose_base topics are only published
# when the fingertip is valid and stay unchanged for the FSM.
#
# Frames: everything below is in xarm_base (= link_base), metres.

std_msgs/Header header            # stamp = ZED image capture time (same clock as /zed2/left/image_raw)

uint8 n_hands                     # hands MediaPipe saw in this frame (any label)
bool target_found                 # a hand with the target handedness label was found
bool valid                        # hand frame (palm pose) available
bool fingertip_valid              # index-fingertip 3D point available
float32 detection_confidence      # MediaPipe handedness score of the selected hand
string preproc                    # MediaPipe input that produced the result: "none" | "gray"

# Hand frame (rsn/hand_frame.py): origin = palm centre, z = out of the palm,
# x = wrist -> middle-finger MCP (in palm plane), y = z x x.
geometry_msgs/Pose palm_pose
float64[3] palm_normal            # = hand frame z
float64[3] finger_direction       # = hand frame x
float32 palm_fit_rms_m            # plane-fit residual of the palm points
uint8 palm_n_points               # palm landmarks with valid depth

geometry_msgs/Point fingertip     # index fingertip (landmark 8)
float32 openness                  # thumb-index tip distance in normalized landmark space

# Raw MediaPipe landmarks of the selected hand, 21 x (x, y, z) flattened:
# x, y normalized image coords of the ZED left image, z MediaPipe relative depth.
# Empty when no target hand was found.
float32[] landmarks
