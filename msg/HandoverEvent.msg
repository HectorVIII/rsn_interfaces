# HandoverEvent
#
# Emitted by the FlexBE handover state machine at each milestone of a
# handover cycle. Consumed by workflow_state_estimator to track surgical
# progress and predict the next tool.
#
# Every event names one tool_class except a FAILED event raised before
# the target was locked in (in that case tool_class may be "").
#
# tool_class MUST match either:
#   - a key of instrument_grasp_table.yaml (robot-handled tools), or
#   - a token in the manual_only list of workflow_radius_approach.yaml
#     (e.g. "bipolar", "c_arm", "suture") for MANUAL_ACK events.

# --- event_type enum ---
uint8 REQUESTED   = 0   # voice target received, this tool is now the goal
uint8 GRASPED     = 1   # gripper closed on the tool at pickup pose
uint8 DELIVERED   = 2   # tool arrived at hand delivery pose, awaiting release
uint8 RELEASED    = 3   # gripper opened, surgeon has taken the tool
uint8 RETURNED    = 4   # tool placed back at source, gripper empty
uint8 MANUAL_ACK  = 5   # manual_only tool acknowledged; no robot motion
uint8 FAILED      = 6   # cycle aborted (grasp fail, tracking lost, timeout)

std_msgs/Header header
uint8 event_type
string tool_class
string reason           # free-text; use with FAILED, otherwise ""
