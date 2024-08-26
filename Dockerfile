# Use an official Python image as a base
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Install essential system packages
RUN apt-get update && \
    apt-get install -y \
    ffmpeg \           # Video processing tool
    wget \             # Utility to download files from the web
    git \              # To clone repositories if needed
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --upgrade pip

# Install youtube-dl or yt-dlp for downloading YouTube videos
# yt-dlp is a more actively maintained fork of youtube-dl
RUN pip install yt-dlp

# Install moviepy for video editing (you can use other tools depending on your needs)
RUN pip install moviepy

# Copy your script or application code into the container
COPY . .

# Set environment variables (optional)
ENV VIDEO_DOWNLOAD_PATH=/app/videos
ENV SHORT_VIDEO_PATH=/app/shorts

# Create necessary directories
RUN mkdir -p $VIDEO_DOWNLOAD_PATH $SHORT_VIDEO_PATH

# Expose any required ports (if you're running a web service)
# EXPOSE 8000

# Run a command to keep the container alive or start your script
# CMD ["python", "your_script.py"]
