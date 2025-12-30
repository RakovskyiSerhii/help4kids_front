# Deployment Guide

This guide will help you deploy the help4kids_front Flutter web application to your VPS.

## Prerequisites

- VPS with Ubuntu/Debian
- Domain name pointing to your VPS IP
- SSH access to your VPS
- Nginx installed
- SSL certificate (Let's Encrypt recommended)

## Step 1: Build the Application

On your local machine, run:

```bash
# Make scripts executable
chmod +x scripts/*.sh

# Build for production
./scripts/build_production.sh
```

Or use the deployment script with your domain:

```bash
./scripts/deploy.sh yourdomain.com
```

## Step 2: Prepare Your VPS

SSH into your VPS and install required software:

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Nginx
sudo apt install nginx -y

# Install Certbot for SSL
sudo apt install certbot python3-certbot-nginx -y

# Create web directory
sudo mkdir -p /var/www/help4kids_front
sudo chown -R $USER:$USER /var/www/help4kids_front
```

## Step 3: Upload Files

Upload the built files to your VPS. You can use SCP, SFTP, or rsync:

```bash
# Using SCP (from your local machine)
scp -r build/web/* user@your-vps-ip:/var/www/help4kids_front/

# Or using rsync
rsync -avz build/web/ user@your-vps-ip:/var/www/help4kids_front/
```

## Step 4: Configure Nginx

Copy the nginx configuration to your VPS:

```bash
# On your VPS
sudo cp nginx.conf /etc/nginx/sites-available/help4kids_front
sudo ln -s /etc/nginx/sites-available/help4kids_front /etc/nginx/sites-enabled/

# Remove default site (optional)
sudo rm /etc/nginx/sites-enabled/default

# Test nginx configuration
sudo nginx -t

# Reload nginx
sudo systemctl reload nginx
```

## Step 5: Set Up SSL Certificate

```bash
# Get SSL certificate from Let's Encrypt
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

# Certbot will automatically update your nginx config
# Test auto-renewal
sudo certbot renew --dry-run
```

## Step 6: Configure API Endpoint

Update the API base URL in `lib/core/config/app_config.dart`:

```dart
static String get apiBaseUrl {
  if (kDebugMode) {
    return 'http://173.242.53.114:8080';
  } else {
    // Use your production API URL
    return 'https://yourdomain.com/api';  // If backend is on same domain
    // OR
    return 'https://api.yourdomain.com';  // If backend is on subdomain
  }
}
```

If your backend is on the same VPS but different port, the nginx config already includes a proxy for `/api/` that forwards to `localhost:8080`.

## Step 7: Update Maintenance Mode

Before deploying, update the maintenance mode settings:

1. Edit `lib/core/maintenance/maintenance_service.dart`
2. Set `isMaintenanceModeEnabled = false` if you want the site live
3. Or keep it `true` and use the bypass token: `?maintenance_token=help4kids-maintenance-2024`

## Step 8: Verify Deployment

1. Visit `https://yourdomain.com` in your browser
2. Check browser console for any errors
3. Test API connectivity
4. Verify SSL certificate is working

## Troubleshooting

### Nginx 502 Bad Gateway
- Check if backend is running: `sudo systemctl status your-backend-service`
- Check nginx error logs: `sudo tail -f /var/log/nginx/error.log`

### 404 Errors on Routes
- Ensure nginx config has `try_files $uri $uri/ /index.html;`
- Check file permissions: `sudo chown -R www-data:www-data /var/www/help4kids_front`

### SSL Issues
- Verify DNS is pointing to your VPS: `dig yourdomain.com`
- Check firewall allows ports 80 and 443: `sudo ufw status`

### API Connection Issues
- Verify API base URL in `app_config.dart`
- Check CORS settings on backend
- Test API directly: `curl https://yourdomain.com/api/health`

## Maintenance

### Updating the Application

1. Build new version locally
2. Upload new files to VPS
3. Clear browser cache or use version query parameter

### Monitoring

```bash
# Check nginx status
sudo systemctl status nginx

# View nginx access logs
sudo tail -f /var/log/nginx/access.log

# View nginx error logs
sudo tail -f /var/log/nginx/error.log
```

## Security Checklist

- [ ] SSL certificate installed and auto-renewal configured
- [ ] Firewall configured (ports 80, 443 open)
- [ ] Nginx security headers enabled
- [ ] File permissions set correctly
- [ ] Maintenance mode token is secure
- [ ] API endpoints are protected
- [ ] Regular backups configured

## Support

For issues or questions, check:
- Flutter web deployment: https://docs.flutter.dev/deployment/web
- Nginx documentation: https://nginx.org/en/docs/

