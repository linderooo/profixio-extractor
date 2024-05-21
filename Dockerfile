# Use an official Python runtime as a base image
FROM python:3.9-slim-buster

# Set environment variables for non-interactive package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies required by some Python packages
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    libgl1-mesa-glx \
    ghostscript \
    python3-tk \
    tesseract-ocr \
    poppler-utils \
    build-essential \ 

# Upgrade pip for potential new features/security fixes
RUN pip install --upgrade pip

# Install Python packages using pip (and a requirements.txt file for better organization)
COPY requirements.txt .
RUN pip install -r requirements.txt 

# Copy your application code
COPY main.py .
COPY report.pdf .

ENTRYPOINT ["python", "main.py"]



