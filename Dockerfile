# Use the official Python image as the base image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Create a user with limited privileges
RUN useradd --create-home appuser
USER appuser

# Copy requirements.txt into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --user --trusted-host pypi.python.org -r requirements.txt

# Copy the rest of the application files into the container
COPY --chown=appuser:appuser . .

# Make port 80 available to the world outside this container
EXPOSE 8000

# Run the application
CMD ["python", "app.py"]
