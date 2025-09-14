const jsonServer = require('json-server')
const server = jsonServer.create()
const router = jsonServer.router('db.json')
const middlewares = jsonServer.defaults()

// Custom routes to handle specific endpoints
const routes = {
  '/api/courses/popular': '/courses/popular',
  '/api/categories': '/categories',
  '/api/mentors': '/mentors',
  '/api/profile': '/profile',
  '/api/promote': '/promote',
  '/api/search/suggestions': '/search/suggestions',
  '/api/search/history': '/searchHistory',
  '/api/courses': '/courses',
  '/api/course/:id': '/course/:id',
  '/api/courses/:id/lessons': '/courses/:id/lessons',
  '/api/courses/:id/reviews': '/courses/:id/reviews',
  '/api/login': '/login'
}

server.use(middlewares)
server.use(jsonServer.rewriter(routes))
server.use('/api', router)
server.listen(3000, () => {
  console.log('JSON Server is running on http://localhost:3000')
  console.log('API endpoints available at http://localhost:3000/api')
})
