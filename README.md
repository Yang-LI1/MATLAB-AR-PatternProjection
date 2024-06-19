# MATLAB-AR-PatternProjection

## Project Overview
This repository hosts the MATLAB implementation of an augmented reality (AR) project that generates dynamic 3D projections from 2D patterns. Utilizing camera calibration techniques and homography, this project aims to augment the reality by overlaying 3D objects (cubes) onto 2D patterns captured in real-time.

## Features
- **Camera Calibration**: Utilizes MATLAB's camera calibrator to achieve precise intrinsic parameters.
- **Homography Computation**: Computes transformation matrices to map 2D points to 3D projections.
- **3D Projection**: Dynamically overlays 3D objects on detected 2D patterns using calculated projection matrices.

## Getting Started

### Prerequisites
- MATLAB R2021a or later
- Computer Vision Toolbox
- Image Processing Toolbox

### Installation
Clone the repository to your local machine:
```bash
git clone https://github.com/Yang-LI1/MATLAB-AR-PatternProjection.git
```
### Navigate to the project directory:
```bash
cd MATLAB-AR-PatternProjection
```

## Usage
Open MATLAB and navigate to the project folder, then run the main script:
```bash
run main.m
```

