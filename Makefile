.PHONY: help install dev build start clean gallery test

# Default target
help:
	@echo "Hanzo Templates Monorepo - Available Commands"
	@echo ""
	@echo "Setup:"
	@echo "  make install          Install all dependencies (pnpm)"
	@echo "  make clean            Remove all node_modules"
	@echo ""
	@echo "Development:"
	@echo "  make dev              Start gallery dev server"
	@echo "  make build            Build gallery for production"
	@echo "  make start            Start gallery production server"
	@echo ""
	@echo "Gallery:"
	@echo "  make gallery          Alias for 'make dev'"
	@echo "  make gallery-build    Build gallery app"
	@echo ""
	@echo "Tools:"
	@echo "  make capture          Capture screenshots of all templates"
	@echo "  make test             Run tests"
	@echo ""

# Installation
install:
	@echo "📦 Installing dependencies with pnpm..."
	pnpm install
	@echo "✅ Installation complete"

# Development
dev:
	@echo "🚀 Starting gallery dev server..."
	pnpm dev

gallery:
	@$(MAKE) dev

# Build
build:
	@echo "🏗️  Building gallery for production..."
	pnpm build

# Start production server
start:
	@echo "▶️  Starting gallery production server..."
	pnpm start

# Clean
clean:
	@echo "🧹 Removing all node_modules..."
	pnpm clean
	@echo "✅ Cleanup complete"

# Gallery specific
gallery-build:
	@echo "🏗️  Building gallery app..."
	pnpm gallery:build

# Screenshot capture
capture:
	@echo "📸 Capturing template screenshots..."
	pnpm capture

capture-quick:
	@echo "📸 Quick screenshot capture..."
	pnpm capture:quick

# Test
test:
	@echo "🧪 Running tests..."
	@if [ -f "test-gallery-monorepo.js" ]; then \
		node test-gallery-monorepo.js; \
	else \
		echo "No tests configured"; \
	fi
