#!/bin/bash

# Single script to build and redeploy the Flutter web frontend
# Usage: ./redeploy.sh [--deploy] [--domain=yourdomain.com]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
DEPLOY=false
DOMAIN=""
VPS_USER=""
VPS_HOST=""
VPS_PATH="/var/www/help4kids_front"
SSH_KEY=""

# Parse arguments
for arg in "$@"; do
  case $arg in
    --deploy)
      DEPLOY=true
      shift
      ;;
    --domain=*)
      DOMAIN="${arg#*=}"
      shift
      ;;
    --vps-user=*)
      VPS_USER="${arg#*=}"
      shift
      ;;
    --vps-host=*)
      VPS_HOST="${arg#*=}"
      shift
      ;;
    --vps-path=*)
      VPS_PATH="${arg#*=}"
      shift
      ;;
    --ssh-key=*)
      SSH_KEY="${arg#*=}"
      shift
      ;;
    -h|--help)
      echo "Usage: ./redeploy.sh [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  --deploy              Automatically deploy to VPS after build"
      echo "  --domain=DOMAIN       Domain name for deployment"
      echo "  --vps-user=USER       VPS SSH username"
      echo "  --vps-host=HOST       VPS hostname or IP"
      echo "  --vps-path=PATH       Deployment path on VPS (default: /var/www/help4kids_front)"
      echo "  --ssh-key=PATH        Path to SSH private key"
      echo "  -h, --help            Show this help message"
      echo ""
      echo "Environment variables (alternative to command line args):"
      echo "  VPS_USER              VPS SSH username"
      echo "  VPS_HOST              VPS hostname or IP"
      echo "  VPS_PATH              Deployment path on VPS"
      echo "  SSH_KEY               Path to SSH private key"
      echo ""
      echo "Examples:"
      echo "  ./redeploy.sh                                    # Build only"
      echo "  ./redeploy.sh --deploy                           # Build and deploy (uses env vars)"
      echo "  ./redeploy.sh --deploy --vps-user=user --vps-host=1.2.3.4"
      exit 0
      ;;
    *)
      echo -e "${RED}Unknown option: $arg${NC}"
      echo "Use --help for usage information"
      exit 1
      ;;
  esac
done

# Load from config file if it exists
if [ -f "deploy.config" ]; then
    echo -e "${BLUE}📋 Loading configuration from deploy.config...${NC}"
    source deploy.config
fi

# Load from environment variables if not provided via args or config
VPS_USER=${VPS_USER:-${DEPLOY_VPS_USER:-""}}
VPS_HOST=${VPS_HOST:-${DEPLOY_VPS_HOST:-""}}
VPS_PATH=${VPS_PATH:-${DEPLOY_VPS_PATH:-"/var/www/help4kids_front"}}
SSH_KEY=${SSH_KEY:-${DEPLOY_SSH_KEY:-""}}
DOMAIN=${DOMAIN:-${DEPLOY_DOMAIN:-""}}

echo -e "${BLUE}🚀 Frontend Redeployment Script${NC}"
echo ""

# Step 1: Clean and get dependencies
echo -e "${BLUE}📦 Step 1: Preparing dependencies...${NC}"
flutter clean
flutter pub get

# Step 2: Generate code
echo -e "${BLUE}⚙️  Step 2: Generating code...${NC}"
flutter pub run build_runner build --delete-conflicting-outputs

# Step 3: Build for production
echo -e "${BLUE}🏗️  Step 3: Building for production...${NC}"
flutter build web --release --base-href /

# Check if build was successful
if [ ! -d "build/web" ]; then
    echo -e "${RED}❌ Build failed!${NC}"
    exit 1
fi

# Show build size
BUILD_SIZE=$(du -sh build/web | cut -f1)
echo -e "${GREEN}✅ Build successful!${NC}"
echo -e "${GREEN}📊 Build size: $BUILD_SIZE${NC}"
echo ""

# Step 4: Deploy if requested
if [ "$DEPLOY" = true ]; then
    echo -e "${BLUE}🚀 Step 4: Deploying to VPS...${NC}"
    
    # Validate deployment settings
    if [ -z "$VPS_USER" ] || [ -z "$VPS_HOST" ]; then
        echo -e "${RED}❌ Deployment requires VPS_USER and VPS_HOST${NC}"
        echo "Set them via:"
        echo "  - Command line: --vps-user=USER --vps-host=HOST"
        echo "  - Environment variables: export DEPLOY_VPS_USER=USER DEPLOY_VPS_HOST=HOST"
        exit 1
    fi
    
    # Build SSH command
    SSH_CMD="ssh"
    if [ -n "$SSH_KEY" ]; then
        SSH_CMD="$SSH_CMD -i $SSH_KEY"
    fi
    SSH_CMD="$SSH_CMD $VPS_USER@$VPS_HOST"
    
    # Build rsync command
    RSYNC_CMD="rsync -avz --delete"
    if [ -n "$SSH_KEY" ]; then
        RSYNC_CMD="$RSYNC_CMD -e 'ssh -i $SSH_KEY'"
    fi
    RSYNC_CMD="$RSYNC_CMD build/web/ $VPS_USER@$VPS_HOST:$VPS_PATH/"
    
    echo -e "${YELLOW}📤 Uploading files to $VPS_USER@$VPS_HOST:$VPS_PATH${NC}"
    
    # Create directory on VPS if it doesn't exist
    $SSH_CMD "mkdir -p $VPS_PATH" || {
        echo -e "${RED}❌ Failed to create directory on VPS${NC}"
        exit 1
    }
    
    # Upload files
    eval $RSYNC_CMD || {
        echo -e "${RED}❌ Deployment failed!${NC}"
        exit 1
    }
    
    # Set permissions for nginx
    echo -e "${YELLOW}🔐 Setting permissions...${NC}"
    $SSH_CMD "chown -R nginx:nginx $VPS_PATH && chmod -R 755 $VPS_PATH" || {
        echo -e "${YELLOW}⚠️  Warning: Could not set permissions${NC}"
    }
    
    echo -e "${GREEN}✅ Deployment successful!${NC}"
    echo ""
    
    if [ -n "$DOMAIN" ]; then
        echo -e "${GREEN}🌐 Your app should be available at: https://$DOMAIN${NC}"
    fi
else
    echo -e "${YELLOW}ℹ️  Build complete. Files are in build/web/${NC}"
    echo -e "${YELLOW}   To deploy, run: ./redeploy.sh --deploy${NC}"
fi

echo ""
echo -e "${GREEN}✨ Done!${NC}"

