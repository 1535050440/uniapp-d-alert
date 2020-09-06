@echo off
title digitalrain
color 0a
setlocal ENABLEDELAYEDEXPANSION
for /l %%i in (0) do (
set "line="
for /l %%j in (1,1,80) do (
set /a Down%%j-=2
set "x=!Down%%j!"
if !x! LSS 0 (
set /a Arrow%%j=!random!%%3
set /a Down%%j=!random!%%15+10
)
set "x=!Arrow%%j!"
if "!x!" == "2" (
set "line=!line!!random:~-1! "
) else (set "line=!line! ")
)
set /p=!line!<nul
)