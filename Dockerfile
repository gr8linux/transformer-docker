# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Create and switch to a new user
RUN useradd -m myuser
USER root
RUN apt-get update && apt-get install -y \
    libgomp1 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*
USER myuser
# After copying the application files
RUN mkdir /app/flagged && chown myuser:myuser /app/flagged

# Set environment variables
ENV PATH="/home/myuser/.local/bin:${PATH}"
ENV PYTHONPATH="/home/myuser/.local/lib/python3.8/site-packages:${PYTHONPATH}"

# Copy the current directory contents into the container at /app
COPY --chown=myuser:myuser . /app
# Installed required packages

# Upgrade pip and install required Python packages
RUN python -m pip install --user --no-cache-dir --upgrade pip
RUN pip install --user --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install --user --no-cache-dir -r requirements.txt

# Confirm installation
RUN pip list

# Make port 7860 available to the world outside this container
EXPOSE 7860

# Run app.py when the container launches
CMD ["python", "app.py"]
