export function getLimaDateString(date?: Date | string): string {
  if (typeof date === 'string' && date.match(/^\d{4}-\d{2}-\d{2}$/)) {
    return date
  }
  
  const d = date ? (typeof date === 'string' ? new Date(date) : date) : new Date()
  
  const limaDate = new Date(d.toLocaleString('en-US', { timeZone: 'America/Lima' }))
  
  const year = limaDate.getFullYear()
  const month = String(limaDate.getMonth() + 1).padStart(2, '0')
  const day = String(limaDate.getDate()).padStart(2, '0')
  
  return `${year}-${month}-${day}`
}

export function ensureDateString(date: string): string {
  if (!date || !date.match(/^\d{4}-\d{2}-\d{2}$/)) {
    return getLimaDateString(date)
  }
  return date
}

export function getLimaDate(date?: Date | string): Date {
  const d = date ? (typeof date === 'string' ? new Date(date) : date) : new Date()
  return new Date(d.toLocaleString('en-US', { timeZone: 'America/Lima' }))
}

/**
 * Parsea una fecha string (YYYY-MM-DD) a Date sin problemas de timezone
 * Usa mediodía local para evitar problemas de conversión de timezone
 */
export function parseDateSafe(dateString: string): Date {
  if (!dateString || typeof dateString !== 'string') {
    return new Date()
  }
  
  // Si ya es formato YYYY-MM-DD, parsear directamente
  const match = dateString.match(/^(\d{4})-(\d{2})-(\d{2})/)
  if (match) {
    const [, year, month, day] = match
    // Usar mediodía local para evitar problemas de timezone
    return new Date(parseInt(year), parseInt(month) - 1, parseInt(day), 12, 0, 0, 0)
  }
  
  // Si tiene tiempo, extraer solo la fecha
  const dateOnly = dateString.split('T')[0]
  const match2 = dateOnly.match(/^(\d{4})-(\d{2})-(\d{2})/)
  if (match2) {
    const [, year, month, day] = match2
    return new Date(parseInt(year), parseInt(month) - 1, parseInt(day), 12, 0, 0, 0)
  }
  
  // Fallback a Date normal
  return new Date(dateString)
}

/**
 * Formatea una fecha string (YYYY-MM-DD) a formato local sin problemas de timezone
 */
export function formatDateSafe(dateString: string, locale: string = 'es-ES'): string {
  const date = parseDateSafe(dateString)
  return date.toLocaleDateString(locale)
}
