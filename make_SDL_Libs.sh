for SCRIPT in scripts/*.sh; do "$SCRIPT" || { echo "$SCRIPT: Failed."; exit 1; } done

