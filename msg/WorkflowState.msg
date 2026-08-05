# WorkflowState
#
# Snapshot of workflow_state_estimator's belief. Published every time an
# incoming HandoverEvent changes the belief. Latched (transient_local) so
# late subscribers (e.g. FlexBE states started mid-procedure) see the
# current state immediately.

std_msgs/Header header

# --- current step ---
string current_step_id
string current_step_name
int32  current_step_index
int32  total_steps

# tools already delivered in this step, in delivery order
string[] tools_delivered_this_step

# tools still expected in this step, in preload order (excluding delivered ones)
string[] tools_remaining_this_step

# --- prediction (drives preload) ---
string predicted_next_tool          # "" if end-of-workflow / no robot tools remain
string predicted_next_step_id       # "" if prediction stays inside current step

# reserved for future probabilistic upgrade; always 1.0 in v1
float32 confidence
