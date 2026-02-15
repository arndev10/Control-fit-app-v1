'use client'

import { useState } from 'react'
import { authApi, getApiUrl } from '@/lib/api'
import { useRouter } from 'next/navigation'
import Layout from '@/components/Layout'

export default function RegisterPage() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')
    setLoading(true)

    try {
      const response = await authApi.register(email, password)
      console.log('Registro exitoso:', response.data)
      router.push('/login?registered=true')
    } catch (err: any) {
      console.error('Error completo:', err)
      console.error('Error response:', err.response)
      console.error('Error code:', err.code)
      console.error('Error message:', err.message)
      
      let errorMessage = 'Error al registrarse'
      
      // Network errors (only if there's no response from server)
      if (!err.response) {
        if (err.code === 'ECONNREFUSED' || err.code === 'ERR_NETWORK' || err.message?.includes('Network Error') || err.message?.includes('Failed to fetch')) {
          const apiUrl = getApiUrl()
          if (apiUrl.startsWith('http://localhost')) {
            errorMessage = `No se pudo conectar. La app está usando: ${apiUrl}. Haz Redeploy en Vercel (sin caché) para usar el backend en Render.`
          } else {
            errorMessage = `No se pudo conectar al backend (${apiUrl}). Comprueba: 1) En Render, variable CORS_ORIGINS = URL de tu app en Vercel. 2) Abre ${apiUrl} en otra pestaña para activar el servidor (plan Free se duerme).`
          }
        } else if (err.code === 'ERR_INTERNET_DISCONNECTED' || !navigator.onLine) {
          errorMessage = 'Sin conexión a internet'
        } else {
          errorMessage = `Error de conexión: ${err.message || 'Desconocido'}`
        }
      } else if (err.response) {
        const status = err.response.status
        const data = err.response.data
        
        console.log('Status:', status, 'Data:', data)
        
        if (status === 422) {
          // Validation error
          if (Array.isArray(data.detail)) {
            errorMessage = data.detail.map((e: any) => {
              const field = e.loc ? e.loc.join('.') : 'campo'
              const msg = e.msg || 'Error de validación'
              return `${field}: ${msg}`
            }).join(', ')
          } else if (data.detail) {
            errorMessage = typeof data.detail === 'string' ? data.detail : JSON.stringify(data.detail)
          }
        } else if (status === 400) {
          errorMessage = data.detail || 'Email ya registrado'
        } else if (status === 500) {
          errorMessage = data.detail || 'Error interno del servidor. Intenta nuevamente.'
        } else if (data.detail) {
          errorMessage = typeof data.detail === 'string' ? data.detail : JSON.stringify(data.detail)
        } else if (data.message) {
          errorMessage = data.message
        }
      } else if (err.message) {
        errorMessage = err.message
      }
      
      setError(errorMessage)
    } finally {
      setLoading(false)
    }
  }

  return (
    <Layout>
      <form onSubmit={handleSubmit} style={{ maxWidth: '400px', margin: '0 auto' }}>
        <h2>Registrarse</h2>
        {error && <div style={{ color: 'red', marginBottom: '1rem' }}>{error}</div>}
        <div style={{ marginBottom: '1rem' }}>
          <label>
            Email:
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              style={{ width: '100%', padding: '0.5rem', marginTop: '0.25rem' }}
            />
          </label>
        </div>
        <div style={{ marginBottom: '1rem' }}>
          <label>
            Contraseña:
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
              style={{ width: '100%', padding: '0.5rem', marginTop: '0.25rem' }}
            />
          </label>
        </div>
        <button 
          type="submit" 
          disabled={loading}
          style={{ 
            width: '100%', 
            padding: '0.75rem', 
            backgroundColor: '#0070f3',
            color: 'white',
            border: 'none',
            borderRadius: '4px',
            cursor: loading ? 'not-allowed' : 'pointer'
          }}
        >
          {loading ? 'Registrando...' : 'Registrarse'}
        </button>
      </form>
    </Layout>
  )
}
