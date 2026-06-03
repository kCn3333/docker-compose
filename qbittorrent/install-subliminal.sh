#!/bin/bash
# Check if subliminal is installed; if not, install it automatically
if [ ! -f /usr/local/bin/subliminal ]; then
    echo ">>>> Custom Init: Installing Subliminal..."
    python3 -m venv /opt/subliminal-env
    /opt/subliminal-env/bin/pip install --no-cache-dir subliminal
    ln -s /opt/subliminal-env/bin/subliminal /usr/local/bin/subliminal
    echo ">>>> Custom Init: Subliminal installation completed."
fi