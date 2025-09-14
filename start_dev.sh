#!/bin/bash

echo "🚀 Starting E-Learning App Development Environment"
echo "=================================================="

# Kill any existing processes
echo "🧹 Cleaning up existing processes..."
pkill -f "python3 api_server.py" 2>/dev/null
pkill -f "flutter run" 2>/dev/null

# Start the mock API server
echo "📡 Starting Mock API Server..."
python3 api_server.py &
API_PID=$!
echo "✅ API Server started with PID: $API_PID"

# Wait a moment for the server to start
sleep 3

# Test the API server
echo "🔍 Testing API endpoints..."
if curl -s http://localhost:3001/profile > /dev/null; then
    echo "✅ API Server is responding correctly"
else
    echo "❌ API Server is not responding"
    exit 1
fi

# Start Flutter app
echo "📱 Starting Flutter app..."
flutter run --flavor dev --target=lib/main_dev.dart -d "iPhone 16 Pro" &
FLUTTER_PID=$!
echo "✅ Flutter app started with PID: $FLUTTER_PID"

echo ""
echo "🎉 Development environment is ready!"
echo "=================================="
echo "📡 Mock API Server: http://localhost:3001"
echo "📱 Flutter App: Running on iPhone 16 Pro simulator"
echo ""
echo "Available API endpoints:"
echo "  • GET /api/courses/popular"
echo "  • GET /api/categories"
echo "  • GET /api/mentors"
echo "  • GET /api/profile"
echo "  • GET /api/promote"
echo "  • GET /api/search/suggestions"
echo "  • GET /api/search/history"
echo "  • GET /api/courses"
echo "  • GET /api/course/{id}"
echo "  • GET /api/courses/{id}/lessons"
echo "  • GET /api/courses/{id}/reviews"
echo ""
echo "To stop the development environment, press Ctrl+C"

# Wait for user to stop
wait
