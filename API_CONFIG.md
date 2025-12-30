# API Configuration Guide

## Current Setup

The API base URL is configured in `lib/core/config/app_config.dart`.

### Development (Debug Mode)
- URL: `http://173.242.53.114:8080`
- Used when running in debug mode locally

### Production
- URL: Configured based on your deployment setup
- Update the `apiBaseUrl` getter in `app_config.dart`

## Configuration Options

### Option 1: Backend on Same Domain (Recommended)

If your backend is on the same domain as the frontend:

1. Update `app_config.dart`:
```dart
static String get apiBaseUrl {
  if (kDebugMode) {
    return 'http://173.242.53.114:8080';
  } else {
    return 'https://yourdomain.com/api';
  }
}
```

2. The nginx configuration (in `scripts/deploy.sh`) already includes a proxy:
```nginx
location /api/ {
    proxy_pass http://localhost:8080/;
    ...
}
```

This means:
- Frontend: `https://yourdomain.com`
- API: `https://yourdomain.com/api` → proxies to `http://localhost:8080`

### Option 2: Backend on Subdomain

If your backend is on a subdomain (e.g., `api.yourdomain.com`):

1. Update `app_config.dart`:
```dart
static String get apiBaseUrl {
  if (kDebugMode) {
    return 'http://173.242.53.114:8080';
  } else {
    return 'https://api.yourdomain.com';
  }
}
```

2. Set up separate nginx config for the API subdomain

### Option 3: Backend on Different Domain/Port

If your backend stays on the VPS IP with port:

1. Update `app_config.dart`:
```dart
static String get apiBaseUrl {
  if (kDebugMode) {
    return 'http://173.242.53.114:8080';
  } else {
    return 'http://173.242.53.114:8080';  // Or use HTTPS if configured
  }
}
```

**Note:** Using HTTP in production is not recommended. Set up SSL for the backend.

## CORS Configuration

Make sure your backend allows requests from your frontend domain:

- Frontend domain: `https://yourdomain.com`
- Allow origin: `https://yourdomain.com` (or `*` for development)

## Testing

After deployment, test the API connection:

```bash
# Test from browser console
fetch('https://yourdomain.com/api/auth/me')
  .then(r => r.json())
  .then(console.log)
  .catch(console.error);
```

## Security Notes

1. **HTTPS**: Always use HTTPS in production
2. **CORS**: Configure CORS properly on backend
3. **API Keys**: If using API keys, store them securely (not in code)
4. **Environment Variables**: Consider using environment variables for sensitive config

