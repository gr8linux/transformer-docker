# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Create a user with a home directory
RUN useradd -m myuser

# Install system dependencies as root
USER root
RUN apt-get update && apt-get install -y \
    libgomp1 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Switch back to the non-root user
USER myuser
USER root
RUN mkdir /app/flagged && chown myuser:myuser /app/flagged
USER myuser
# Copy the current directory contents into the container at /app
COPY --chown=myuser:myuser . /app


# Create a directory for flagged data

# Set environment variables
ENV PATH="/home/myuser/.local/bin:${PATH}"
ENV PYTHONPATH="/home/myuser/.local/lib/python3.8/site-packages:${PYTHONPATH}"

# Upgrade pip and install required Python packages in one go
RUN python -m pip install --user --no-cache-dir --upgrade pip && \
    pip install --user --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu && \
    pip install --user --no-cache-dir -r requirements.txt

# Confirm installation
RUN pip list

# Make port 7860 available to the world outside this container
EXPOSE 7860

# Run app.py when the container launches
CMD ["python", "app.py"]
