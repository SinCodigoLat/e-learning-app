#!/usr/bin/env python3
import json
import http.server
import socketserver
from urllib.parse import urlparse, parse_qs

class APIHandler(http.server.SimpleHTTPRequestHandler):
    def do_POST(self):
        path = self.path
        content_length = int(self.headers.get('Content-Length', 0))
        post_data = self.rfile.read(content_length)
        
        # Handle logout endpoint
        if path == '/logout' or path == '/api/logout':
            self._send_json_response({"message": "Logged out successfully"})
            return
        
        # For other POST requests, send 404
        self._send_error_response(404, "POST endpoint not found")
    
    def do_GET(self):
        # Parse the URL
        parsed_path = urlparse(self.path)
        path = parsed_path.path
        
        # Load the database
        with open('db.json', 'r') as f:
            db = json.load(f)
        
        # Route handling - support both /api/ and direct routes
        # Remove /api prefix if present for consistent handling
        clean_path = path.replace('/api', '') if path.startswith('/api') else path
        
        if clean_path == '/courses/popular':
            data = db.get('courses/popular', [])
        elif clean_path == '/categories':
            data = db.get('categories', [])
        elif clean_path == '/mentors':
            data = db.get('mentors', [])
        elif clean_path == '/profile':
            data = db.get('profile', {})
        elif clean_path == '/promote':
            data = db.get('promote', [])
        elif clean_path == '/search/suggestions':
            data = db.get('search/suggestions', [])
        elif clean_path == '/search/history':
            data = db.get('searchHistory', [])
        elif clean_path == '/courses':
            data = db.get('courses', [])
        elif clean_path.startswith('/course/'):
            course_id = clean_path.split('/')[-1]
            data = db.get('course', {}).get(course_id, {})
        elif clean_path.startswith('/courses/') and '/lessons' in clean_path:
            course_id = clean_path.split('/')[2]
            data = db.get(f'courses/{course_id}/lessons', [])
        elif clean_path.startswith('/courses/') and '/reviews' in clean_path:
            course_id = clean_path.split('/')[2]
            data = db.get(f'courses/{course_id}/reviews', [])
        else:
            # Default to serving the file directly
            return super().do_GET()
        
        # Wrap in API response format
        response = {
            "success": True,
            "data": data,
            "message": "Success"
        }
        
        # Send response
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type, Authorization')
        self.end_headers()
        
        response_json = json.dumps(response, indent=2)
        self.wfile.write(response_json.encode('utf-8'))
    
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type, Authorization')
        self.end_headers()

if __name__ == "__main__":
    PORT = 3001
    with socketserver.TCPServer(("", PORT), APIHandler) as httpd:
        print(f"API Server running on http://localhost:{PORT}")
        print("Available endpoints:")
        print("  GET /api/courses/popular")
        print("  GET /api/categories")
        print("  GET /api/mentors")
        print("  GET /api/profile")
        print("  GET /api/promote")
        print("  GET /api/search/suggestions")
        print("  GET /api/search/history")
        print("  GET /api/courses")
        print("  GET /api/course/{id}")
        print("  GET /api/courses/{id}/lessons")
        print("  GET /api/courses/{id}/reviews")
        httpd.serve_forever()
