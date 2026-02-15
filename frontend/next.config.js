/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  env: {
    // En producción usar Render si Vercel no inyecta la variable
    NEXT_PUBLIC_API_URL:
      process.env.NEXT_PUBLIC_API_URL ||
      (process.env.NODE_ENV === 'production'
        ? 'https://control-fit-app-v1-1.onrender.com'
        : 'http://localhost:8000'),
  },
}

module.exports = nextConfig
