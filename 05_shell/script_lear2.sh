#!/bin/bash
echo "Files in directory"
ls $1 
echo "Count files directory"
ls $1 | wc -l
