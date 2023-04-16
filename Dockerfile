# Use the official Golang image as the base image for the builder stage
FROM golang:1.17-alpine as builder

# Set the working directory
WORKDIR /app

# Copy the Go files and go.mod into the container
COPY main.go go.mod ./

# Build the Go application with CGO disabled
RUN CGO_ENABLED=0 go build -ldflags="-w -s" -o main

# Create the minimal runtime image using the scratch image
FROM scratch

# Set the working directory
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/main /app/main

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the application
CMD ["/app/main"]
