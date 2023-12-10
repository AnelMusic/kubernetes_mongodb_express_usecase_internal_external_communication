@echo off

call "set_secrets.bat"
call "apply_k8s_components.bat"

echo Execution of both batch files completed.
