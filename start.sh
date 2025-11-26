#!/bin/bash
set -e
cd frontend
npm install
npm run build
npm run preview -- --host 0.0.0.0
