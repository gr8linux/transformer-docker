# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Create a user to run the application (non-root user)
# You can name the user as per your preference
RUN useradd -m myuser
USER myuser
# Update the PATH to include the local update and packages
ENV PATH="${PATH}:/home/myuser/.local/bin"
# Copy the current directory contents into the container at /app
COPY --chown=myuser:myuser . /app 


# Upgrade pip and install any needed packages specified in requirements.txt
# As a non-root, use --user option if global installation is restricted
RUN python -m pip install --user --no-cache-dir --upgrade pip

RUN pip install --user --no-cache-dir -r requirements.txt


# The user already has its home directory /home/myuser, use that for any user-specific data
ENV PATH="/home/myuser/.local/bin:${PATH}"

# Make port 7860 available to the world outside this container
EXPOSE 7860

# Run app.py when the container launches
CMD ["python", "app.py"]
