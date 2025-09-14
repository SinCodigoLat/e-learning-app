#!/usr/bin/env python3
import json
import http.server
import socketserver
from urllib.parse import urlparse, parse_qs

class APIHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        # Parse the URL
        parsed_path = urlparse(self.path)
        path = parsed_path.path
        
        # Load the database
        with open('db.json', 'r') as f:
            db = json.load(f)
        
        # Route handling
        if path == '/api/courses/popular':
            data = db.get('courses/popular', [])
        elif path == '/api/categories':
            data = db.get('categories', [])
        elif path == '/api/mentors':
            data = db.get('mentors', [])
        elif path == '/api/profile':
            data = db.get('profile', {})
        elif path == '/api/promote':
            data = db.get('promote', [])
        elif path == '/api/search/suggestions':
            data = db.get('search/suggestions', [])
        elif path == '/api/search/history':
            data = db.get('searchHistory', [])
        elif path == '/api/courses':
            data = db.get('courses', [])
        elif path.startswith('/api/course/'):
            course_id = path.split('/')[-1]
            data = db.get('course', {}).get(course_id, {})
        elif path.startswith('/api/courses/') and '/lessons' in path:
            course_id = path.split('/')[2]
            data = db.get(f'courses/{course_id}/lessons', [])
        elif path.startswith('/api/courses/') and '/reviews' in path:
            course_id = path.split('/')[2]
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
    PORT = 3000
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
