#!/bin/bash

# This script will upload the vault to GitHub.

git add .

DATE=`date`
git commit -m "Backed up at $DATE"
git push origin main
