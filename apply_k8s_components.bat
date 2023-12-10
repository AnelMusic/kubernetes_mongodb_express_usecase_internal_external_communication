@echo off

cd /d "%~dp0secrets"
echo Applying secrets...
for %%f in (*.yaml) do (
    kubectl apply -f "%%f"
)

cd /d "%~dp0configmaps"
echo Applying configmaps...
for %%f in (*.yaml) do (
    kubectl apply -f "%%f"
)

cd /d "%~dp0deployments"
echo Applying deployments...
for %%f in (*.yaml) do (
    kubectl apply -f "%%f"
)

echo All files applied successfully.
