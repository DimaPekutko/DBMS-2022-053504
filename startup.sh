#!/usr/bin/env bash

cd server
export PYTHONPATH=..

pip install -r requirements.txt
python3 -m uvicorn main:app --reload
