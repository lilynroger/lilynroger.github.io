#!/bin/bash
for img in *4x3.jpeg; do
  name="${img%.*}" # Get filename without extension
  
  magick "$img" -resize 1200x "${name}-1200.avif"
  magick "$img" -resize 2400x "${name}-2400.avif"
  
  echo "Generated 4x3 sets for $img"
done

for img in *16x9.jpeg; do
  name="${img%.*}" # Get filename without extension
  
  magick "$img" -resize 1200x "${name}-1200.avif"
  magick "$img" -resize 2400x "${name}-2400.avif"
  
  echo "Generated 16x9 sets for $img"
done

for img in *3x4.jpeg; do
  name="${img%.*}" # Get filename without extension
  
  magick "$img" -resize 900x "${name}-900.avif"
  magick "$img" -resize 1800x "${name}-1800.avif"
  
  echo "Generated 3x4 sets for $img"
done
