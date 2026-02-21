#!/bin/bash

echo "🚀 Starting Hanzo Template Gallery..."
echo "=================================="

# Kill any existing processes on our ports
for port in 3000 3001 3002 3003 3004 3005 3006 3007 3008; do
  lsof -ti:$port | xargs kill -9 2>/dev/null
done

# Start gallery on port 3000
cd /Users/z/work/hanzo/templates/gallery
PORT=3000 npm run dev > /dev/null 2>&1 &
echo "✓ Gallery started on http://localhost:3000"

# Start DevForge on port 3001
cd /Users/z/work/hanzo/templates/devtool
PORT=3001 npm run dev > /dev/null 2>&1 &
echo "✓ DevForge started on http://localhost:3001"

# Start MobileFirst on port 3002
cd /Users/z/work/hanzo/templates/mobile
PORT=3002 npm run dev > /dev/null 2>&1 &
echo "✓ MobileFirst started on http://localhost:3002"

# Start SaaSify on port 3003
cd /Users/z/work/hanzo/templates/saas
PORT=3003 npm run dev > /dev/null 2>&1 &
echo "✓ SaaSify started on http://localhost:3003"

# Start StartupKit on port 3004
cd /Users/z/work/hanzo/templates/startup
PORT=3004 npm run dev > /dev/null 2>&1 &
echo "✓ StartupKit started on http://localhost:3004"

# Start AnalyticsDash on port 3005
cd /Users/z/work/hanzo/templates/analytics
PORT=3005 npm run dev > /dev/null 2>&1 &
echo "✓ AnalyticsDash started on http://localhost:3005"

# Start Blog on port 3006
cd /Users/z/work/hanzo/templates/blog
PORT=3006 npm run dev > /dev/null 2>&1 &
echo "✓ Blog started on http://localhost:3006"

# Start Changelog on port 3007
cd /Users/z/work/hanzo/templates/changelog
PORT=3007 npm run dev > /dev/null 2>&1 &
echo "✓ Changelog started on http://localhost:3007"

# Start Portfolio on port 3008
cd /Users/z/work/hanzo/templates/portfolio
PORT=3008 npm run dev > /dev/null 2>&1 &
echo "✓ Portfolio started on http://localhost:3008"

echo ""
echo "=================================="
echo "🎉 All templates are running!"
echo "📊 Open Gallery at http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop all servers"

# Keep script running
wait